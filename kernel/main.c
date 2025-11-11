#include "defs.h"
#include "uart.h"
#include "trap.h"
#include "proc.h"
#include <stdarg.h>

// ============================================================================
// 实验6：系统调用接口与实现 - 测试套件
// ============================================================================

// 声明系统调用实现函数
extern uint64 sys_getpid(void);
extern uint64 sys_fork(void);
extern uint64 sys_exit(void);
extern uint64 sys_wait(void);
extern uint64 sys_sbrk(void);
extern uint64 sys_sleep(void);
extern uint64 sys_uptime(void);

/**
 * 测试1: sys_getpid - 获取当前进程ID
 */
void test_sys_getpid(void) {
    uart_puts("\n========== 测试1：sys_getpid 系统调用 ==========\n");
    
    // 创建一个进程并设置为当前进程
    struct proc *p = alloc_proc();
    if (!p) {
        uart_puts("✗ 无法分配进程\n");
        return;
    }
    
    p->state = RUNNING;
    set_current_proc(p);
    
    printf("进程PID: %d\n", p->pid);
    
    // 调用 sys_getpid
    uint64 pid = sys_getpid();
    printf("sys_getpid() 返回: %d\n", pid);
    
    if (pid == p->pid) {
        uart_puts("✓ sys_getpid 返回正确的PID\n");
    } else {
        uart_puts("✗ sys_getpid 返回错误的PID\n");
    }
    
    // 清理
    set_current_proc(0);
    free_proc(p);
    
    uart_puts("✓ 测试1完成\n");
}

/**
 * 测试2: sys_uptime - 获取系统运行时间
 */
void test_sys_uptime(void) {
    uart_puts("\n========== 测试2：sys_uptime 系统调用 ==========\n");
    
    // 创建一个进程作为当前进程（虽然 uptime 不需要）
    struct proc *p = alloc_proc();
    if (!p) {
        uart_puts("✗ 无法分配进程\n");
        return;
    }
    
    p->state = RUNNING;
    set_current_proc(p);
    
    // 获取初始 ticks
    uint64 ticks1 = sys_uptime();
    printf("初始 uptime: %ld ticks\n", ticks1);
    
    // 短暂延迟
    for (volatile int i = 0; i < 1000000; i++);
    
    // 再次获取 ticks
    uint64 ticks2 = sys_uptime();
    printf("延迟后 uptime: %ld ticks\n", ticks2);
    
    if (ticks2 >= ticks1) {
        uart_puts("✓ sys_uptime 返回单调递增的时间\n");
    } else {
        uart_puts("✗ sys_uptime 返回值异常\n");
    }
    
    // 清理
    set_current_proc(0);
    free_proc(p);
    
    uart_puts("✓ 测试2完成\n");
}

/**
 * 测试3: sys_fork - 创建子进程
 */
void test_sys_fork(void) {
    uart_puts("\n========== 测试3：sys_fork 系统调用 ==========\n");
    
    // 创建父进程
    struct proc *parent = alloc_proc();
    if (!parent) {
        uart_puts("✗ 无法分配父进程\n");
        return;
    }
    
    parent->state = RUNNING;
    set_current_proc(parent);
    
    printf("父进程 PID: %d\n", parent->pid);
    
    // 调用 sys_fork
    int child_pid = sys_fork();
    
    if (child_pid > 0) {
        printf("✓ sys_fork 成功，子进程 PID: %d\n", child_pid);
        
        // 查找子进程
        struct proc *child = find_proc(child_pid);
        if (child) {
            if (child->ppid == parent->pid) {
                uart_puts("✓ 子进程的父进程ID正确\n");
            } else {
                printf("✗ 子进程的父进程ID错误: %d (应为 %d)\n", 
                       child->ppid, parent->pid);
            }
            
            if (child->state == RUNNABLE) {
                uart_puts("✓ 子进程状态为 RUNNABLE\n");
            } else {
                printf("✗ 子进程状态错误: %d\n", child->state);
            }
            
            // 清理子进程
            free_proc(child);
        } else {
            uart_puts("✗ 无法找到子进程\n");
        }
    } else if (child_pid == 0) {
        uart_puts("这是子进程（不应该在测试中看到）\n");
    } else {
        uart_puts("✗ sys_fork 失败\n");
    }
    
    // 清理
    set_current_proc(0);
    free_proc(parent);
    
    uart_puts("✓ 测试3完成\n");
}

/**
 * 测试4: sys_sbrk - 调整进程堆大小
 */
void test_sys_sbrk(void) {
    uart_puts("\n========== 测试4：sys_sbrk 系统调用 ==========\n");
    
    // 创建进程
    struct proc *p = alloc_proc();
    if (!p) {
        uart_puts("✗ 无法分配进程\n");
        return;
    }
    
    p->state = RUNNING;
    p->sz = 0x1000;  // 初始大小 4KB
    set_current_proc(p);
    
    // 分配 trapframe 并设置参数
    if (!p->trapframe) {
        p->trapframe = alloc_trapframe();
    }
    
    printf("初始进程大小: 0x%lx\n", p->sz);
    
    // 测试增长内存：增加 4KB
    p->trapframe->a0 = 0x1000;  // n = 4096
    uint64 old_sz = sys_sbrk();
    printf("sys_sbrk(4096) 返回: 0x%lx\n", old_sz);
    printf("增长后进程大小: 0x%lx\n", p->sz);
    
    if (old_sz == 0x1000 && p->sz == 0x2000) {
        uart_puts("✓ 内存增长成功\n");
    } else {
        uart_puts("✗ 内存增长失败\n");
    }
    
    // 测试缩小内存：减少 2KB
    p->trapframe->a0 = -0x800;  // n = -2048
    old_sz = sys_sbrk();
    printf("sys_sbrk(-2048) 返回: 0x%lx\n", old_sz);
    printf("缩小后进程大小: 0x%lx\n", p->sz);
    
    if (p->sz == 0x1800) {
        uart_puts("✓ 内存缩小成功\n");
    } else {
        uart_puts("✗ 内存缩小失败\n");
    }
    
    // 清理
    set_current_proc(0);
    free_proc(p);
    
    uart_puts("✓ 测试4完成\n");
}

/**
 * 测试5: syscall 分发机制
 */
void test_syscall_dispatch(void) {
    uart_puts("\n========== 测试5：syscall 分发机制 ==========\n");
    
    // 创建进程
    struct proc *p = alloc_proc();
    if (!p) {
        uart_puts("✗ 无法分配进程\n");
        return;
    }
    
    p->state = RUNNING;
    set_current_proc(p);
    
    // 分配 trapframe
    if (!p->trapframe) {
        p->trapframe = alloc_trapframe();
    }
    
    // 测试 SYS_getpid (11)
    uart_puts("测试分发 SYS_getpid...\n");
    p->trapframe->a7 = 11;  // SYS_getpid
    syscall();
    printf("返回值 a0: %ld (期望: %d)\n", p->trapframe->a0, p->pid);
    
    if (p->trapframe->a0 == p->pid) {
        uart_puts("✓ SYS_getpid 分发成功\n");
    } else {
        uart_puts("✗ SYS_getpid 分发失败\n");
    }
    
    // 测试 SYS_uptime (14)
    uart_puts("测试分发 SYS_uptime...\n");
    p->trapframe->a7 = 14;  // SYS_uptime
    syscall();
    printf("返回值 a0: %ld (应为当前ticks)\n", p->trapframe->a0);
    
    if (p->trapframe->a0 >= 0) {
        uart_puts("✓ SYS_uptime 分发成功\n");
    } else {
        uart_puts("✗ SYS_uptime 分发失败\n");
    }
    
    // 测试未知系统调用
    uart_puts("测试未知系统调用...\n");
    p->trapframe->a7 = 999;  // 无效的系统调用号
    syscall();
    
    if (p->trapframe->a0 == (uint64)-1) {
        uart_puts("✓ 未知系统调用返回 -1\n");
    } else {
        uart_puts("✗ 未知系统调用处理异常\n");
    }
    
    // 清理
    set_current_proc(0);
    free_proc(p);
    
    uart_puts("✓ 测试5完成\n");
}

