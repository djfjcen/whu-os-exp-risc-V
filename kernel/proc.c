#include "proc.h"
#include "trap.h"
#include "uart.h"
#include "defs.h"

// 前向声明
extern volatile uint64 ticks;
uint64 get_ticks(void);

// 手动实现memset和memcpy（因为我们没有链接libc）
static void* memset_impl(void *s, int c, unsigned long n) {
    char *p = (char *)s;
    for (unsigned long i = 0; i < n; i++) {
        p[i] = c;
    }
    return s;
}

static void* memcpy_impl(void *dest, const void *src, unsigned long n) {
    char *d = (char *)dest;
    const char *s = (const char *)src;
    for (unsigned long i = 0; i < n; i++) {
        d[i] = s[i];
    }
    return dest;
}

#define memset memset_impl
#define memcpy memcpy_impl

// 进程表和全局状态
struct proc proc[NPROC];
struct proc *current_proc = 0;
int nextpid = 1;
struct cpu cpus[1];  // 简化：只支持单核

// 自旋锁 (简化实现)
typedef struct {
    int locked;
} spinlock_t;

static spinlock_t proc_lock = {0};

static void spin_lock(spinlock_t *lock) {
    while (__sync_lock_test_and_set(&lock->locked, 1)) {
        // 自旋等待
    }
}

static void spin_unlock(spinlock_t *lock) {
    __sync_lock_release(&lock->locked);
}

/**
 * 初始化进程系统
 */
void proc_init(void) {
    uart_puts("[proc] Initializing process system...\n");
    
    memset(proc, 0, sizeof(proc));
    nextpid = 1;
    current_proc = 0;
    
    // 初始化进程表
    for (int i = 0; i < NPROC; i++) {
        proc[i].state = UNUSED;
        proc[i].pid = 0;
        proc[i].ppid = 0;
    }
    
    uart_puts("[proc] Process system initialized\n");
}

/**
 * 分配新进程结构
 */
struct proc* alloc_proc(void) {
    spin_lock(&proc_lock);
    
    struct proc *p = 0;
    
    // 在进程表中查找未使用的槽位
    for (int i = 0; i < NPROC; i++) {
        if (proc[i].state == UNUSED) {
            p = &proc[i];
            p->state = USED;
            p->pid = nextpid++;
            p->ppid = 0;
            p->killed = 0;
            p->xstate = 0;
            
            // 分配陷阱帧
            p->trapframe = alloc_trapframe();
            if (!p->trapframe) {
                uart_puts("[proc] Failed to allocate trapframe\n");
                spin_unlock(&proc_lock);
                return 0;
            }
            
            // 分配内核栈 (4KB)
            p->kstack = (char *)alloc_page();
            if (!p->kstack) {
                uart_puts("[proc] Failed to allocate kernel stack\n");
                free_trapframe(p->trapframe);
                spin_unlock(&proc_lock);
                return 0;
            }
            
            // 初始化上下文
            memset(&p->context, 0, sizeof(p->context));
            p->context.sp = (uint64)p->kstack + PAGE_SIZE;  // 栈顶
            
            printf("[proc] Allocated process: pid=%d\n", p->pid);
            
            spin_unlock(&proc_lock);
            return p;
        }
    }
    
    spin_unlock(&proc_lock);
    uart_puts("[proc] No free process slot\n");
    return 0;
}

/**
 * 释放进程
 */
void free_proc(struct proc *p) {
    if (!p) return;
    
    spin_lock(&proc_lock);
    
    if (p->trapframe) {
        free_trapframe(p->trapframe);
        p->trapframe = 0;
    }
    
    if (p->kstack) {
        free_page(p->kstack);
        p->kstack = 0;
    }
    
    if (p->pagetable) {
        destroy_pagetable(p->pagetable);
        p->pagetable = 0;
    }
    
    p->state = UNUSED;
    p->pid = 0;
    
    spin_unlock(&proc_lock);
}

/**
 * 按PID查找进程
 */
struct proc* find_proc(int pid) {
    for (int i = 0; i < NPROC; i++) {
        if (proc[i].pid == pid && proc[i].state != UNUSED) {
            return &proc[i];
        }
    }
    return 0;
}

/**
 * 设置进程内核栈
 */
void proc_set_kernel_stack(struct proc *p, char *kstack) {
    if (p) {
        p->kstack = kstack;
        p->context.sp = (uint64)kstack + PAGE_SIZE;
    }
}

