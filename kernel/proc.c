#include "proc.h"
#include "memlayout.h"

// 定义在 trampoline.S 中
extern char trampoline[];
extern char userret[];
extern int uvm_copy_entire( pgtbl_addr_t src, pgtbl_addr_t dst );

/// @brief 由于是单线程程序，所以直接使用全局变量保存当前进程指针
struct Process* curr_proc;
/// @brief scheduler 调用时的上下文
struct Context* sched_context;

/// @brief 初始进程的指针
struct Process* init_proc;

int is_killed( struct Process* p ) {
    return p->is_killed;
}

void set_killed( struct Process* p ) {
    p->is_killed = 1;
}

/// @brief 从 kernel trap 返回 user space 后的第一个函数，它会在第一次调度时被调用
/// @param  
void before_userret( void ) {
    static int first = 1;

    if ( first ) {
        first = 0;

        // TODO：初始进程的省略
    }

    prepare_return();

    u64 satp = MAKE_SATP( curr_proc->page_table );

    // 计算出 trampoline 中 userret 部分代码的地址
    addr_t trampoline_userret = TRAMPOLINE + ( userret - trampoline );

    // 调试信息太噪，注释掉
    // printf( "before_userret: calling trampoline userret with satp=0x%x, epc=0x%x, sp=0x%x\n",
    //    satp, curr_proc->trapframe->epc, curr_proc->trapframe->sp );

    ( ( void ( * )( u64 ) ) trampoline_userret )( satp );
}

struct Process processes[NPROC];

struct Process* init_proc;

/// @brief 根据 PID 查找并杀死对应的进程
/// @param pid 要杀死的进程号
/// @return 成功返回 0，进程不存在返回 -1
int kkill( int pid ) {
    struct Process* p;

    for ( p = processes; p < &processes[NPROC]; p++ ) {
        if ( p->pid == pid ) {
            set_killed( p );
            return 0;
        }
    }

    return -1;
}

/// @brief 初始化进程表，将所有进程结构体标记为 UNUSED 状态
void process_init() {
    for ( int i = 0; i < NPROC; i++ ) {
        // printf( "process_init: initializing process at %d\n", i );

        struct Process* proc = &processes[i];

        proc->state = UNUSED;
        proc->kstack = KSTACK( ( int ) ( proc - processes ) );
    }

    // 初始化 scheduler context，供第一次 swtch 使用
    sched_context = ( struct Context* ) alloc_page();
    if ( sched_context == 0 ) {
        panic( "process_init: alloc_page for sched_context failed" );
    }

    // 清零并设置返回地址和栈顶
    mem_set( ( addr_t ) sched_context, 0, PAGE_SIZE );
    sched_context->ra = ( u64 ) scheduler;
    sched_context->sp = ( u64 ) ( ( addr_t ) sched_context + PAGE_SIZE );
}

/// @brief 在内核页表中为每个进程映射内核栈，并设置其权限为 RW
/// @param kpgtbl 
void proc_map_stack( pgtbl_addr_t kpgtbl ) {
    struct Process* proc;

    for ( proc = &processes[0]; proc < &processes[NPROC]; proc++ ) {
        addr_t pa = alloc_page();

        if ( pa == 0 ) {
            panic( "proc_map_statck: alloc_page failed" );
        }

        addr_t va = KSTACK( ( int ) ( proc - processes ) );

        kvm_map( kpgtbl, va, pa, PAGE_SIZE, PTE_R | PTE_W );
    }
}

int next_pid = 1;

int alloc_pid( void ) {
    return next_pid++;
}

/// @brief 分配一个新的进程页表
/// @param p 
/// @return 如果分配失败，返回 0
pgtbl_addr_t alloc_proc_pgtbl( struct Process* p ) {
    pgtbl_addr_t pgtbl = uvm_make();

    if ( pgtbl == 0 ) {
        return 0;
    }

    // printf( "alloc_proc_pgtbl: allocated new page table for pid %d\n", p->pid );

    // 静态映射 trampoline 代码段
    if ( map_pages(
        pgtbl,
        ( addr_t ) TRAMPOLINE,
        PAGE_SIZE,
        ( addr_t ) trampoline,
        PTE_R | PTE_X ) != 0
        ) {
        // trampoline 映射失败，可以直接 free 页表
        uvm_free( pgtbl, PAGE_SIZE );

        return 0;
    }

    // printf( "alloc_proc_pgtbl: mapped trampoline for pid %d\n", p->pid );

    // 映射本进程的 trapframe
    if ( map_pages(
        pgtbl,
        ( addr_t ) TRAPFRAME,
        PAGE_SIZE,
        ( addr_t ) p->trapframe,
        PTE_R | PTE_W ) != 0
        ) {
        // 由于在这一步 trampoline 已经映射成功，因此需要先解除映射
        uvm_unmap( pgtbl, ( u64 ) TRAMPOLINE, 1, 0 );

        uvm_free( pgtbl, PAGE_SIZE );

        return 0;
    }

    // printf( "alloc_proc_pgtbl: mapped trapframe for pid %d\n", p->pid );

    return pgtbl;
}
/// @brief 释放一个进程页表
/// @param pgtbl
void free_proc_pgtbl( pgtbl_addr_t pgtbl, u64 size ) {
    // printf( "free_proc_pgtbl: freeing process page table\n" );

    uvm_unmap( pgtbl, ( u64 ) TRAMPOLINE, 1, 0 );

    // printf( "free_proc_pgtbl: unmapped trampoline\n" );

    uvm_unmap( pgtbl, ( u64 ) TRAPFRAME, 1, 0 );

    // printf( "free_proc_pgtbl: unmapped trapframe\n" );

    // 额外确保用户栈区域也被解除映射（防止 mem_size 未包含栈时遗留叶节点）
    uvm_unmap( pgtbl, ( addr_t ) USER_STACK_BASE, USER_STACK_SIZE / PAGE_SIZE, 1 );

    uvm_free( pgtbl, size );
}