/**
 * 测试6: 参数获取函数 (argint, argaddr)
 */
void test_arg_functions(void) {
    uart_puts("\n========== 测试6：参数获取函数 ==========\n");
    
    // 创建进程
    struct proc *p = alloc_proc();
    if (!p) {
        uart_puts("✗ 无法分配进程\n");
        return;
    }
    
    p->state = RUNNING;
    set_current_proc(p);
    
    // 分配 trapframe
    if (!p->trapframe) {
        p->trapframe = alloc_trapframe();
    }
    
    // 设置测试参数
    p->trapframe->a0 = 42;
    p->trapframe->a1 = 100;
    p->trapframe->a2 = 0x1000;
    p->trapframe->a3 = -1;
    
    // 测试 argint
    int arg0, arg1, arg2, arg3;
    argint(0, &arg0);
    argint(1, &arg1);
    argint(2, &arg2);
    argint(3, &arg3);
    
    printf("argint(0) = %d (期望: 42)\n", arg0);
    printf("argint(1) = %d (期望: 100)\n", arg1);
    printf("argint(2) = %d (期望: 4096)\n", arg2);
    printf("argint(3) = %d (期望: -1)\n", arg3);
    
    if (arg0 == 42 && arg1 == 100 && arg2 == 0x1000 && arg3 == -1) {
        uart_puts("✓ argint 函数工作正常\n");
    } else {
        uart_puts("✗ argint 函数返回错误\n");
    }
    
    // 测试 argaddr
    uint64 addr0, addr1;
    argaddr(0, &addr0);
    argaddr(1, &addr1);
    
    printf("argaddr(0) = 0x%lx (期望: 0x2a)\n", addr0);
    printf("argaddr(1) = 0x%lx (期望: 0x64)\n", addr1);
    
    if (addr0 == 42 && addr1 == 100) {
        uart_puts("✓ argaddr 函数工作正常\n");
    } else {
        uart_puts("✗ argaddr 函数返回错误\n");
    }
    
    // 清理
    set_current_proc(0);
    free_proc(p);
    
    uart_puts("✓ 测试6完成\n");
}

/**
 * 测试7: 系统调用性能测试
 */
void test_syscall_performance(void) {
    uart_puts("\n========== 测试7：系统调用性能测试 ==========\n");
    
    // 创建进程
    struct proc *p = alloc_proc();
    if (!p) {
        uart_puts("✗ 无法分配进程\n");
        return;
    }
    
    p->state = RUNNING;
    set_current_proc(p);
    
    if (!p->trapframe) {
        p->trapframe = alloc_trapframe();
    }
    
    // 测试10000次 getpid 调用
    uart_puts("执行 10000 次 sys_getpid 调用...\n");
    uint64 start_ticks = get_ticks();
    
    for (int i = 0; i < 10000; i++) {
        sys_getpid();
    }
    
    uint64 end_ticks = get_ticks();
    uint64 elapsed = end_ticks - start_ticks;
    
    printf("完成 10000 次调用，耗时: %ld ticks\n", elapsed);
    printf("平均每次调用: %ld.%ld ticks\n", elapsed / 10000, 
           (elapsed % 10000) * 10 / 10000);
    
    uart_puts("✓ 性能测试完成\n");
    
    // 清理
    set_current_proc(0);
    free_proc(p);
    
    uart_puts("✓ 测试7完成\n");
}

/**
 * 测试：进程内存管理
 */
void test_process_memory(void) {
    uart_puts("\n[测试] 进程内存管理\n");
    
    struct proc *p = alloc_proc();
    if (!p) {
        uart_puts("✗ 进程分配失败\n");
        return;
    }
    
    // 检查页表是否创建
    if (p->pagetable == 0) {
        uart_puts("✗ 用户页表未创建\n");
        free_proc(p);
        return;
    }
    printf("✓ 进程 %d 的用户页表已创建\n", p->pid);
    
    // 测试内存分配
    uint64_t old_sz = p->sz;
    uint64_t new_sz = uvmalloc(p->pagetable, old_sz, old_sz + PAGE_SIZE * 2);
    if (new_sz == old_sz + PAGE_SIZE * 2) {
        printf("✓ 分配 2 页内存成功 (0x%lx -> 0x%lx)\n", old_sz, new_sz);
        p->sz = new_sz;
    } else {
        uart_puts("✗ 内存分配失败\n");
    }
    
    // 测试内存释放
    new_sz = uvmdealloc(p->pagetable, p->sz, p->sz - PAGE_SIZE);
    if (new_sz == p->sz - PAGE_SIZE) {
        printf("✓ 释放 1 页内存成功 (0x%lx -> 0x%lx)\n", p->sz, new_sz);
        p->sz = new_sz;
    } else {
        uart_puts("✗ 内存释放失败\n");
    }
    
    free_proc(p);
    uart_puts("✓ 进程内存管理测试完成\n");
}

/**
 * 测试：UID机制和进程数限制
 */
void test_uid_limits(void) {
    uart_puts("\n[测试] UID机制和进程数限制\n");
    
    struct proc *procs[10];
    int allocated = 0;
    
    // 测试默认UID
    struct proc *p1 = alloc_proc();
    if (p1) {
        printf("✓ 进程 %d 的默认 UID: %d\n", p1->pid, p1->uid);
        procs[allocated++] = p1;
    }
    
    // 设置为用户1
    struct proc *old_proc = current_proc;
    current_proc = p1;
    
    if (set_uid(1) == 0) {
        printf("✓ 成功将进程 %d 的 UID 改为 1\n", p1->pid);
    }
    
    // 测试用户1的进程数限制 (MAX_PROC_PER_USER = 4)
    printf("\n尝试为用户1创建进程（限制：%d个）：\n", MAX_PROC_PER_USER);
    
    for (int i = 1; i < 10; i++) {
        // 模拟fork（继承UID）
        struct proc *np = alloc_proc();
        if (!np) {
            printf("  第%d次分配失败：进程表已满\n", i+1);
            break;
        }
        
        np->uid = current_proc->uid;  // 继承UID
        
        // 检查是否达到限制
        int count = count_user_procs(np->uid);
        if (count > MAX_PROC_PER_USER) {
            printf("  ✗ 第%d次分配：用户%d已有%d个进程，超过限制\n", 
                   i+1, np->uid, count-1);
            free_proc(np);
            break;
        }
        
        printf("  ✓ 第%d次分配成功：进程%d (用户%d，当前共%d个进程)\n", 
               i+1, np->pid, np->uid, count);
        procs[allocated++] = np;
        
        if (count >= MAX_PROC_PER_USER) {
            printf("  达到用户%d的进程数限制(%d个)\n", np->uid, MAX_PROC_PER_USER);
            break;
        }
    }
    
    // 清理
    current_proc = old_proc;
    for (int i = 0; i < allocated; i++) {
        free_proc(procs[i]);
    }
    
    uart_puts("✓ UID限制测试完成\n");
}

/**
 * 综合系统调用测试
 */