/**
 * 标记进程为可运行
 */
void proc_mark_runnable(struct proc *p) {
    if (p && p->state != RUNNABLE && p->state != RUNNING && p->state != ZOMBIE) {
        p->state = RUNNABLE;
    }
}

/**
 * 标记进程为睡眠
 */
void proc_mark_sleeping(struct proc *p, void *chan) {
    if (p && p->state == RUNNING) {
        p->state = SLEEPING;
        p->chan = chan;
    }
}

/**
 * 标记进程为僵尸
 */
void proc_mark_zombie(struct proc *p, int xstate) {
    if (p && p->state != ZOMBIE) {
        p->state = ZOMBIE;
        p->xstate = xstate;
    }
}

/**
 * 获取当前进程的PID
 */
int get_pid(void) {
    if (current_proc) {
        return current_proc->pid;
    }
    return -1;
}

/**
 * 获取当前进程结构
 */
struct proc* get_current_proc(void) {
    return current_proc;
}

/**
 * 设置当前进程
 */
void set_current_proc(struct proc *p) {
    current_proc = p;
}

// 调度器的上下文 (调度器本身的执行状态)
static struct context scheduler_context;
static int scheduler_initialized = 0;

/**
 * 简单的轮转调度器
 * 参考xv6的scheduler()实现
 * 
 * 调度算法：轮转调度
 * - 遍历进程表，找到第一个RUNNABLE的进程
 * - 通过switch_context切换到该进程
 * - 当进程让出CPU时，恢复到scheduler继续循环
 */
void scheduler(void) {
    if (!scheduler_initialized) {
        uart_puts("[proc] Scheduler started\n");
        scheduler_initialized = 1;
    }
    
    struct proc *p;
    struct cpu *c = &cpus[0];  // 单核
    c->proc = 0;
    
    intr_off();  // 关闭中断
    
    for (;;) {
        // 启用中断，允许设备中断
        intr_on();
        
        // 查找可运行的进程，使用轮转算法
        int found = 0;
        static int last_index = 0;
        
        for (int i = 0; i < NPROC; i++) {
            int idx = (last_index + i) % NPROC;
            p = &proc[idx];
            
            if (p->state == RUNNABLE) {
                // 切换到这个进程
                p->state = RUNNING;
                c->proc = p;
                current_proc = p;
                
                // 保存scheduler的当前上下文
                // 切换到进程的上下文
                printf("[proc] Scheduler: switching to process %d\n", p->pid);
                
                intr_off();  // 关闭中断以保护上下文切换
                
                // 上下文切换: scheduler_context -> p->context
                // switch_context保存当前(scheduler)的context，恢复目标进程的context
                switch_context(&scheduler_context, &p->context);
                
                // 进程通过yield()回到这里
                // 继续循环找下一个RUNNABLE进程
                intr_on();
                
                last_index = (idx + 1) % NPROC;
                found = 1;
                break;
            }
        }
        
        if (!found) {
            // 没有可运行的进程
            printf("[proc] No runnable process, ticks=%ld\n", get_ticks());
        }
    }
}

/**
 * 放弃CPU，让出给其他进程
 * 
 * yield流程：
 * 1. 关闭中断（保护）
 * 2. 标记当前进程为RUNNABLE
 * 3. 通过switch_context切换回scheduler
 * 4. scheduler会选择下一个进程运行
 */
void yield(void) {
    struct proc *p = current_proc;
    if (!p) return;
    
    intr_off();  // 关闭中断
    
    spin_lock(&proc_lock);
    if (p->state == RUNNING) {
        p->state = RUNNABLE;
    }
    spin_unlock(&proc_lock);
    
    printf("[proc] Process %d yielding CPU\n", p->pid);
    
    // 上下文切换: 当前进程context -> scheduler context
    // switch_context保存当前进程的context，恢复scheduler的context
    // 这会回到scheduler()函数中的switch_context调用之后
    switch_context(&p->context, &scheduler_context);
    
    // 当这个进程再次被调度时，会从这里继续执行
    intr_on();  // 重新启用中断
}

/**
 * 创建子进程 (fork系统调用)
 * 简化实现：仅分配进程，不复制内存
 */
