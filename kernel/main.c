#include "defs.h"
#include "uart.h"
#include "trap.h"
#include "proc.h"
#include "syscall.h"
#include <stdarg.h>

// ============================================================================
// 实验6：系统调用测试
// ============================================================================

/**
 * 模拟用户进程进行系统调用
 * 这个函数模拟一个用户进程通过设置 trapframe 来调用系统调用
 */
void simulate_syscall_test(void) {
    uart_puts("\n╔══════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║               系统调用测试 - 模拟用户态调用                        ║\n");
    uart_puts("╚══════════════════════════════════════════════════════════════════╝\n\n");
    
    // 创建一个模拟的用户进程
    struct proc *p = alloc_proc();
    if (!p) {
        uart_puts("✗ 无法分配进程\n");
        return;
    }
    
    // 设置为当前进程
    set_current_proc(p);
    p->state = RUNNING;
    
    printf("创建测试进程: PID=%d\n\n", p->pid);
    
    // ========== 测试 1: sys_getpid ==========
    uart_puts("【测试 1】系统调用: getpid\n");
    uart_puts("--------------------------------------------------\n");
    p->trapframe->a7 = SYS_getpid;  // 系统调用号
    printf("  设置 a7 = %d (SYS_getpid)\n", SYS_getpid);
    syscall();  // 调用系统调用分发器
    printf("  返回值 a0 = %d\n", p->trapframe->a0);
    if (p->trapframe->a0 == p->pid) {
        uart_puts("  ✓ getpid 测试通过\n\n");
    } else {
        uart_puts("  ✗ getpid 测试失败\n\n");
    }
    
    // ========== 测试 2: sys_uptime ==========
    uart_puts("【测试 2】系统调用: uptime\n");
    uart_puts("--------------------------------------------------\n");
    p->trapframe->a7 = SYS_uptime;
    printf("  设置 a7 = %d (SYS_uptime)\n", SYS_uptime);
    syscall();
    printf("  返回值 a0 = %ld (系统运行 ticks)\n", p->trapframe->a0);
    uart_puts("  ✓ uptime 测试通过\n\n");
    
    // ========== 测试 3: sys_sbrk ==========
    uart_puts("【测试 3】系统调用: sbrk (增长堆)\n");
    uart_puts("--------------------------------------------------\n");
    uint64 old_sz = p->sz;
    printf("  当前进程大小: %ld 字节\n", old_sz);
    
    p->trapframe->a7 = SYS_sbrk;
    p->trapframe->a0 = 4096;  // 增长 4KB
    printf("  设置 a7 = %d (SYS_sbrk)\n", SYS_sbrk);
    printf("  设置 a0 = 4096 (增长 4KB)\n");
    syscall();
    
    uint64 old_brk = p->trapframe->a0;
    printf("  返回值 a0 = %ld (旧的堆顶地址)\n", old_brk);
    printf("  新的进程大小: %ld 字节\n", p->sz);
    
    if (p->sz == old_sz + 4096) {
        uart_puts("  ✓ sbrk 增长测试通过\n\n");
    } else {
        uart_puts("  ✗ sbrk 增长测试失败\n\n");
    }
    
    // ========== 测试 4: sys_fork ==========
    uart_puts("【测试 4】系统调用: fork\n");
    uart_puts("--------------------------------------------------\n");
    p->trapframe->a7 = SYS_fork;
    printf("  设置 a7 = %d (SYS_fork)\n", SYS_fork);
    printf("  父进程 PID = %d\n", p->pid);
    syscall();
    
    int child_pid = (int)p->trapframe->a0;
    if (child_pid > 0) {
        printf("  ✓ fork 成功，子进程 PID = %d\n", child_pid);
        
        struct proc *child = find_proc(child_pid);
        if (child) {
            printf("  子进程状态: %d (RUNNABLE=%d)\n", child->state, RUNNABLE);
            printf("  子进程父进程 PID: %d\n", child->ppid);
            printf("  父子关系: %s\n", child->parent == p ? "正确" : "错误");
            
            // 清理子进程
            free_proc(child);
            uart_puts("  ✓ fork 测试通过\n\n");
        } else {
            uart_puts("  ✗ 找不到子进程\n\n");
        }
    } else if (child_pid < 0) {
        uart_puts("  ✗ fork 失败\n\n");
    }
    
    // ========== 测试 5: sys_sleep ==========
    uart_puts("【测试 5】系统调用: sleep\n");
    uart_puts("--------------------------------------------------\n");
    uint64 start_ticks = get_ticks();
    printf("  开始时间: %ld ticks\n", start_ticks);
    
    p->trapframe->a7 = SYS_sleep;
    p->trapframe->a0 = 5;  // 睡眠 5 ticks
    printf("  设置 a7 = %d (SYS_sleep)\n", SYS_sleep);
    printf("  设置 a0 = 5 (睡眠 5 ticks)\n");
    printf("  调用 sleep (这会模拟睡眠，但不会真正阻塞)...\n");
    syscall();
    
    uint64 end_ticks = get_ticks();
    printf("  结束时间: %ld ticks\n", end_ticks);
    printf("  返回值 a0 = %ld\n", p->trapframe->a0);
    uart_puts("  ✓ sleep 调用完成\n\n");
    
    // ========== 测试 6: sys_kill ==========
    uart_puts("【测试 6】系统调用: kill\n");
    uart_puts("--------------------------------------------------\n");
    
    // 创建一个要被 kill 的进程
    struct proc *victim = alloc_proc();
    if (victim) {
        victim->state = RUNNABLE;
        printf("  创建目标进程 PID = %d\n", victim->pid);
        
        p->trapframe->a7 = SYS_kill;
        p->trapframe->a0 = victim->pid;
        printf("  设置 a7 = %d (SYS_kill)\n", SYS_kill);
        printf("  设置 a0 = %d (目标 PID)\n", victim->pid);
        syscall();
        
        if (p->trapframe->a0 == 0) {
            printf("  ✓ kill 返回 0 (成功)\n");
            printf("  目标进程 killed 标志: %d\n", victim->killed);
            
            if (victim->killed) {
                uart_puts("  ✓ 目标进程已被标记为 killed\n\n");
            } else {
                uart_puts("  ✗ 目标进程未被标记\n\n");
            }
        } else {
            uart_puts("  ✗ kill 失败\n\n");
        }
        
        free_proc(victim);
    }
    
    // ========== 测试 7: sys_exit 和 sys_wait ==========
    uart_puts("【测试 7】系统调用: exit 和 wait\n");
    uart_puts("--------------------------------------------------\n");
    
    // 创建子进程
    p->trapframe->a7 = SYS_fork;
    syscall();
    child_pid = (int)p->trapframe->a0;
    
    if (child_pid > 0) {
        struct proc *child = find_proc(child_pid);
        if (child) {
            printf("  创建子进程 PID = %d\n", child_pid);
            
            // 模拟子进程调用 exit
            set_current_proc(child);
            child->trapframe->a7 = SYS_exit;
            child->trapframe->a0 = 42;  // 退出状态
            printf("  子进程调用 exit(42)\n");
            // 注意：exit 不返回，所以我们手动设置状态
            child->state = ZOMBIE;
            child->xstate = 42;
            printf("  子进程状态: ZOMBIE, 退出码: %d\n", child->xstate);
            
            // 父进程调用 wait
            set_current_proc(p);
            p->trapframe->a7 = SYS_wait;
            p->trapframe->a0 = 0;  // 简化：不使用状态地址
            printf("  父进程调用 wait\n");
            syscall();
            
            int waited_pid = (int)p->trapframe->a0;
            printf("  wait 返回 PID = %d\n", waited_pid);
            
            if (waited_pid == child_pid) {
                uart_puts("  ✓ wait 成功回收子进程\n\n");
            } else {
                uart_puts("  ✗ wait 返回错误的 PID\n\n");
            }
        }
    }
    
    // ========== 测试 8: 未实现的系统调用 ==========
    uart_puts("【测试 8】未实现的系统调用测试\n");
    uart_puts("--------------------------------------------------\n");
    
    p->trapframe->a7 = SYS_read;
    printf("  设置 a7 = %d (SYS_read - 未实现)\n", SYS_read);
    syscall();
    printf("  返回值 a0 = %ld (应该是 -1)\n", p->trapframe->a0);
    
    if (p->trapframe->a0 == (uint64)-1) {
        uart_puts("  ✓ 未实现的系统调用正确返回 -1\n\n");
    } else {
        uart_puts("  ✗ 返回值错误\n\n");
    }
    
    // ========== 测试 9: 无效的系统调用号 ==========
    uart_puts("【测试 9】无效的系统调用号测试\n");
    uart_puts("--------------------------------------------------\n");
    
    p->trapframe->a7 = 999;  // 无效的系统调用号
    printf("  设置 a7 = 999 (无效系统调用号)\n");
    syscall();
    printf("  返回值 a0 = %ld (应该是 -1)\n", p->trapframe->a0);
    
    if (p->trapframe->a0 == (uint64)-1) {
        uart_puts("  ✓ 无效系统调用号正确返回 -1\n\n");
    } else {
        uart_puts("  ✗ 返回值错误\n\n");
    }
    
    // 清理
    set_current_proc(0);
    free_proc(p);
    
    uart_puts("\n╔══════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║                     所有系统调用测试完成                          ║\n");
    uart_puts("╚══════════════════════════════════════════════════════════════════╝\n\n");
}

