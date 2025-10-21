#include "proc.h"
#include "trap.h"
#include "uart.h"
#include "defs.h"

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
                spin_unlock(&proc_lock);
                return 0;
            }
            
            // 分配内核栈 (4KB)
            p->kstack = (char *)alloc_page();
            if (!p->kstack) {
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

/**
 * 简单的轮转调度器
 * 参考xv6的scheduler()实现
 */
void scheduler(void) {
    uart_puts("[proc] Scheduler started\n");
    
    struct proc *p;
    struct cpu *c = &cpus[0];  // 单核
    c->proc = 0;
    
    for (;;) {
        // 启用中断，允许设备中断
        intr_on();
        
        // 查找第一个RUNNABLE进程
        int found = 0;
        for (p = proc; p < &proc[NPROC]; p++) {
            if (p->state == RUNNABLE) {
                // 切换到这个进程
                p->state = RUNNING;
                c->proc = p;
                current_proc = p;
                
                printf("[proc] Switching to process %d\n", p->pid);
                
                // 执行进程 (这里是简化实现)
                // 实际实现中，这里应该执行用户程序
                // 在xv6中，通过上下文切换进入process_entry
                
                // 暂时为了测试，我们直接返回
                p->state = RUNNABLE;
                
                found = 1;
                break;
            }
        }
        
        if (!found) {
            // 没有可运行的进程
            uart_puts("[proc] No runnable process, idling...\n");
            // 实际实现中应该等待中断
            // 这里简化为返回
            return;
        }
    }
}

/**
 * 放弃CPU，让出给其他进程
 */
void yield(void) {
    struct proc *p = current_proc;
    if (p) {
        spin_lock(&proc_lock);
        if (p->state == RUNNING) {
            p->state = RUNNABLE;
        }
        spin_unlock(&proc_lock);
    }
    
    // 调度到下一个进程
    scheduler();
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
