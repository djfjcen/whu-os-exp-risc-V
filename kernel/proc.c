#include "proc.h"
#include "trap.h"
#include "uart.h"
#include "defs.h"
#include "syscall.h"
#include <stddef.h>

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

// xv6-style strlen implementation
int
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    ;
  return n;
}

#define memset memset_impl
#define memcpy memcpy_impl

// 进程表和全局状态
struct proc proc[NPROC];
struct proc *current_proc = 0;
int nextpid = 1;
struct cpu cpus[1];  // 简化：只支持单核

// 抢占标志：当时间中断发生时，调度器应该进行进程切换
volatile int need_resched = 0;

// 全局 tickslock (在main.c中定义)
extern struct spinlock tickslock;

static struct spinlock proc_lock = {0};

static void spin_lock(struct spinlock *lock) {
    while (__sync_lock_test_and_set(&lock->locked, 1)) {
        // 自旋等待
    }
}

static void spin_unlock(struct spinlock *lock) {
    __sync_lock_release(&lock->locked);
}

// 简化的锁接口（兼容xv6风格）
static inline void acquire(struct spinlock *lock) {
    spin_lock(lock);
}

static inline void release(struct spinlock *lock) {
    spin_unlock(lock);
}

// 检查当前CPU是否持有锁（简化实现）
static inline int holding(struct spinlock *lock) {
    return lock->locked;
}

// 获取当前CPU结构（简化：单核）
static inline struct cpu* mycpu(void) {
    return &cpus[0];
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
            p->uid = 0;              // 默认为root用户(uid=0)
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
            
            // 创建用户页表
            p->pagetable = proc_pagetable(p);
            if (p->pagetable == 0) {
                uart_puts("[proc] Failed to create user pagetable\n");
                free_trapframe(p->trapframe);
                free_page(p->kstack);
                p->trapframe = 0;
                p->kstack = 0;
                p->state = UNUSED;
                spin_unlock(&proc_lock);
                return 0;
            }
            
            // 初始化进程大小
            p->sz = 0;
            
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
        proc_freepagetable(p->pagetable, p->sz);
        p->pagetable = 0;
    }
    
    p->sz = 0;
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
 * 获取当前进程（myproc 别名）
 */
struct proc* myproc(void) {
    return current_proc;
}

/**
 * 设置当前进程
 */
void set_current_proc(struct proc *p) {
    current_proc = p;
}

/**
 * 获取当前进程的UID
 */
int get_uid(void) {
    if (current_proc) {
        return current_proc->uid;
    }
    return 0;  // 默认返回root
}

/**
 * 设置当前进程的UID（需要权限检查）
 */
int set_uid(int uid) {
    if (!current_proc) {
        return -1;
    }
    
    // 简化版：只有root(uid=0)可以修改UID
    if (current_proc->uid != 0) {
        printf("[proc] Permission denied: only root can change UID\n");
        return -1;
    }
    
    if (uid < 0 || uid >= NUSER) {
        printf("[proc] Invalid UID: %d (must be 0-%d)\n", uid, NUSER-1);
        return -1;
    }
    
    current_proc->uid = uid;
    printf("[proc] Changed UID to %d for process %d\n", uid, current_proc->pid);
    return 0;
}

/**
 * 统计指定用户的进程数
 */
int count_user_procs(int uid) {
    int count = 0;
    
    for (int i = 0; i < NPROC; i++) {
        acquire(&proc[i].lock);
        if (proc[i].state != UNUSED && proc[i].uid == uid) {
            count++;
        }
        release(&proc[i].lock);
    }
    
    return count;
}

/**
 * 检查用户是否可以fork（是否达到进程数上限）
 */
int can_fork(int uid) {
    int count = count_user_procs(uid);
    
    if (count >= MAX_PROC_PER_USER) {
        printf("[proc] Fork denied: user %d has %d processes (max %d)\n", 
               uid, count, MAX_PROC_PER_USER);
        return 0;
    }
    
    return 1;
}