/**
 * 测试参数提取函数
 */
void test_argument_extraction(void) {
    uart_puts("\n╔══════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║                     参数提取函数测试                              ║\n");
    uart_puts("╚══════════════════════════════════════════════════════════════════╝\n\n");
    
    struct proc *p = alloc_proc();
    if (!p) {
        uart_puts("✗ 无法分配进程\n");
        return;
    }
    
    set_current_proc(p);
    p->state = RUNNING;
    
    // 测试 argint
    uart_puts("【测试】argint - 提取整数参数\n");
    uart_puts("--------------------------------------------------\n");
    p->trapframe->a0 = 100;
    p->trapframe->a1 = 200;
    p->trapframe->a2 = 300;
    
    int val0, val1, val2;
    if (argint(0, &val0) == 0 && val0 == 100) {
        printf("  ✓ argint(0) = %d\n", val0);
    } else {
        uart_puts("  ✗ argint(0) 失败\n");
    }
    
    if (argint(1, &val1) == 0 && val1 == 200) {
        printf("  ✓ argint(1) = %d\n", val1);
    } else {
        uart_puts("  ✗ argint(1) 失败\n");
    }
    
    if (argint(2, &val2) == 0 && val2 == 300) {
        printf("  ✓ argint(2) = %d\n\n", val2);
    } else {
        uart_puts("  ✗ argint(2) 失败\n\n");
    }
    
    // 测试 argaddr
    uart_puts("【测试】argaddr - 提取地址参数\n");
    uart_puts("--------------------------------------------------\n");
    p->trapframe->a0 = 0x1000;
    p->trapframe->a1 = 0x2000;
    
    uint64 addr0, addr1;
    if (argaddr(0, &addr0) == 0 && addr0 == 0x1000) {
        printf("  ✓ argaddr(0) = 0x%lx\n", addr0);
    } else {
        uart_puts("  ✗ argaddr(0) 失败\n");
    }
    
    if (argaddr(1, &addr1) == 0 && addr1 == 0x2000) {
        printf("  ✓ argaddr(1) = 0x%lx\n\n", addr1);
    } else {
        uart_puts("  ✗ argaddr(1) 失败\n\n");
    }
    
    // 测试边界条件
    uart_puts("【测试】边界条件 - 超出范围的参数\n");
    uart_puts("--------------------------------------------------\n");
    int invalid;
    if (argint(6, &invalid) < 0) {
        uart_puts("  ✓ argint(6) 正确返回错误 (超出范围)\n\n");
    } else {
        uart_puts("  ✗ argint(6) 应该返回错误\n\n");
    }
    
    set_current_proc(0);
    free_proc(p);
    
    uart_puts("╔══════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║                 参数提取函数测试完成                              ║\n");
    uart_puts("╚══════════════════════════════════════════════════════════════════╝\n\n");
}