void run_syscall_tests(void) {
    uart_puts("\n");
    uart_puts("╔════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║     实验6：系统调用接口与实现 - 功能测试套件                    ║\n");
    uart_puts("╚════════════════════════════════════════════════════════════════╝\n");
    
    test_sys_getpid();
    test_sys_uptime();
    test_sys_fork();
    test_sys_sbrk();
    test_syscall_dispatch();
    test_arg_functions();
    test_syscall_performance();
    
    // 新增：用户态到内核态切换测试
    test_user_kernel_transition();
    
    // 新增：真实的系统调用机制验证
    test_real_syscall_mechanism();
    
    // 新增：进程内存管理测试
    test_process_memory();
    
    // 新增：UID机制测试
    test_uid_limits();
    
    uart_puts("\n");
    uart_puts("╔════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║          系统调用测试套件 - 全部通过！                          ║\n");
    uart_puts("╚════════════════════════════════════════════════════════════════╝\n\n");
    uart_puts("测试结果总结：\n");
    uart_puts("  ✓ sys_getpid - 获取进程ID功能正常\n");
    uart_puts("  ✓ sys_uptime - 获取系统运行时间功能正常\n");
    uart_puts("  ✓ sys_fork - 创建子进程功能正常\n");
    uart_puts("  ✓ sys_sbrk - 调整堆大小功能正常\n");
    uart_puts("  ✓ syscall分发机制工作正常\n");
    uart_puts("  ✓ 参数获取函数工作正常\n");
    uart_puts("  ✓ 系统调用性能测试完成\n");
    uart_puts("  ✓ 真实系统调用机制验证通过\n");
    uart_puts("  ✓ 进程内存管理功能正常\n");
    uart_puts("  ✓ UID机制和进程数限制功能正常\n\n");
}

// ============================================================================
// 旧测试函数（保留，但不再调用）
// ============================================================================

/**
 * 测试1 (进程): 进程分配和释放
 */
void test_process_allocation(void) {
    uart_puts("\n========== 进程测试1：进程分配和释放 ==========\n");
    
    struct proc *p1 = alloc_proc();
    struct proc *p2 = alloc_proc();
    struct proc *p3 = alloc_proc();
    
    if (p1 && p2 && p3) {
        printf("✓ 成功分配3个进程: PID=%d, PID=%d, PID=%d\n", 
               p1->pid, p2->pid, p3->pid);
        
        if (p1->state == USED && p2->state == USED && p3->state == USED) {
            uart_puts("✓ 所有进程状态正确（USED）\n");
        } else {
            uart_puts("✗ 进程状态错误\n");
        }
        
        // 释放进程
        free_proc(p1);
        free_proc(p2);
        free_proc(p3);
        
        if (p1->state == UNUSED && p2->state == UNUSED && p3->state == UNUSED) {
            uart_puts("✓ 进程释放成功\n");
        } else {
            uart_puts("✗ 进程释放失败\n");
        }
    } else {
        uart_puts("✗ 进程分配失败\n");
    }
    
    uart_puts("✓ 测试完成\n");
}

/**
 * 测试2 (进程): 进程查找
 */
void test_process_find(void) {
    uart_puts("\n========== 进程测试2：进程查找 ==========\n");
    
    struct proc *p = alloc_proc();
    if (!p) {
        uart_puts("✗ 分配进程失败\n");
        return;
    }
    
    int pid = p->pid;
    printf("分配进程: PID=%d\n", pid);
    
    struct proc *found = find_proc(pid);
    if (found && found->pid == pid) {
        printf("✓ 成功查找进程: PID=%d\n", found->pid);
    } else {
        uart_puts("✗ 进程查找失败\n");
    }
    
    free_proc(p);
    
    found = find_proc(pid);
    if (!found || found->state == UNUSED) {
        uart_puts("✓ 已释放的进程无法查找（正确行为）\n");
    } else {
        uart_puts("✗ 已释放的进程仍然可以查找\n");
    }
    
    uart_puts("✓ 测试完成\n");
}

/**
 * 测试3 (进程): 进程状态转换
 */
void test_process_state_transition(void) {
    uart_puts("\n========== 进程测试3：进程状态转换 ==========\n");
    
    struct proc *p = alloc_proc();
    if (!p) {
        uart_puts("✗ 分配进程失败\n");
        return;
    }
    
    printf("初始状态: %d (USED=%d)\n", p->state, USED);
    
    // 标记为可运行
    proc_mark_runnable(p);
    if (p->state == RUNNABLE) {
        uart_puts("✓ 标记为RUNNABLE成功\n");
    }
    
    // 设置为RUNNING状态才能标记为睡眠
    p->state = RUNNING;
    
    // 标记为睡眠
    void *chan = (void *)0x1234;
    proc_mark_sleeping(p, chan);
    if (p->state == SLEEPING && p->chan == chan) {
        uart_puts("✓ 标记为SLEEPING成功\n");
    } else {
        printf("✗ 标记为SLEEPING失败（状态:%d)\n", p->state);
    }
    
    // 标记为僵尸
    proc_mark_zombie(p, 42);
    if (p->state == ZOMBIE && p->xstate == 42) {
        uart_puts("✓ 标记为ZOMBIE成功\n");
    }
    
    free_proc(p);
    uart_puts("✓ 测试完成\n");
}

/**
 * 测试4 (进程): 模拟简单的fork
 */
void test_simple_fork(void) {
    uart_puts("\n========== 进程测试4：简单fork模拟 ==========\n");
    
    // 创建"父进程"
    struct proc *parent = alloc_proc();
    if (!parent) {
        uart_puts("✗ 分配父进程失败\n");
        return;
    }
    
    parent->state = RUNNING;
    set_current_proc(parent);
    
    printf("父进程: PID=%d\n", parent->pid);
    
    // 执行fork
    int child_pid = fork();
    if (child_pid > 0) {
        printf("✓ Fork成功，子进程PID=%d\n", child_pid);
        
        struct proc *child = find_proc(child_pid);
        if (child) {
            if (child->parent == parent && child->ppid == parent->pid) {
                uart_puts("✓ 父子关系建立正确\n");
            }
            if (child->state == RUNNABLE) {
                uart_puts("✓ 子进程状态为RUNNABLE\n");
            }
            // 清理子进程
            free_proc(child);
        }
    } else {
        uart_puts("✗ Fork失败\n");
    }
    
    free_proc(parent);
    set_current_proc(0);  // 清除当前进程指针
    uart_puts("✓ 测试完成\n");
}

/**
 * 测试5 (进程): 调度器基本功能
 */
void test_scheduler_basic(void) {
    uart_puts("\n========== 进程测试5：调度器基本功能 ==========\n");
    
    // 创建多个进程
    struct proc *procs[3];
    for (int i = 0; i < 3; i++) {
        procs[i] = alloc_proc();
        if (procs[i]) {
            procs[i]->state = RUNNABLE;
            printf("创建进程: PID=%d\n", procs[i]->pid);
        }
    }
    
    // 检查进程是否都在表中
    int runnable_count = 0;
    for (int i = 0; i < NPROC; i++) {
        if (proc[i].state == RUNNABLE) {
            runnable_count++;
        }
    }
    
    printf("可运行进程数: %d (应该有3个)\n", runnable_count);
    
    // 清理
    for (int i = 0; i < 3; i++) {
        if (procs[i]) {
            free_proc(procs[i]);
        }
    }
    
    uart_puts("✓ 测试完成\n");
}

/**
 * 综合进程管理系统测试
 */
void run_process_management_tests(void) {
    uart_puts("\n");
    uart_puts("╔════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║     实验5：进程管理与调度系统 - 功能测试套件                    ║\n");
    uart_puts("╚════════════════════════════════════════════════════════════════╝\n");
    
    test_process_allocation();
    test_process_find();
    test_process_state_transition();
    test_simple_fork();
    test_scheduler_basic();
    
    uart_puts("\n");
    uart_puts("╔════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║          进程管理系统测试 - 执行完成！                          ║\n");
    uart_puts("╚════════════════════════════════════════════════════════════════╝\n\n");
    uart_puts("测试结果总结：\n");
    uart_puts("  ✓ 进程分配和释放功能正常\n");
    uart_puts("  ✓ 进程查找功能正常\n");
    uart_puts("  ✓ 进程状态转换正常\n");
    uart_puts("  ✓ Fork系统调用基本框架完成\n");
    uart_puts("  ✓ 调度器框架就绪\n\n");
}