/// @brief 释放一个进程及其相关资源
void free_process( struct Process* p ) {
    if ( !p ) {
        return;
    }

    if ( p->page_table ) {
        free_proc_pgtbl( p->page_table, p->mem_size );
        p->page_table = 0;
    }

    if ( p->trapframe ) {
        free_page( ( addr_t ) p->trapframe );
        p->trapframe = 0;
    }

    p->ex_status = 0;
    p->is_killed = 0;
    p->parent = 0;
    p->state = UNUSED;
}

/// @brief 在分配成功后初始化一个进程结构体
/// @param p 
/// @return 如果初始化失败返回 0
int init_process( struct Process* proc ) {
    if ( !proc ) {
        return 0;
    }

    proc->state = USED;
    proc->pid = alloc_pid();

    // 为本进程 trapframe 分配实际的物理页
    if ( ( proc->trapframe = ( struct TrapFrame* ) alloc_page() ) == 0 ) {
        free_process( proc );
        return 0;
    }

    // 为本进程分配页表
    // 需要注意的是，对于任何进程来说，trapframe 的虚拟地址
    // 实际上都是相同的，只是实际的物理页不同而已
    if ( ( proc->page_table = alloc_proc_pgtbl( proc ) ) == 0 ) {
        free_process( proc );
        return 0;
    }

    // 清空 context 结构体
    mem_set( ( addr_t ) &proc->context, 0, sizeof( struct Context ) );

    // 设置进程的返回地址为 before_userret 函数
    proc->context.ra = ( u64 ) before_userret;
    // 设置进程的栈指针为进程结构体的顶部
    proc->context.sp = ( u64 ) ( proc->kstack + PAGE_SIZE );

    return 1;
}

/// @brief 分配一个新的进程结构体
/// @return 返回分配到的进程结构体指针，分配失败则返回 0
struct Process* alloc_process( void ) {
    // printf( "alloc_process: called\n" );

    // 从静态的 processes 数组中分配一个进程结构体
    for ( int i = 0; i < NPROC; i++ ) {
        struct Process* p = &processes[i];

        if ( p->state != UNUSED ) {
            continue;
        }

        if ( init_process( p ) != 0 ) {
            return p;
        }
    }

    // printf( "alloc_process: no available process slots\n" );

    return 0;
}

struct Process* init_proc = 0;

void user_init() {
    if ( ( init_proc = alloc_process() ) == 0 ) {
        panic( "user_init: init_proc" );
    }

    curr_proc = init_proc;

    // printf( "user_init: allocated init_proc with pid %d\n", init_proc->pid );

    if ( kexec( 0, 0 ) != 0 ) {
        panic( "user_init: kexec" );
    }

    // printf( "user_init: kexec succeeded for init_proc\n" );

    curr_proc = 0;

    init_proc->state = RUNNABLE;

    // TODO: 省略了 cwd 相关的文件系统初始化
}

/// @brief 在内核状态下，分配一个新的进程，并复制当前进程的内容到新进程中
/// @return 子进程 pid，失败则返回 -1
int kfork() {
    struct Process* np = alloc_process();

    if ( np == 0 ) {
        return -1;
    }

    // 复制父进程的页表内容到子进程（复制所有已映射的用户页）
    if ( uvm_copy_entire( curr_proc->page_table, np->page_table ) != 0 ) {
        free_process( np );
        return -1;
    }

    np->mem_size = curr_proc->mem_size;

    // 复制父进程的 trapframe 内容到子进程
    mem_move( np->trapframe, curr_proc->trapframe, sizeof( struct TrapFrame ) );

    // 设置子进程的 a0 寄存器为 0，以便区分父子进程
    np->trapframe->a0 = 0;

    np->parent = curr_proc;

    np->trapframe->epc = curr_proc->trapframe->epc;

    np->state = RUNNABLE;

    return np->pid;
}

extern void swtch( struct Context* old, struct Context* new );