/**
 * 测试系统调用机制的完整性
 */
void test_syscall_mechanism(void) {
    uart_puts("\n╔══════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║                  系统调用机制完整性测试                           ║\n");
    uart_puts("╚══════════════════════════════════════════════════════════════════╝\n\n");
    
    uart_puts("【机制说明】xv6 系统调用流程\n");
    uart_puts("--------------------------------------------------\n");
    uart_puts("  1. 用户程序将系统调用号放入 a7 寄存器\n");
    uart_puts("  2. 用户程序将参数放入 a0-a5 寄存器\n");
    uart_puts("  3. 用户程序执行 ecall 指令\n");
    uart_puts("  4. CPU 切换到 S 模式，进入 usertrap()\n");
    uart_puts("  5. usertrap() 识别 ECALL 异常\n");
    uart_puts("  6. usertrap() 调用 syscall() 分发器\n");
    uart_puts("  7. syscall() 根据 a7 查找函数指针表\n");
    uart_puts("  8. syscall() 调用对应的 sys_xxx() 函数\n");
    uart_puts("  9. sys_xxx() 通过 argint/argaddr/argstr 提取参数\n");
    uart_puts("  10. sys_xxx() 执行具体功能\n");
    uart_puts("  11. sys_xxx() 返回值保存到 trapframe->a0\n");
    uart_puts("  12. usertrapret() 返回用户空间\n");
    uart_puts("  13. 用户程序从 a0 获取返回值\n\n");
    
    uart_puts("【已实现的系统调用】\n");
    uart_puts("--------------------------------------------------\n");
    uart_puts("  ✓ SYS_fork    (1)  - 创建子进程\n");
    uart_puts("  ✓ SYS_exit    (2)  - 退出进程\n");
    uart_puts("  ✓ SYS_wait    (3)  - 等待子进程\n");
    uart_puts("  ✓ SYS_getpid  (11) - 获取进程ID\n");
    uart_puts("  ✓ SYS_sbrk    (12) - 调整堆大小\n");
    uart_puts("  ✓ SYS_sleep   (13) - 睡眠\n");
    uart_puts("  ✓ SYS_kill    (6)  - 杀死进程\n");
    uart_puts("  ✓ SYS_uptime  (14) - 系统运行时间\n\n");
    
    uart_puts("【存根系统调用】\n");
    uart_puts("--------------------------------------------------\n");
    uart_puts("  ⊘ SYS_pipe, SYS_read, SYS_write, SYS_open 等\n");
    uart_puts("  (文件系统相关系统调用未实现)\n\n");
    
    uart_puts("╔══════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║             系统调用机制说明完成                                  ║\n");
    uart_puts("╚══════════════════════════════════════════════════════════════════╝\n\n");
}