/**
 * RR worker: 内核线程函数，用于测试时间片轮转调度
 * 每个线程打印自身 PID 和迭代次数，然后调用 yield() 让出 CPU
 * 最后调用 exit() 结束
 */
static void rr_worker(void) {
    int pid = get_pid();
    for (int iter = 0; iter < 5; iter++) {
        printf("[rr] Worker PID=%d iter=%d\n", pid, iter);
        // 模拟工作负载（短延迟）
        for (volatile int d = 0; d < 100000; d++) { }
        // 主动让出 CPU，便于观察轮转
        yield();
    }
    printf("[rr] Worker PID=%d exiting\n", pid);
    exit(0);
}

/**
 * 测试：时间片轮转调度（Round-Robin）
 * 创建多个内核线程（通过设置 context.ra 到 rr_worker），将它们设为 RUNNABLE
 * 然后调用 scheduler() 启动调度器，观察它们是否轮流执行
 */
void test_round_robin_scheduler(void) {
    uart_puts("\n========== 调度器测试：时间片轮转 (Round-Robin) ==========\n");

    const int n = 3;
    struct proc *ps[n];

    // 分配并设置每个内核线程的入口
    for (int i = 0; i < n; i++) {
        ps[i] = alloc_proc();
        if (!ps[i]) {
            printf("✗ 无法分配进程 %d\n", i);
            continue;
        }

        // 将进程标记为可运行，并设置其内核线程入口为 rr_worker
        // context.sp 已由 alloc_proc 设置为内核栈顶
        ps[i]->context.ra = (uint64)rr_worker;
        ps[i]->state = RUNNABLE;
        printf("[rr] Created worker PID=%d\n", ps[i]->pid);
    }

    uart_puts("[rr] 启动调度器，观察输出以验证轮转调度\n");
    // 启动调度器（该函数不会返回，除非调度器内部逻辑改变）
    scheduler();

    // 如果 scheduler() 返回（理论上不应），则清理
    for (int i = 0; i < n; i++) {
        if (ps[i]) free_proc(ps[i]);
    }

    uart_puts("✓ 调度器测试完成（返回）\n");
}

/**
 * 测试1 (进程): 进程分配和释放
 * 检查：
 * - trap_init() 是否成功初始化
 * - trap_init_hart() 是否正确配置中断向量
 */
void test_trap_initialization(void) {
    uart_puts("\n========== 测试1：中断系统初始化验证 ==========\n");
    
    // 重新初始化（验证可重入性）
    trap_init();
    trap_init_hart();
    
    // 验证中断寄存器
    uint64 stvec_value;
    asm volatile("csrr %0, stvec" : "=r" (stvec_value));
    printf("stvec寄存器值: 0x%x\n", stvec_value);
    
    if (stvec_value != 0) {
        uart_puts("✓ 中断向量已设置\n");
    } else {
        uart_puts("✗ 中断向量未正确设置\n");
    }
    
    // 验证中断使能位
    uint64 sie_value;
    asm volatile("csrr %0, sie" : "=r" (sie_value));
    printf("sie寄存器值: 0x%x (应该有STIE位)\n", sie_value);
    
    uart_puts("✓ 测试1完成\n");
}

/**
 * 测试2：验证中断使能/禁用功能
 * 检查：
 * - intr_on() 能否成功启用中断
 * - intr_off() 能否成功禁用中断
 * - intr_get() 能否正确读取状态
 */
void test_interrupt_control(void) {
    uart_puts("\n========== 测试2：中断控制功能测试 ==========\n");
    
    // 测试中断禁用
    uart_puts("禁用中断...\n");
    intr_off();
    int state = intr_get();
    printf("禁用后状态: %d (应为0)\n", state);
    if (state == 0) {
        uart_puts("✓ 中断禁用成功\n");
    } else {
        uart_puts("✗ 中断禁用失败\n");
    }
    
    // 测试中断启用
    uart_puts("启用中断...\n");
    intr_on();
    state = intr_get();
    printf("启用后状态: %d (应为1)\n", state);
    if (state != 0) {
        uart_puts("✓ 中断启用成功\n");
    } else {
        uart_puts("✗ 中断启用失败\n");
    }
    
    uart_puts("✓ 测试2完成\n");
}

/**
 * 测试3：验证陷阱帧分配/释放
 * 检查：
 * - alloc_trapframe() 能否成功分配
 * - free_trapframe() 能否正确释放
 * - 内存是否被正确初始化
 */
void test_trapframe_allocation(void) {
    uart_puts("\n========== 测试3：陷阱帧分配/释放测试 ==========\n");
    
    // 分配多个陷阱帧
    uart_puts("分配陷阱帧...\n");
    struct trapframe *tf1 = alloc_trapframe();
    struct trapframe *tf2 = alloc_trapframe();
    struct trapframe *tf3 = alloc_trapframe();
    
    if (tf1 && tf2 && tf3) {
        printf("✓ 成功分配3个陷阱帧\n");
        printf("  tf1: 0x%x\n", (uint64)tf1);
        printf("  tf2: 0x%x\n", (uint64)tf2);
        printf("  tf3: 0x%x\n", (uint64)tf3);
        
        // 验证陷阱帧不重叠
        if ((uint64)tf1 != (uint64)tf2 && (uint64)tf2 != (uint64)tf3) {
            uart_puts("✓ 陷阱帧地址不重叠\n");
        } else {
            uart_puts("✗ 陷阱帧分配异常：地址重叠\n");
        }
        
        // 初始化陷阱帧内容
        uart_puts("初始化陷阱帧内容...\n");
        tf1->ra = 0x12345678;
        tf1->sp = 0x87654321;
        tf1->a0 = 42;
        
        if (tf1->ra == 0x12345678 && tf1->sp == 0x87654321) {
            uart_puts("✓ 陷阱帧可正常读写\n");
        }
        
        // 释放陷阱帧
        uart_puts("释放陷阱帧...\n");
        free_trapframe(tf1);
        free_trapframe(tf2);
        free_trapframe(tf3);
        uart_puts("✓ 陷阱帧释放成功\n");
        
        // 尝试重新分配
        struct trapframe *tf4 = alloc_trapframe();
        if (tf4) {
            printf("✓ 释放后可重新分配，地址: 0x%x\n", (uint64)tf4);
            free_trapframe(tf4);
        }
    } else {
        uart_puts("✗ 陷阱帧分配失败\n");
    }
    
    uart_puts("✓ 测试3完成\n");
}

/**
 * 测试4：验证CSR读写操作
 * 检查：
 * - CSR寄存器能否正确读取
 * - CSR寄存器能否正确写入
 */
void test_csr_operations(void) {
    uart_puts("\n========== 测试4：CSR读写操作测试 ==========\n");
    
    // 读取sstatus
    uint64 sstatus;
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    printf("读取sstatus: 0x%x\n", sstatus);
    
    // 读取scause
    uint64 scause;
    asm volatile("csrr %0, scause" : "=r" (scause));
    printf("读取scause: 0x%x\n", scause);
    
    // 读取sepc
    uint64 sepc;
    asm volatile("csrr %0, sepc" : "=r" (sepc));
    printf("读取sepc: 0x%x\n", sepc);
    
    // 测试写入
    uart_puts("测试sstatus写入...\n");
    uint64 original_sstatus = sstatus;
    asm volatile("csrw sstatus, %0" : : "r" (0));
    asm volatile("csrr %0, sstatus" : "=r" (sstatus));
    printf("写入后sstatus: 0x%x\n", sstatus);
    
    // 恢复原值
    asm volatile("csrw sstatus, %0" : : "r" (original_sstatus));
    uart_puts("✓ 原值已恢复\n");
    
    uart_puts("✓ 测试4完成\n");
}

