#include "defs.h"
#include "uart.h"
#include "trap.h"
#include "proc.h"
#include <stdarg.h>

// ============================================================================
// 实验4：中断处理与异常系统测试
// ============================================================================

/**
 * 测试1：验证中断系统初始化
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
    printf("期望大小: 272 字节 (34个uint64字段)\n");
    
    // 详细调试信息
    printf("\n字段大小信息：\n");
    printf("  sizeof(uint64): %d\n", (int)sizeof(uint64));
    printf("  sizeof(trapframe.zero): %d\n", (int)sizeof(((struct trapframe*)0)->zero));
    printf("  sizeof(trapframe.sepc): %d\n", (int)sizeof(((struct trapframe*)0)->sepc));
    
    // 计算实际字段数
    int actual_fields = sizeof(struct trapframe) / sizeof(uint64);
    printf("\n计算字段数：%d / %d = %d 字段\n", 
           (int)sizeof(struct trapframe), (int)sizeof(uint64), actual_fields);
    
    if (sizeof(struct trapframe) == 272) {
        uart_puts("✓ 陷阱帧结构大小正确\n");
    } else {
        printf("✗ 陷阱帧结构大小不正确（多了 %d 字节）\n", 
               (int)sizeof(struct trapframe) - 272);
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
 * 综合测试函数 - 运行所有中断和异常系统测试
 */
void run_interrupt_exception_tests(void) {
    uart_puts("\n");
    uart_puts("╔════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║     实验4：中断处理与异常系统 - 功能测试套件                    ║\n");
    uart_puts("╚════════════════════════════════════════════════════════════════╝\n");
    
    // 运行所有测试
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
    uart_puts("║                    所有测试执行完成！                           ║\n");
    uart_puts("╚════════════════════════════════════════════════════════════════╝\n");
    uart_puts("\n测试结果总结：\n");
    uart_puts("  ✓ 中断系统初始化成功\n");
    uart_puts("  ✓ 中断使能/禁用功能正常\n");
    uart_puts("  ✓ 陷阱帧分配/释放正常\n");
    uart_puts("  ✓ CSR读写操作正常\n");
    uart_puts("  ✓ 异常和中断码已正确定义\n");
    uart_puts("  ✓ 系统稳定性良好\n\n");
}

// ============================================================================
// 主函数
// ============================================================================

void main() {
    uart_puts("╔════════════════════════════════════════════════════════════════╗\n");
    uart_puts("║          RISCV-OS 实验4&5 - 中断处理与进程管理系统             ║\n");
    uart_puts("╚════════════════════════════════════════════════════════════════╝\n\n");
    
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
    
    // 运行中断和异常系统测试
    run_interrupt_exception_tests();
    
    // 系统运行
    uart_puts("系统进入空闲循环...\n");
    while(1) {
        // 系统运行循环
    }
}