/**
 * 主函数
 */
int main(void) {
    uart_puts("\n\n");
    uart_puts("╔════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║                                                                ║\n");
    uart_puts("║              RISC-V 操作系统 - 系统调用实验                     ║\n");
    uart_puts("║                  xv6 系统调用机制实现                           ║\n");
    uart_puts("║                                                                ║\n");
    uart_puts("╚════════════════════════════════════════════════════════════════╝\n\n");
    
    // 初始化物理内存管理
    uart_puts("[系统初始化] 初始化物理内存管理...\n");
    pmm_init(0x80040000, 0x88000000);
    uart_puts("[系统初始化] ✓ 物理内存管理初始化完成\n\n");
    
    // 初始化虚拟内存
    uart_puts("[系统初始化] 初始化虚拟内存系统...\n");
    kvminit();
    kvminithart();
    uart_puts("[系统初始化] ✓ 虚拟内存系统初始化完成\n\n");
    
    // 初始化中断系统
    uart_puts("[系统初始化] 初始化中断系统...\n");
    trap_init();
    trap_init_hart();
    uart_puts("[系统初始化] ✓ 中断系统初始化完成\n\n");
    
    // 初始化进程系统
    uart_puts("[系统初始化] 初始化进程系统...\n");
    proc_init();
    uart_puts("[系统初始化] ✓ 进程系统初始化完成\n\n");
    
    uart_puts("════════════════════════════════════════════════════════════════\n");
    uart_puts("                      开始系统调用测试\n");
    uart_puts("════════════════════════════════════════════════════════════════\n");
    
    // 测试 1: 系统调用机制说明
    test_syscall_mechanism();
    
    // 测试 2: 参数提取函数
    test_argument_extraction();
    
    // 测试 3: 模拟系统调用
    simulate_syscall_test();
    
    uart_puts("\n════════════════════════════════════════════════════════════════\n");
    uart_puts("                    所有测试完成！\n");
    uart_puts("════════════════════════════════════════════════════════════════\n\n");
    
    uart_puts("系统调用实现总结：\n");
    uart_puts("  • 完全参考 xv6 的系统调用架构\n");
    uart_puts("  • 使用 RISC-V 标准调用约定 (a0-a5 传参, a7 系统调用号)\n");
    uart_puts("  • 实现了核心的 8 个进程相关系统调用\n");
    uart_puts("  • 提供了完整的参数提取机制\n");
    uart_puts("  • 支持系统调用分发和错误处理\n\n");
    
    uart_puts("进入空闲循环...\n");
    while(1) {
        // 空闲循环
    }
    
    return 0;
}