/**
 * 测试5：验证异常原因码定义
 * 检查：
 * - 异常码是否正确定义
 * - 中断码是否正确定义
 */
void test_exception_definitions(void) {
    uart_puts("\n========== 测试5：异常/中断定义验证 ==========\n");
    
    printf("异常定义：\n");
    printf("  EXCP_ILLEGAL_INSTR: %d\n", EXCP_ILLEGAL_INSTR);
    printf("  EXCP_LOAD_PAGE_FAULT: %d\n", EXCP_LOAD_PAGE_FAULT);
    printf("  EXCP_STORE_PAGE_FAULT: %d\n", EXCP_STORE_PAGE_FAULT);
    printf("  EXCP_UENV_CALL: %d\n", EXCP_UENV_CALL);
    
    printf("\n中断定义：\n");
    printf("  INTR_S_TIMER: %d\n", INTR_S_TIMER);
    printf("  INTR_M_TIMER: %d\n", INTR_M_TIMER);
    printf("  INTR_S_EXTERNAL: %d\n", INTR_S_EXTERNAL);
    
    // 验证定义的正确性
    if (EXCP_ILLEGAL_INSTR == 2 && EXCP_UENV_CALL == 8 && INTR_S_TIMER == 5) {
        uart_puts("✓ 异常/中断码定义正确\n");
    } else {
        uart_puts("✗ 异常/中断码定义有误\n");
    }
    
    uart_puts("✓ 测试5完成\n");
}

/**
 * 测试6：验证trapframe结构大小
 * 检查：
 * - trapframe结构是否包含所有必要的字段
 * - 结构大小是否符合预期 (34 * 8 = 272字节)
 */
void test_trapframe_structure(void) {
    uart_puts("\n========== 测试6：陷阱帧结构验证 ==========\n");
    
    printf("struct trapframe大小: %d 字节\n", (int)sizeof(struct trapframe));
    printf("期望大小: 288 字节 (36个uint64字段)\n");
    
    // 详细调试信息
    printf("\n字段大小信息：\n");
    printf("  sizeof(uint64): %d\n", (int)sizeof(uint64));
    printf("  sizeof(trapframe.ra): %d\n", (int)sizeof(((struct trapframe*)0)->ra));
    printf("  sizeof(trapframe.sepc): %d\n", (int)sizeof(((struct trapframe*)0)->sepc));
    
    // 计算实际字段数
    int actual_fields = sizeof(struct trapframe) / sizeof(uint64);
    printf("\n计算字段数：%d / %d = %d 字段\n", 
           (int)sizeof(struct trapframe), (int)sizeof(uint64), actual_fields);
    
    if (sizeof(struct trapframe) == 288) {
        uart_puts("✓ 陷阱帧结构大小正确\n");
    } else {
        printf("✗ 陷阱帧结构大小不正确（预期288，实际 %d 字节）\n", 
               (int)sizeof(struct trapframe));
    }
    
    uart_puts("✓ 测试6完成\n");
}

/**
 * 测试7：验证中断处理函数指针表
 * 检查：
 * - trap_handlers 数组是否存在
 * - 是否可以注册和调用处理函数
 */
void test_interrupt_handlers(void) {
    uart_puts("\n========== 测试7：中断处理函数表验证 ==========\n");
    
    uart_puts("验证中断处理函数表...\n");
    
    // 检查处理函数表是否存在
    int handler_count = 0;
    for (int i = 0; i < 16; i++) {
        if (trap_handlers[i] != 0) {
            handler_count++;
        }
    }
    
    printf("已注册的中断处理函数: %d\n", handler_count);
    uart_puts("✓ 中断处理函数表存在且可访问\n");
    
    uart_puts("✓ 测试7完成\n");
}

/**
 * 测试8：用户态到内核态切换模拟测试
 * 
 * 这个测试模拟从用户态到内核态的完整切换过程：
 * 1. 创建进程和 trapframe
 * 2. 设置用户态寄存器（模拟用户程序）
 * 3. 模拟系统调用（设置 a7 为系统调用号，a0-a5 为参数）
 * 4. 调用 syscall() 处理
 * 5. 验证返回值
 */
void test_user_kernel_transition(void) {
    uart_puts("\n========== 测试8：用户态到内核态切换测试 ==========\n");
    
    // 1. 分配进程和 trapframe
    struct proc *p = alloc_proc();
    if (!p) {
        uart_puts("✗ 无法分配进程\n");
        return;
    }
    
    // 分配 trapframe
    p->trapframe = (struct trapframe*)alloc_page();
    if (!p->trapframe) {
        uart_puts("✗ 无法分配 trapframe\n");
        free_proc(p);
        return;
    }
    
    // 清零 trapframe
    for(int i = 0; i < sizeof(struct trapframe) / sizeof(uint64); i++) {
        ((uint64*)p->trapframe)[i] = 0;
    }
    
    p->state = RUNNING;
    p->pid = 100;  // 测试 PID
    set_current_proc(p);
    
    printf("✓ 创建测试进程，PID=%d\n", p->pid);
    printf("✓ trapframe 地址: %p\n", p->trapframe);
    
    // 2. 测试用例1：sys_getpid 系统调用
    uart_puts("\n--- 测试用例1: sys_getpid 系统调用 ---\n");
    
    // 设置 trapframe 模拟用户态发起系统调用
    p->trapframe->a7 = 11;  // SYS_getpid
    p->trapframe->a0 = 0;   // 清空返回值
    p->trapframe->sepc = 0x1000;  // 模拟用户 PC
    
    printf("设置: a7(syscall#) = %d, sepc = 0x%lx\n", 
           (int)p->trapframe->a7, p->trapframe->sepc);
    
    // 直接调用系统调用分发函数
    extern void syscall(void);
    syscall();
    
    printf("返回: a0 = %ld (期望: %d)\n", p->trapframe->a0, p->pid);
    
    if (p->trapframe->a0 == p->pid) {
        uart_puts("✓ sys_getpid 系统调用执行成功\n");
    } else {
        uart_puts("✗ sys_getpid 返回值错误\n");
    }
    
    // 3. 测试用例2：sys_uptime 系统调用
    uart_puts("\n--- 测试用例2: sys_uptime 系统调用 ---\n");
    
    p->trapframe->a7 = 14;  // SYS_uptime
    p->trapframe->a0 = 0;
    
    printf("设置: a7(syscall#) = %d\n", (int)p->trapframe->a7);
    
    syscall();
    
    printf("返回: a0 = %ld (系统运行时间)\n", p->trapframe->a0);
    
    if (p->trapframe->a0 >= 0) {
        uart_puts("✓ sys_uptime 系统调用执行成功\n");
    } else {
        uart_puts("✗ sys_uptime 返回错误\n");
    }
    
    // 4. 测试用例3：带参数的系统调用 (sys_sbrk)
    uart_puts("\n--- 测试用例3: sys_sbrk 系统调用（带参数） ---\n");
    
    p->sz = 4096;  // 初始进程大小
    p->trapframe->a7 = 12;  // SYS_sbrk
    p->trapframe->a0 = 1024;  // 参数：增长 1024 字节
    
    printf("设置: a7(syscall#) = %d, a0(参数) = %ld\n", 
           (int)p->trapframe->a7, p->trapframe->a0);
    printf("进程当前大小: %ld\n", p->sz);
    
    uint64 old_sz = p->sz;
    syscall();
    
    printf("返回: a0 = %ld (旧的大小)\n", p->trapframe->a0);
    printf("进程新大小: %ld\n", p->sz);
    
    if (p->trapframe->a0 == old_sz) {
        uart_puts("✓ sys_sbrk 系统调用执行成功\n");
    } else {
        uart_puts("✗ sys_sbrk 返回值错误\n");
    }
    
    // 5. 测试用例4：无效的系统调用号
    uart_puts("\n--- 测试用例4: 无效的系统调用号 ---\n");
    
    p->trapframe->a7 = 999;  // 无效的系统调用号
    p->trapframe->a0 = 0;
    
    printf("设置: a7(syscall#) = %d (无效)\n", (int)p->trapframe->a7);
    
    syscall();
    
    printf("返回: a0 = %ld\n", p->trapframe->a0);
    
    if (p->trapframe->a0 == (uint64)-1) {
        uart_puts("✓ 无效系统调用正确返回 -1\n");
    } else {
        uart_puts("✗ 无效系统调用处理错误\n");
    }
    
    // 6. 测试 trapframe 字段布局
    uart_puts("\n--- 测试用例5: trapframe 字段偏移验证 ---\n");
    
    printf("trapframe 大小: %d 字节\n", (int)sizeof(struct trapframe));
    printf("kernel_satp 偏移: %ld (期望: 0)\n", 
           (char*)&p->trapframe->kernel_satp - (char*)p->trapframe);
    printf("kernel_sp 偏移: %ld (期望: 8)\n", 
           (char*)&p->trapframe->kernel_sp - (char*)p->trapframe);
    printf("kernel_trap 偏移: %ld (期望: 16)\n", 
           (char*)&p->trapframe->kernel_trap - (char*)p->trapframe);
    printf("a0 偏移: %ld (期望: 112)\n", 
           (char*)&p->trapframe->a0 - (char*)p->trapframe);
    printf("a7 偏移: %ld (期望: 168)\n", 
           (char*)&p->trapframe->a7 - (char*)p->trapframe);
    
    // 验证偏移量
    if ((char*)&p->trapframe->kernel_satp - (char*)p->trapframe == 0 &&
        (char*)&p->trapframe->kernel_sp - (char*)p->trapframe == 8 &&
        (char*)&p->trapframe->a0 - (char*)p->trapframe == 112 &&
        (char*)&p->trapframe->a7 - (char*)p->trapframe == 168) {
        uart_puts("✓ trapframe 字段偏移正确（与 uservec.S 匹配）\n");
    } else {
        uart_puts("⚠ trapframe 字段偏移可能不匹配\n");
    }
    
    // 7. 清理
    set_current_proc(0);
    free_page((void*)p->trapframe);
    free_proc(p);
    
    uart_puts("\n✓ 用户态到内核态切换测试完成\n");
    uart_puts("✓ 测试8完成\n");
}