/// @brief 核心调度函数，负责选择下一个要运行的进程
/// @param  
void scheduler( void ) {
    curr_proc = 0;
    // 无限循环进行调度
    while ( 1 ) {
        // 启动中断以防止死锁
        interrupt_on();

        // 关闭中断，以防止在下面 WFI 和中断之间的竞争条件
        interrupt_off();


        int found = 0;

        // 每次循环都从进程表开头扫描，确保刚被 wakeup() 的进程能被调度到
        for ( int idx = 0; idx < NPROC; idx++ ) {
            struct Process* p = &processes[idx];

            if ( p->state == RUNNABLE ) {

                p->state = RUNNING;

                curr_proc = p;

                // perform context switch
                swtch( sched_context, &p->context );

                // 在这里进程已经完成运行
                curr_proc = 0;

                found = 1;
            }
        }

        if ( found == 0 ) {
            // 无可调用进程，等待中断唤醒
            asm volatile( "wfi" );
        }
    }
}

/// @brief 切换到 scheduler 进行调度，在进程视角，它是在同一个上下文中运行 sched 的
/// @brief 也就是说，一个进程可以无感地调用 sched
/// @param  
void sched( void ) {
    // int intena;

    // if ( !holding( &p->lock ) )
    //     panic( "sched p->lock" );
    // if ( mycpu()->noff != 1 )
    //     panic( "sched locks" );
    if ( curr_proc->state == RUNNING )
        panic( "sched RUNNING" );
    // 保存中断使能状态：按设计 sched 应该在中断被关闭时调用。
    // 但为了提高健壮性，如果调用方未关闭中断，则在切换期间临时关闭并在返回后恢复。
    int intena = is_interupt_on();
    if ( intena ) {
        // 记录并临时关闭中断
        interrupt_off();
    }

    swtch( &curr_proc->context, sched_context );

    // 返回时恢复中断状态
    if ( intena )
        interrupt_on();
}

/// @brief 让出 CPU，进入调度状态
/// @param  
void yield( void ) {
    curr_proc->state = RUNNABLE;

    sched();
}

/// @brief 等待在指定 chan 上，等待被唤醒
/// @param chan 
void sleep( void* chan ) {
    curr_proc->waiting_chan = ( addr_t ) chan;
    curr_proc->state = SLEEPING;

    sched();

    curr_proc->waiting_chan = 0;
}

/// @brief 遍历所有进程，将在指定等待 chan 上睡眠的进程唤醒
/// @param chan 
void wakeup( void* chan ) {
    struct Process* p;

    for ( p = processes; p < &processes[NPROC]; p++ ) {
        if ( p->state == SLEEPING && p->waiting_chan == ( addr_t ) chan ) {
            p->state = RUNNABLE;
        }
    }
}

/// @brief 终止当前进程的运行并退出
/// @param status 
void kexit( int status ) {
    struct Process* p = curr_proc;

    if ( p == init_proc ) {
        panic( "kexit: init process exiting" );
    }

    // 将所有子进程交给 init 进程处理
    for ( struct Process* np = processes; np < &processes[NPROC]; np++ ) {
        if ( np->parent == p ) {
            np->parent = init_proc;

            // 如果子进程已经是僵尸状态，则让 init 进程回收它
            if ( np->state == ZOMBIE ) {
                // Debug: notify init that one of its children is a zombie
                printf( "kexit: reparented zombie child pid=%d to init\n", np->pid );
                wakeup( ( void* ) init_proc );
            }
        }
    }

    p->ex_status = status;
    p->state = ZOMBIE;

    // 唤醒父进程以便其回收资源
    // printf( "kexit: pid=%d exiting, wakeup parent pid=%d\n", p->pid, p->parent ? p->parent->pid : 0 );
    wakeup( ( void* ) p->parent );

    // 切换到调度器
    sched();

    // 如果 sched 返回，说明出现了不可恢复的错误
    panic( "kexit: should not reach here" );
}

/// @brief 等待子进程退出并回收资源
/// @param uva_status 
/// @return 
int kwait( u64* uva_status ) {
    struct Process* p = curr_proc;

    while ( 1 ) {
        int has_kids = 0;

        struct Process* np;

        for ( np = processes; np < &processes[NPROC]; np++ ) {
            if ( np->parent == p ) {
                has_kids = 1;

                if ( np->state == ZOMBIE ) {
                    // 子进程已退出，回收资源
                    int pid = np->pid;

                    // 如果要求获取退出状态，则复制给用户态
                    if ( uva_status ) {
                        if ( copy_k2u(
                            p->page_table,
                            ( addr_t ) uva_status,
                            ( addr_t ) &np->ex_status,
                            sizeof( np->ex_status )
                        ) != 0 ) {
                            return -1;
                        }
                    }

                    free_process( np );

                    return pid;
                }
            }
        }

        if ( !has_kids || is_killed( p ) ) {
            // 无子进程或被杀死
            return -1;
        }

        // 等待子进程唤醒
        sleep( ( void* ) p );
    }
}