// 内存管理辅助函数（简化实现）
// 分配用户内存 - 扩展进程地址空间
uint64 allocuvm(pagetable_t pagetable, uint64 oldsz, uint64 newsz) {
    // TODO: 实现完整的用户内存分配
    // 这里返回新的大小表示"成功"
    return newsz;
}

// 释放用户内存 - 收缩进程地址空间
uint64 deallocuvm(pagetable_t pagetable, uint64 oldsz, uint64 newsz) {
    // TODO: 实现完整的用户内存释放
    return newsz;
}

// 切换到用户页表
void switchuvm(struct proc *p) {
    // TODO: 实现页表切换
    // 应该设置 satp 寄存器
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
 * - 当进程让出CPU或被时间中断抢占时，恢复到scheduler继续循环
 */
void scheduler(void) {
    if (!scheduler_initialized) {
        uart_puts("[proc] Scheduler started\n");
        scheduler_initialized = 1;
    }
    
    struct proc *p;
    struct cpu *c = &cpus[0];  // 单核
    static int last_index = 0;

    for (;;) {
        intr_on(); // 允许中断

        // 从上一个停止的地方继续扫描，实现轮转
        int found = 0;
        for (int i = 0; i < NPROC; i++) {
            int idx = (last_index + i) % NPROC;
            p = &proc[idx];
            
            if (p->state == RUNNABLE) {
                p->state = RUNNING;
                c->proc = p;
                current_proc = p;
                need_resched = 0;  // 清除抢占标志
                
                printf("[proc] Scheduler: switching to process %d\n", p->pid);
                
                intr_off();
                switch_context(&scheduler_context, &p->context);
                
                // 当进程 yield() 或被时间中断抢占后回到这里...
                // 进程完成了它的时间片或主动让出CPU
                intr_on();
                
                c->proc = 0;
                current_proc = 0;
                
                // 更新索引，确保下次从该进程的下一个进程开始
                last_index = (idx + 1) % NPROC;
                found = 1;
                break;  // 跳出for循环，回到for(;;)重新扫描
            }
        }

        // 如果一整轮扫描都没有找到 RUNNABLE 进程
        if (!found) {
            // 短暂让出CPU，避免忙轮询
            // 在实际系统中可以使用 wfi() (等待中断)
            // 这里简单等待，然后继续扫描
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
 * 
 * 注意：调用者应该确保在合适的中断状态下调用此函数
 */
void yield(void) {
    struct proc *p = current_proc;
    if (!p) return;
    
    // 保存当前的中断状态
    int was_intr_on = intr_get();
    
    intr_off();  // 关闭中断以保护
    
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
    // 恢复到调用yield()时的中断状态
    if (was_intr_on) {
        intr_on();
    }
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
    
    // 检查用户进程数限制
    if (!can_fork(p->uid)) {
        return -1;  // 已打印错误消息
    }
    
    // 分配新进程
    struct proc *np = alloc_proc();
    if (!np) {
        uart_puts("[proc] fork: failed to allocate process\n");
        return -1;
    }
    
    // 继承父进程的UID
    np->uid = p->uid;
    
    // 设置父子关系
    np->parent = p;
    np->ppid = p->pid;
    
    // 复制父进程的内存到子进程
    np->sz = p->sz;
    if (p->sz > 0 && p->pagetable && np->pagetable) {
        if (uvmcopy(p->pagetable, np->pagetable, p->sz) < 0) {
            uart_puts("[proc] fork: failed to copy memory\n");
            free_proc(np);
            return -1;
        }
    }
    
    // 复制陷阱帧（用于返回值）
    if (p->trapframe && np->trapframe) {
        memcpy(np->trapframe, p->trapframe, sizeof(struct trapframe));
        // 子进程的返回值应该是0
        np->trapframe->a0 = 0;
    }
    
    // 标记为可运行
    np->state = RUNNABLE;
    
    printf("[proc] fork: created process %d (parent %d, uid %d)\n", 
           np->pid, p->pid, np->uid);
    
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
        
        // 睡眠等待子进程 (简化：使用 p 作为 chan)
        sleep(p, &proc_lock);  // 在子进程exit时会被唤醒
        spin_unlock(&proc_lock);
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

// Look in the process table for an UNUSED proc.
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
  struct proc *p;
  for(p = proc; p < &proc[NPROC]; p++){
    if(p->state == UNUSED){
      goto found;
    }
  }
  return 0;

found:
  p->state = USED;
  p->pid = nextpid++;
  p->ppid = 0;
  p->killed = 0;
  p->xstate = 0;

  // Allocate a trapframe for this process.
  p->trapframe = alloc_trapframe();
  if(!p->trapframe){
    p->state = UNUSED;
    return 0;
  }

  // Allocate a page for the process's kernel stack.
  p->kstack = (char*)alloc_page();
  if(!p->kstack){
    free_trapframe(p->trapframe);
    p->state = UNUSED;
    return 0;
  }

  // Initialize the context to run user code when the process is scheduled.
  memset(&p->context, 0, sizeof(p->context));
  p->context.sp = (uint64)p->kstack + PAGE_SIZE; // top of the stack

  return p;
}

// grow or shrink user memory by n bytes.
// return 0 on success, -1 on failure.
int
growproc(int n)
{
  uint64 sz = myproc()->sz;
  if(n > 0){
    // Allocate pages for growing the process.
    if((sz = allocuvm(myproc()->pagetable, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
    // Deallocate pages for shrinking the process.
    if((sz = deallocuvm(myproc()->pagetable, sz, sz + n)) == 0)
      return -1;
  }
  myproc()->sz = sz;
  switchuvm(myproc());
  return 0;
}

uint64
sys_getpid(void)
{
  return myproc()->pid;
}

uint64
sys_fork(void)
{
  return fork();
}

uint64
sys_exit(void)
{
  int n;
  if(argint(0, &n) < 0)
    return -1;
  exit(n);
  return 0;  // not reached
}

uint64
sys_wait(void)
{
  uint64 p;
  if(argaddr(0, &p) < 0)
    return -1;
  return wait((int*)p);  // 强制转换为 int*
}

uint64
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

// Atomically release lock and sleep on chan.
// Simplified version without complex lock checking.
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  // Release the passed lock
  if(lk != NULL)
    release(lk);

  // Go to sleep.
  p->chan = chan;
  p->state = SLEEPING;

  // Give up CPU
  yield();

  // Tidy up.
  p->chan = 0;

  // Reacquire the passed lock
  if(lk != NULL)
    acquire(lk);
}

// Wake up all processes sleeping on chan.
// Simplified version.
void
wakeup(void *chan)
{
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    if(p->state == SLEEPING && p->chan == chan) {
      p->state = RUNNABLE;
    }
  }
}

uint64
sys_uptime(void)
{
  uint64 xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

uint64
sys_sleep(void)
{
  int n;
  uint64 ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < (uint64)n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    // 使用tickslock作为sleep的chan
    sleep((void*)&tickslock, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// File system syscalls - stubs (not yet implemented)
uint64
sys_read(void)
{
  // TODO: implement file read
  return -1;
}

uint64
sys_write(void)
{
  // TODO: implement file write
  return -1;
}

uint64
sys_open(void)
{
  // TODO: implement file open
  return -1;
}

uint64
sys_close(void)
{
  // TODO: implement file close
  return -1;
}

// Other syscalls - stubs (not yet implemented)
uint64
sys_pipe(void)
{
  return -1;
}

uint64
sys_kill(void)
{
  return -1;
}

uint64
sys_exec(void)
{
  return -1;
}

uint64
sys_fstat(void)
{
  return -1;
}

uint64
sys_chdir(void)
{
  return -1;
}

uint64
sys_dup(void)
{
  return -1;
}

uint64
sys_mknod(void)
{
  return -1;
}

uint64
sys_unlink(void)
{
  return -1;
}

uint64
sys_link(void)
{
  return -1;
}

uint64
sys_mkdir(void)
{
  return -1;
}