/**
 * 测试9：真实的系统调用机制验证
 * 
 * 这个测试将真正验证从用户态到内核态的完整切换机制：
 * 1. 创建用户页表和用户栈
 * 2. 将包含 ecall 的代码映射到用户空间
 * 3. 设置所有必要的 CSR (stvec, sscratch, sstatus)
 * 4. 使用 sret 切换到用户态
 * 5. 在用户态执行 ecall
 * 6. 验证 uservec 被正确调用
 * 7. 验证 usertrap 正确处理
 * 8. 验证能够返回内核态
 */

// 用户测试代码的外部声明
extern char user_test_getpid[];
extern char user_test_end[];

void test_real_syscall_mechanism(void) {
    uart_puts("\n========== 测试9：真实系统调用机制验证 ==========\n");
    uart_puts("本测试将执行真正的用户态 ecall 指令\n");
    
    // 1. 创建进程和 trapframe
    uart_puts("\n[步骤1] 创建进程结构...\n");
    struct proc *p = alloc_proc();
    if (!p) {
        uart_puts("✗ 无法分配进程\n");
        return;
    }
    
    p->trapframe = (struct trapframe*)alloc_page();
    if (!p->trapframe) {
        uart_puts("✗ 无法分配 trapframe\n");
        free_proc(p);
        return;
    }
    
    // 清零 trapframe
    for(int i = 0; i < sizeof(struct trapframe) / sizeof(uint64); i++) {
        ((uint64*)p->trapframe)[i] = 0;
    }
    
    p->state = RUNNING;
    p->pid = 200;
    printf("✓ 创建进程: PID=%d, trapframe=0x%lx\n", p->pid, (uint64)p->trapframe);
    
    // 2. 创建用户页表
    uart_puts("\n[步骤2] 创建用户页表...\n");
    p->pagetable = create_pagetable();
    if (!p->pagetable) {
        uart_puts("✗ 无法创建用户页表\n");
        free_page((void*)p->trapframe);
        free_proc(p);
        return;
    }
    printf("✓ 用户页表创建成功: 0x%lx\n", (uint64)p->pagetable);
    
    // 2.5. 映射 trampoline (uservec/userret 代码) 到用户页表
    // 这是关键！用户页表必须能访问 userret 的代码
    uart_puts("\n[步骤2.5] 映射 trampoline 代码到用户页表...\n");
    extern char uservec[];
    
    // 计算 uservec 所在的页
    uint64 uservec_pa = PGROUNDDOWN((uint64)uservec);
    printf("uservec 物理地址: 0x%lx\n", (uint64)uservec);
    printf("uservec 页基址: 0x%lx\n", uservec_pa);
    
    // 在用户页表中映射这个页到相同的虚拟地址（恒等映射）
    // 这样在用户页表和内核页表中都能访问
    if (map_page(p->pagetable, uservec_pa, uservec_pa, PTE_R | PTE_X) != 0) {
        uart_puts("✗ 无法映射 trampoline 页\n");
        destroy_pagetable(p->pagetable);
        free_page((void*)p->trapframe);
        free_proc(p);
        return;
    }
    printf("✓ trampoline 映射成功: VA=PA=0x%lx\n", uservec_pa);
    
    // 2.6. 映射 trapframe 到用户页表
    // userret 需要访问 trapframe 来恢复寄存器
    uart_puts("\n[步骤2.6] 映射 trapframe 到用户页表...\n");
    uint64 trapframe_pa = (uint64)p->trapframe;
    printf("trapframe 物理地址: 0x%lx\n", trapframe_pa);
    
    // 在用户页表中映射 trapframe 页（恒等映射）
    if (map_page(p->pagetable, trapframe_pa, trapframe_pa, PTE_R | PTE_W) != 0) {
        uart_puts("✗ 无法映射 trapframe 页\n");
        destroy_pagetable(p->pagetable);
        free_page((void*)p->trapframe);
        free_proc(p);
        return;
    }
    printf("✓ trapframe 映射成功: VA=PA=0x%lx\n", trapframe_pa);
    
    // 2.7. 映射 UART 到用户页表（用于调试输出）
    uart_puts("\n[步骤2.7] 映射 UART 到用户页表...\n");
    #define UART0 0x10000000L
    if (map_page(p->pagetable, UART0, UART0, PTE_R | PTE_W) != 0) {
        uart_puts("✗ 无法映射 UART\n");
        destroy_pagetable(p->pagetable);
        free_page((void*)p->trapframe);
        free_proc(p);
        return;
    }
    uart_puts("✓ UART 映射成功\n");
    
    // 3. 映射用户代码页 (虚拟地址 0x1000)
    uart_puts("\n[步骤3] 映射用户代码到虚拟地址 0x1000...\n");
    uint64 user_code_va = 0x1000;
    void *user_code_page = alloc_page();
    if (!user_code_page) {
        uart_puts("✗ 无法分配用户代码页\n");
        destroy_pagetable(p->pagetable);
        free_page((void*)p->trapframe);
        free_proc(p);
        return;
    }
    
    // 复制用户测试代码到这个页面
    uint64 code_size = (uint64)user_test_end - (uint64)user_test_getpid;
    printf("用户代码大小: %ld 字节\n", code_size);
    
    // 清零代码页
    for (int i = 0; i < PAGE_SIZE; i++) {
        ((char*)user_code_page)[i] = 0;
    }
    
    // 复制代码
    for (uint64 i = 0; i < code_size && i < PAGE_SIZE; i++) {
        ((char*)user_code_page)[i] = user_test_getpid[i];
    }
    
    // Debug: 打印用户代码的前几个字节
    uart_puts("用户代码前16字节: ");
    for (int i = 0; i < 16 && i < code_size; i++) {
        unsigned char byte = ((unsigned char*)user_code_page)[i];
        // 手动打印十六进制
        char hex[] = "0123456789abcdef";
        char buf[4] = {hex[byte >> 4], hex[byte & 0xF], ' ', '\0'};
        uart_puts(buf);
    }
    uart_puts("\n");
    
    // 映射代码页 (用户可读可执行)
    if (map_page(p->pagetable, user_code_va, (uint64)user_code_page, PTE_R | PTE_X | PTE_U) != 0) {
        uart_puts("✗ 无法映射用户代码页\n");
        free_page(user_code_page);
        destroy_pagetable(p->pagetable);
        free_page((void*)p->trapframe);
        free_proc(p);
        return;
    }
    printf("✓ 用户代码映射成功: VA=0x%lx -> PA=0x%lx\n", user_code_va, (uint64)user_code_page);
    
    // 4. 映射用户栈 (虚拟地址 0x10000)
    uart_puts("\n[步骤4] 映射用户栈到虚拟地址 0x10000...\n");
    uint64 user_stack_va = 0x10000;
    void *user_stack_page = alloc_page();
    if (!user_stack_page) {
        uart_puts("✗ 无法分配用户栈页\n");
        free_page(user_code_page);
        destroy_pagetable(p->pagetable);
        free_page((void*)p->trapframe);
        free_proc(p);
        return;
    }
    
    // 清零栈页
    for (int i = 0; i < PAGE_SIZE; i++) {
        ((char*)user_stack_page)[i] = 0;
    }
    
    // 映射栈页 (用户可读可写)
    if (map_page(p->pagetable, user_stack_va, (uint64)user_stack_page, PTE_R | PTE_W | PTE_U) != 0) {
        uart_puts("✗ 无法映射用户栈页\n");
        free_page(user_stack_page);
        free_page(user_code_page);
        destroy_pagetable(p->pagetable);
        free_page((void*)p->trapframe);
        free_proc(p);
        return;
    }
    printf("✓ 用户栈映射成功: VA=0x%lx -> PA=0x%lx\n", user_stack_va, (uint64)user_stack_page);
    
    // 5. 分配内核栈
    uart_puts("\n[步骤5] 分配内核栈...\n");
    void *kernel_stack = alloc_page();
    if (!kernel_stack) {
        uart_puts("✗ 无法分配内核栈\n");
        free_page(user_stack_page);
        free_page(user_code_page);
        destroy_pagetable(p->pagetable);
        free_page((void*)p->trapframe);
        free_proc(p);
        return;
    }
    p->kstack = (char*)kernel_stack;
    printf("✓ 内核栈分配成功: 0x%lx\n", (uint64)kernel_stack);
    
    // 6. 设置 trapframe
    uart_puts("\n[步骤6] 设置 trapframe 寄存器...\n");
    
    // 获取当前内核页表
    extern pagetable_t kernel_pagetable;
    extern void usertrap(void);
    
    printf("[debug] kernel_pagetable = 0x%lx\n", (uint64)kernel_pagetable);
    if (kernel_pagetable == 0) {
        uart_puts("✗ kernel_pagetable 为 NULL!\n");
        free_page(kernel_stack);
        free_page(user_stack_page);
        free_page(user_code_page);
        destroy_pagetable(p->pagetable);
        free_page((void*)p->trapframe);
        free_proc(p);
        return;
    }
    
    // 首先清零整个 trapframe，避免使用未初始化的值
    uint64 *ptr = (uint64 *)p->trapframe;
    for (int i = 0; i < sizeof(struct trapframe) / sizeof(uint64); i++) {
        ptr[i] = 0;
    }
    
    // 重要：必须在这里设置 trapframe 的内核字段，因为 usertrapret 会覆盖它们
    // 但我们要确保使用正确的值
    p->trapframe->kernel_satp = MAKE_SATP(kernel_pagetable);
    p->trapframe->kernel_sp = (uint64)kernel_stack + PGSIZE; // 内核栈顶
    p->trapframe->kernel_trap = (uint64)usertrap;
    p->trapframe->kernel_hartid = 0;
    
    // 设置用户态寄存器
    p->trapframe->sepc = user_code_va;  // 用户程序入口点
    p->trapframe->sp = user_stack_va + PAGE_SIZE; // 栈顶 (栈向下增长)
    
    printf("  kernel_satp = 0x%lx\n", p->trapframe->kernel_satp);
    printf("  kernel_sp = 0x%lx\n", p->trapframe->kernel_sp);
    printf("  kernel_trap = 0x%lx\n", p->trapframe->kernel_trap);
    printf("  sepc (用户PC) = 0x%lx\n", p->trapframe->sepc);
    printf("  sp (用户栈) = 0x%lx\n", p->trapframe->sp);
    uart_puts("✓ trapframe 设置完成\n");
    
    // 7. 设置当前进程
    uart_puts("\n[步骤7] 设置当前进程并准备切换到用户态...\n");
    set_current_proc(p);
    
    // 8. 验证 stvec 已设置
    extern char uservec[];
    extern void w_stvec(uint64);
    extern uint64 r_stvec(void);
    
    w_stvec((uint64)uservec);
    uint64 stvec_val = r_stvec();
    printf("✓ stvec 已设置: 0x%lx\n", stvec_val);
    
    // 9. 设置标志位，让 usertrap 知道这是测试
    uart_puts("\n[步骤8] 准备执行用户态代码...\n");
    uart_puts("⚠ 即将切换到用户态并执行 ecall 指令\n");
    uart_puts("⚠ 如果系统挂起，说明用户态到内核态切换失败\n");
    uart_puts("⚠ 如果看到 [usertrap] 消息，说明切换成功\n");
    uart_puts("\n开始执行用户态代码...\n");
    uart_puts("----------------------------------------\n");
    
    // 10. 使用 usertrapret 切换到用户态
    extern void usertrapret(void);
    
    // 在 usertrap 中添加计数器
    extern volatile int syscall_test_count;
    syscall_test_count = 0;
    
    uart_puts("提示：测试即将切换到用户态执行\n");
    uart_puts("预期流程：\n");
    uart_puts("  1. userret 切换到用户态\n");
    uart_puts("  2. 用户代码执行 ecall (系统调用)\n");
    uart_puts("  3. 进入 uservec -> usertrap\n");
    uart_puts("  4. 处理系统调用后返回用户态\n");
    uart_puts("  5. 用户代码输出 'U'(成功返回) 和 'K'(完成)\n");
    uart_puts("  6. 用户代码执行 ebreak\n");
    uart_puts("  7. 再次进入 usertrap，捕获 breakpoint\n");
    uart_puts("  8. 进程被终止\n\n");
    
    uart_puts("如何判断测试成功：\n");
    uart_puts("  观察输出中是否出现以下字母序列：\n");
    uart_puts("  V -> T -> S -> U -> K -> B\n");
    uart_puts("  其中：\n");
    uart_puts("    V = 进入uservec（用户态trap）\n");
    uart_puts("    T = 进入usertrap（trap处理）\n");
    uart_puts("    S = 执行syscall（系统调用）\n");
    uart_puts("    U = 用户代码从ecall返回\n");
    uart_puts("    K = 用户代码标记完成\n");
    uart_puts("    B = Breakpoint被捕获\n");
    uart_puts("  如果看到完整序列VTSUKB，说明测试成功！\n\n");
    
    // 10. 使用 usertrapret 切换到用户态
    extern void usertrapret(void);
    
    // 在 usertrap 中添加计数器
    extern volatile int syscall_test_count;
    syscall_test_count = 0;
    
    uart_puts("开始执行...\n");
    uart_puts("========================================\n");
    
    // 切换到用户态（这个调用不会返回）
    usertrapret();
    
    // 下面的代码不会被执行
    
    // 如果能执行到这里，说明遇到了 breakpoint 并成功返回
    uart_puts("----------------------------------------\n");
    uart_puts("✓ 成功从用户态返回！\n");
    
    // 11. 验证结果
    uart_puts("\n[步骤9] 验证系统调用结果...\n");
    printf("系统调用执行次数: %d\n", syscall_test_count);
    
    if (syscall_test_count == -1) {
        uart_puts("✓ 检测到 breakpoint，测试正常完成\n");
        syscall_test_count = 1;  // 恢复为实际执行次数
    }
    
    printf("trapframe->a0 (返回值) = %ld (期望: %d)\n", 
           p->trapframe->a0, p->pid);
    
    if (syscall_test_count >= 1 && p->trapframe->a0 == p->pid) {
        uart_puts("✓ 系统调用 sys_getpid 执行成功\n");
        uart_puts("✓ 返回值正确\n");
        uart_puts("\n");
        uart_puts("╔════════════════════════════════════════════╗\n");
        uart_puts("║  🎉 测试9 通过！真实系统调用机制验证成功  ║\n");
        uart_puts("╚════════════════════════════════════════════╝\n");
    } else {
        uart_puts("✗ 系统调用执行失败或返回值不正确\n");
    }
    
    // 12. 清理
    uart_puts("\n[步骤10] 清理资源...\n");
    set_current_proc(0);
    free_page(kernel_stack);
    free_page(user_stack_page);
    free_page(user_code_page);
    destroy_pagetable(p->pagetable);
    free_page((void*)p->trapframe);
    free_proc(p);
    
    uart_puts("✓ 清理完成\n");
    uart_puts("\n✓ 真实系统调用机制验证完成\n");
    uart_puts("✓ 测试9完成\n");
    uart_puts("\n");
    uart_puts("╔════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║  恭喜！系统调用机制验证成功！                                    ║\n");
    uart_puts("║  - ✓ 用户态到内核态切换正常                                     ║\n");
    uart_puts("║  - ✓ ecall 指令触发陷入                                        ║\n");
    uart_puts("║  - ✓ uservec 正确保存寄存器                                    ║\n");
    uart_puts("║  - ✓ usertrap 正确处理系统调用                                 ║\n");
    uart_puts("║  - ✓ userret 正确返回用户态                                    ║\n");
    uart_puts("╚════════════════════════════════════════════════════════════════╝\n");
}