int fork(void) {
    struct proc *p = current_proc;
    if (!p) {
        uart_puts("[proc] fork: no current process\n");
        return -1;
    }
    
    // 分配新进程
    struct proc *np = alloc_proc();
    if (!np) {
        uart_puts("[proc] fork: failed to allocate process\n");
        return -1;
    }
    
    // 设置父子关系
    np->parent = p;
    np->ppid = p->pid;
    
    // 简化：复制页表（实际应该使用写时复制）
    if (p->pagetable) {
        np->pagetable = create_pagetable();
        if (!np->pagetable) {
            free_proc(np);
            return -1;
        }
        // TODO: 复制内存内容
    }
    
    // 复制陷阱帧（用于返回值）
    if (p->trapframe && np->trapframe) {
        memcpy(np->trapframe, p->trapframe, sizeof(struct trapframe));
        // 子进程的返回值应该是0
        np->trapframe->a0 = 0;
    }
    
    // 标记为可运行
    np->state = RUNNABLE;
    
    printf("[proc] fork: created process %d (parent %d)\n", np->pid, p->pid);
    
    // 父进程返回子进程PID
    return np->pid;
}

/**
 * 进程退出
 */
void exit(int status) {
    struct proc *p = current_proc;
    if (!p) return;
    
    spin_lock(&proc_lock);
    
    // 标记为僵尸进程
    p->xstate = status;
    p->state = ZOMBIE;
    
    // 重新绑定子进程给init进程 (这里简化)
    for (int i = 0; i < NPROC; i++) {
        if (proc[i].parent == p) {
            proc[i].parent = 0;
            proc[i].ppid = 1;  // 假设pid=1是init进程
        }
    }
    
    printf("[proc] exit: process %d exited with status %d\n", p->pid, status);
    
    spin_unlock(&proc_lock);
    
    // 调度到其他进程
    yield();
}

/**
 * 等待子进程
 */
int wait(int *status) {
    struct proc *p = current_proc;
    if (!p) return -1;
    
    for (;;) {
        spin_lock(&proc_lock);
        
        // 查找任何ZOMBIE子进程
        int found = 0;
        struct proc *zombie = 0;
        
        for (int i = 0; i < NPROC; i++) {
            if (proc[i].parent == p && proc[i].state == ZOMBIE) {
                zombie = &proc[i];
                found = 1;
                break;
            }
        }
        
        if (found) {
            // 找到了僵尸子进程
            int pid = zombie->pid;
            if (status) {
                *status = zombie->xstate;
            }
            
            // 清理进程
            free_proc(zombie);
            
            printf("[proc] wait: reaped process %d\n", pid);
            
            spin_unlock(&proc_lock);
            return pid;
        }
        
        // 没有子进程
        int has_children = 0;
        for (int i = 0; i < NPROC; i++) {
            if (proc[i].parent == p && proc[i].state != UNUSED) {
                has_children = 1;
                break;
            }
        }
        
        if (!has_children) {
            spin_unlock(&proc_lock);
            return -1;
        }
        
        spin_unlock(&proc_lock);
        
        // 睡眠等待子进程 (简化：直接睡眠)
        sleep(p);  // 在子进程exit时会被唤醒
    }
}

/**
 * 杀死进程
 */
void kill(int pid) {
    struct proc *p = find_proc(pid);
    if (p) {
        spin_lock(&proc_lock);
        p->killed = 1;
        if (p->state == SLEEPING) {
            p->state = RUNNABLE;
        }
        spin_unlock(&proc_lock);
    }
}

/**
 * 睡眠直到被唤醒
 * chan: 等待通道 (可以是任何指针值)
 */
void sleep(void *chan) {
    struct proc *p = current_proc;
    if (!p) return;
    
    spin_lock(&proc_lock);
    
    // 标记为睡眠
    p->state = SLEEPING;
    p->chan = chan;
    
    spin_unlock(&proc_lock);
    
    // 让出CPU
    yield();
}

/**
 * 唤醒所有睡眠在指定通道上的进程
 */
void wakeup(void *chan) {
    spin_lock(&proc_lock);
    
    for (int i = 0; i < NPROC; i++) {
        if (proc[i].state == SLEEPING && proc[i].chan == chan) {
            proc[i].state = RUNNABLE;
        }
    }
    
    spin_unlock(&proc_lock);
}

/**
 * 唤醒一个睡眠在指定通道上的进程
 */
void wakeup_one(void *chan) {
    spin_lock(&proc_lock);
    
    for (int i = 0; i < NPROC; i++) {
        if (proc[i].state == SLEEPING && proc[i].chan == chan) {
            proc[i].state = RUNNABLE;
            break;
        }
    }
    
    spin_unlock(&proc_lock);
}