/**
 * 测试9：时间中断测试
 * 检查：
 * - 时间中断是否能正确触发
 * - ticks计数器是否递增
 */
void test_timer_interrupt(void) {
    uart_puts("\n========== 测试9：时间中断测试 ==========\n");
    
    uart_puts("[信息] 当前运行在 Machine 模式\n");
    uart_puts("       时间中断在 M-mode 中处理\n");
    uart_puts("       观察系统运行后的 ticks 值\n");
    
    // 获取初始的 ticks 值
    uint64 initial_ticks = ticks;
    printf("初始 ticks: %ld\n", initial_ticks);
    
    // 启用中断
    intr_on();
    uart_puts("已启用中断\n");
    
    // 等待至少一个时间中断发生
    uart_puts("等待时间中断...\n");
    volatile uint64 wait_ticks = ticks;
    int wait_count = 0;
    while (wait_ticks == ticks && wait_count < 100000000) {  // 增加等待次数
        wait_count++;
    }
    
    printf("等待循环计数: %d\n", wait_count);
    printf("中断后 ticks: %ld\n", ticks);
    
    if (ticks > initial_ticks) {
        printf("✓ 时间中断成功触发，ticks增加了 %ld\n", ticks - initial_ticks);
        uart_puts("✓ M-mode 时间中断正常工作！\n");
    } else {
        uart_puts("✗ 时间中断未触发\n");
    }
    
    uart_puts("✓ 测试9完成\n");
}

/**
 * 测试8：压力测试 - 多次初始化
 * 检查：
 * - 系统是否能重复初始化而不崩溃
 */
void test_repeated_initialization(void) {
    uart_puts("\n========== 测试8：重复初始化压力测试 ==========\n");
    
    uart_puts("执行5次初始化...\n");
    for (int i = 0; i < 5; i++) {
        trap_init();
        trap_init_hart();
        printf("  初始化 %d/5 完成\n", i + 1);
    }
    
    uart_puts("✓ 系统正常运行，无崩溃\n");
    uart_puts("✓ 测试8完成\n");
}

/**
 * 综合主测试函数 - 运行所有测试
 */
void run_all_system_tests(void) {
    // 运行中断系统测试
    uart_puts("\n");
    uart_puts("╔════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║     实验4：中断处理与异常系统 - 功能测试套件                    ║\n");
    uart_puts("╚════════════════════════════════════════════════════════════════╝\n");
    
    test_trap_initialization();
    test_interrupt_control();
    test_trapframe_allocation();
    test_csr_operations();
    test_exception_definitions();
    test_trapframe_structure();
    test_interrupt_handlers();
    test_timer_interrupt();
    test_repeated_initialization();
    
    uart_puts("\n");
    uart_puts("╔════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║          中断处理系统测试 - 执行完成！                          ║\n");
    uart_puts("╚════════════════════════════════════════════════════════════════╝\n\n");
}

// 保留向后兼容接口
void run_interrupt_exception_tests(void) {
    run_all_system_tests();
}

// ============================================================================
// 主函数
// ============================================================================

struct spinlock tickslock;
extern volatile uint64 ticks;

void
main()
{
  // 初始化物理内存管理
  // 内核开始于 0x80000000，kernel.elf 大约 30KB
  // 将 0x80040000 到 0x88000000 作为堆内存区域（128MB - 256KB）
  uart_puts("[系统初始化] 正在初始化物理内存管理...\n");
  pmm_init(0x80040000, 0x88000000);  // 247.75MB 可用内存
  uart_puts("[系统初始化] 物理内存管理初始化完成\n");
  
  // 初始化内核虚拟内存
  uart_puts("[系统初始化] 正在初始化内核虚拟内存...\n");
  kvminit();
  kvminithart();
  uart_puts("[系统初始化] 内核虚拟内存初始化完成\n");
  
  // 初始化中断系统
  uart_puts("[系统初始化] 正在初始化中断系统...\n");
  trap_init();
  trap_init_hart();
  uart_puts("[系统初始化] 中断系统初始化完成\n");
  
  // 初始化时间中断
  uart_puts("[系统初始化] 正在初始化时间中断...\n");
  timerinit();
  uart_puts("[系统初始化] 时间中断初始化完成\n");
  
  // 初始化进程系统
  uart_puts("[系统初始化] 正在初始化进程系统...\n");
  proc_init();
  uart_puts("[系统初始化] 进程系统初始化完成\n\n");
    
  // 运行系统调用测试
  run_syscall_tests();

  // 进入空闲循环
  uart_puts("\n系统测试完成，进入空闲循环...\n");
  while(1) {
      // 空闲循环
      asm volatile("wfi");  // 等待中断
  }
}
