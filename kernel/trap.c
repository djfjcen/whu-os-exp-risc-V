/*
 * trap.c - RISC-V 中断处理框架实现
 * 基于 xv6 架构，支持中断嵌套、优先级管理和共享中断
 */

#include "trap.h"
#include "uart.h"
#include "defs.h"
#include <stdint.h>

// 全局中断控制器实例
static struct interrupt_controller ic;
static struct interrupt_stats stats;

// 中断名称映射表
static const char* trap_names[] = {
    [0] = "Instruction Address Misaligned",
    [1] = "Instruction Access Fault", 
    [2] = "Illegal Instruction",
    [3] = "Breakpoint",
    [4] = "Load Address Misaligned",
    [5] = "Load Access Fault",
    [6] = "Store Address Misaligned", 
    [7] = "Store Access Fault",
    [8] = "Environment Call from U-mode",
    [9] = "Environment Call from S-mode",
    [10] = "Reserved",
    [11] = "Environment Call from M-mode",
    [12] = "Instruction Page Fault",
    [13] = "Load Page Fault", 
    [14] = "Reserved",
    [15] = "Store Page Fault"
};

// 汇编函数声明
extern void disable_interrupts_asm(void);
extern void enable_interrupts_asm(void);
extern int read_interrupt_status(void);

// 前向声明
static void print_decimal(uint64_t value);
static void print_hex(uint64_t value);

// 外部声明
extern pagetable_t kernel_pagetable;

// 中断栈管理函数声明
extern void init_interrupt_stack(void);
extern int enter_interrupt_handler(struct trap_frame* tf);
extern void exit_interrupt_handler(struct trap_frame* tf);
extern void print_stack_stats(void);
extern void set_context_save_config(save_level_t level, int save_callee, int enable_checks);
extern struct context_save_config* get_save_config(void);

/**
 * 初始化中断系统
 */
void trap_init(void) {
    uart_puts("初始化中断系统...\n");
    
    // 初始化中断栈系统
    init_interrupt_stack();
    
    // 清零中断控制器状态
    for (int i = 0; i < MAX_INTERRUPT_HANDLERS; i++) {
        ic.handlers[i] = 0;
        stats.irq_counts[i] = 0;
    }
    
    ic.enabled_mask = 0;
    ic.pending_mask = 0;
    ic.nest_level = 0;
    ic.current_irq = -1;
    ic.current_tf = 0;
    
    // 初始化统计信息
    stats.total_interrupts = 0;
    stats.nested_interrupts = 0;
    stats.spurious_interrupts = 0;
    stats.max_nest_level = 0;
    
    // 设置中断向量表（默认使用完整向量）
    extern void kernelvec(void);
    write_csr(stvec, (uint64_t)kernelvec);
    
    uart_puts("中断系统初始化完成\n");
}

/**
 * 注册中断处理函数
 */
int register_interrupt(int irq, interrupt_handler_t handler, void* data, 
                      const char* name, uint32_t flags, uint32_t priority) {
    if (irq < 0 || irq >= MAX_INTERRUPT_HANDLERS || !handler) {
        return -1; // 参数无效
    }
    
    // 分配中断描述符
    struct interrupt_desc* desc = (struct interrupt_desc*)alloc_page();
    if (!desc) {
        return -1; // 内存不足
    }
    
    // 初始化描述符
    desc->handler = handler;
    desc->data = data;
    desc->flags = flags;
    desc->priority = priority;
    desc->count = 0;
    desc->next = 0;
    
    // 复制名称
    int i = 0;
    if (name) {
        while (i < 31 && name[i]) {
            desc->name[i] = name[i];
            i++;
        }
    }
    desc->name[i] = '\0';
    
    // 禁用中断以保证原子操作
    disable_interrupts();
    
    if (ic.handlers[irq] == 0) {
        // 第一个处理函数
        ic.handlers[irq] = desc;
    } else if (flags & IRQ_FLAG_SHARED) {
        // 共享中断，添加到链表
        struct interrupt_desc* current = ic.handlers[irq];
        while (current->next) {
            current = current->next;
        }
        current->next = desc;
    } else {
        // 不支持共享，返回错误
        enable_interrupts();
        free_page((void*)desc);
        return -1;
    }
    
    enable_interrupts();
    
    uart_puts("注册中断处理函数: IRQ ");
    uart_putc('0' + (irq % 10));
    uart_puts(" - ");
    uart_puts(desc->name);
    uart_puts("\n");
    
    return 0;
}

/**
 * 注销中断处理函数
 */
int unregister_interrupt(int irq, interrupt_handler_t handler) {
    if (irq < 0 || irq >= MAX_INTERRUPT_HANDLERS || !handler) {
        return -1;
    }
    
    disable_interrupts();
    
    struct interrupt_desc* current = ic.handlers[irq];
    struct interrupt_desc* prev = 0;
    
    // 查找要删除的处理函数
    while (current) {
        if (current->handler == handler) {
            // 从链表中移除
            if (prev) {
                prev->next = current->next;
            } else {
                ic.handlers[irq] = current->next;
            }
            
            // 释放内存
            free_page((void*)current);
            enable_interrupts();
            return 0;
        }
        prev = current;
        current = current->next;
    }
    
    enable_interrupts();
    return -1; // 未找到
}

/**
 * 启用特定中断
 */
void enable_interrupt(int irq) {
    if (irq < 0 || irq >= MAX_INTERRUPT_HANDLERS) {
        return;
    }
    
    disable_interrupts();
    ic.enabled_mask |= (1UL << irq);
    
    // 根据中断类型设置硬件寄存器
    switch (irq) {
        case TRAP_SUPERVISOR_SOFTWARE_INTERRUPT:
            set_csr(sie, SIE_SSIE);
            break;
        case TRAP_SUPERVISOR_TIMER_INTERRUPT:
            set_csr(sie, SIE_STIE);
            break;
        case TRAP_SUPERVISOR_EXTERNAL_INTERRUPT:
            set_csr(sie, SIE_SEIE);
            break;
    }
    
    enable_interrupts();
}

/**
 * 禁用特定中断
 */
void disable_interrupt(int irq) {
    if (irq < 0 || irq >= MAX_INTERRUPT_HANDLERS) {
        return;
    }
    
    disable_interrupts();
    ic.enabled_mask &= ~(1UL << irq);
    
    // 根据中断类型清除硬件寄存器
    switch (irq) {
        case TRAP_SUPERVISOR_SOFTWARE_INTERRUPT:
            clear_csr(sie, SIE_SSIE);
            break;
        case TRAP_SUPERVISOR_TIMER_INTERRUPT:
            clear_csr(sie, SIE_STIE);
            break;
        case TRAP_SUPERVISOR_EXTERNAL_INTERRUPT:
            clear_csr(sie, SIE_SEIE);
            break;
    }
    
    enable_interrupts();
}

/**
 * 全局启用中断
 */
void enable_interrupts(void) {
    enable_interrupts_asm();
}

/**
 * 全局禁用中断
 */
void disable_interrupts(void) {
    disable_interrupts_asm();
}

/**
 * 检查中断是否启用
 */
int is_interrupt_enabled(int irq) {
    if (irq < 0 || irq >= MAX_INTERRUPT_HANDLERS) {
        return 0;
    }
    return (ic.enabled_mask & (1UL << irq)) ? 1 : 0;
}

/**
 * 设置中断优先级
 */
void set_interrupt_priority(int irq, uint32_t priority) {
    if (irq < 0 || irq >= MAX_INTERRUPT_HANDLERS) {
        return;
    }
    
    struct interrupt_desc* desc = ic.handlers[irq];
    while (desc) {
        desc->priority = priority;
        desc = desc->next;
    }
}

/**
 * 获取中断优先级
 */
uint32_t get_interrupt_priority(int irq) {
    if (irq < 0 || irq >= MAX_INTERRUPT_HANDLERS || !ic.handlers[irq]) {
        return IRQ_PRIORITY_LOWEST;
    }
    return ic.handlers[irq]->priority;
}

/**
 * 处理具体中断
 */
void handle_interrupt(int irq, struct trap_frame* tf) {
    if (irq < 0 || irq >= MAX_INTERRUPT_HANDLERS) {
        stats.spurious_interrupts++;
        return;
    }
    
    // 检查是否启用
    if (!(ic.enabled_mask & (1UL << irq))) {
        stats.spurious_interrupts++;
        return;
    }
    
    struct interrupt_desc* desc = ic.handlers[irq];
    if (!desc) {
        stats.spurious_interrupts++;
        return;
    }
    
    // 更新统计信息
    stats.irq_counts[irq]++;
    
    // 处理中断嵌套
    uint32_t old_irq = ic.current_irq;
    struct trap_frame* old_tf = ic.current_tf;
    
    ic.current_irq = irq;
    ic.current_tf = tf;
    ic.nest_level++;
    
    if (ic.nest_level > 1) {
        stats.nested_interrupts++;
    }
    if (ic.nest_level > stats.max_nest_level) {
        stats.max_nest_level = ic.nest_level;
    }
    
    // 如果支持中断嵌套，重新启用中断
    if (desc->flags & IRQ_FLAG_NESTABLE) {
        enable_interrupts();
    }
    
    // 调用所有注册的处理函数（支持共享中断）
    int handled = 0;
    while (desc) {
        int result = desc->handler(irq, desc->data, tf);
        if (result == 0) {
            handled = 1;
            desc->count++;
        }
        desc = desc->next;
    }
    
    // 如果启用了嵌套，需要重新禁用中断
    if (ic.handlers[irq]->flags & IRQ_FLAG_NESTABLE) {
        disable_interrupts();
    }
    
    // 恢复嵌套状态
    ic.nest_level--;
    ic.current_irq = old_irq;
    ic.current_tf = old_tf;
    
    if (!handled) {
        stats.spurious_interrupts++;
    }
}

/**
 * 处理异常
 */
void handle_exception(int cause, struct trap_frame* tf) {
    uart_puts("异常发生: ");
    uart_puts(get_trap_name(cause));
    uart_puts("\n");
    
    // 更新异常统计
    stats.total_exceptions++;
    
    // 根据异常类型进行处理
    switch (cause) {
        case TRAP_ENVIRONMENT_CALL_FROM_U_MODE:
        case TRAP_ENVIRONMENT_CALL_FROM_S_MODE:
            handle_syscall(tf);
            break;
            
        case TRAP_INSTRUCTION_PAGE_FAULT:
            handle_instruction_page_fault(tf);
            break;
            
        case TRAP_LOAD_PAGE_FAULT:
            handle_load_page_fault(tf);
            break;
            
        case TRAP_STORE_PAGE_FAULT:
            handle_store_page_fault(tf);
            break;
            
        case TRAP_INSTRUCTION_ADDRESS_MISALIGNED:
        case TRAP_LOAD_ADDRESS_MISALIGNED:
        case TRAP_STORE_ADDRESS_MISALIGNED:
            handle_misaligned_access(tf, cause);
            break;
            
        case TRAP_INSTRUCTION_ACCESS_FAULT:
        case TRAP_LOAD_ACCESS_FAULT:
        case TRAP_STORE_ACCESS_FAULT:
            handle_access_fault(tf, cause);
            break;
            
        case TRAP_ILLEGAL_INSTRUCTION:
            handle_illegal_instruction(tf);
            break;
            
        case TRAP_BREAKPOINT:
            handle_breakpoint(tf);
            break;
            
        default:
            uart_puts("未知异常类型: ");
            print_decimal(cause);
            uart_puts("\n");
            panic("Unknown exception");
    }
}

/**
 * 通用中断处理入口
 */
void trap_handler(struct trap_frame* tf) {
    stats.total_interrupts++;
    
    uint64_t scause = read_csr(scause);
    int is_interrupt = (scause & (1UL << 63)) ? 1 : 0;
    int cause = scause & 0x7FFFFFFFFFFFFFFF;
    
    if (is_interrupt) {
        // 处理中断
        handle_interrupt(cause, tf);
    } else {
        // 处理异常
        handle_exception(cause, tf);
    }
}

/**
 * 获取中断/异常名称
 */
const char* get_trap_name(int cause) {
    if (cause >= 0 && cause < 16 && trap_names[cause]) {
        return trap_names[cause];
    }
    return "Unknown Trap";
}

/**
 * 打印中断上下文
 */
void dump_trap_frame(struct trap_frame* tf) {
    uart_puts("=== Trap Frame Dump ===\n");
    uart_puts("SEPC:    0x"); print_hex(tf->sepc); uart_puts("\n");
    uart_puts("SSTATUS: 0x"); print_hex(tf->sstatus); uart_puts("\n");
    uart_puts("RA:      0x"); print_hex(tf->x1); uart_puts("\n");
    uart_puts("SP:      0x"); print_hex(tf->x2); uart_puts("\n");
    uart_puts("GP:      0x"); print_hex(tf->x3); uart_puts("\n");
    uart_puts("A0:      0x"); print_hex(tf->x10); uart_puts("\n");
    uart_puts("A1:      0x"); print_hex(tf->x11); uart_puts("\n");
}

/**
 * 辅助函数：打印十进制数
 */
static void print_decimal(uint64_t value) {
    if (value == 0) {
        uart_putc('0');
        return;
    }
    
    char buffer[21]; // 最大64位数字
    int pos = 0;
    
    while (value > 0) {
        buffer[pos++] = '0' + (value % 10);
        value /= 10;
    }
    
    for (int i = pos - 1; i >= 0; i--) {
        uart_putc(buffer[i]);
    }
}

/**
 * 快速中断处理函数
 * 用于处理简单、频繁的中断
 */
void fast_interrupt_handler(struct trap_frame* tf) {
    uint64_t scause = read_csr(scause);
    int is_interrupt = (scause & (1UL << 63)) ? 1 : 0;
    int cause = scause & 0x7FFFFFFFFFFFFFFF;
    
    if (is_interrupt) {
        stats.total_interrupts++;
        
        // 只处理常见的中断类型
        switch (cause) {
            case TRAP_SUPERVISOR_TIMER_INTERRUPT:
                // 简单的定时器处理
                if (ic.handlers[cause]) {
                    ic.handlers[cause]->handler(cause, ic.handlers[cause]->data, tf);
                }
                break;
                
            case TRAP_SUPERVISOR_SOFTWARE_INTERRUPT:
                // 软件中断处理
                if (ic.handlers[cause]) {
                    ic.handlers[cause]->handler(cause, ic.handlers[cause]->data, tf);
                }
                break;
                
            default:
                // 其他中断转到完整处理流程
                trap_handler(tf);
                break;
        }
    } else {
        // 异常必须用完整处理流程
        trap_handler(tf);
    }
}

/**
 * 最小中断处理函数
 * 用于处理最关键的中断，保证最低延迟
 */
void minimal_interrupt_handler(struct trap_frame* tf) {
    uint64_t scause = read_csr(scause);
    int cause = scause & 0x7FFFFFFFFFFFFFFF;
    
    // 只处理定时器中断
    if (cause == TRAP_SUPERVISOR_TIMER_INTERRUPT) {
        stats.total_interrupts++;
        
        // 最简单的定时器处理
        static volatile int timer_ticks = 0;
        timer_ticks++;
        
        // 清除中断标志（如果需要）
        // 这里可能需要特定硬件的操作
    } else {
        // 其他情况转到完整处理
        trap_handler(tf);
    }
}

/**
 * 用户中断处理函数
 * 处理从用户空间来的中断和异常
 */
void user_trap_handler(struct trap_frame* tf) {
    uint64_t scause = read_csr(scause);
    int is_interrupt = (scause & (1UL << 63)) ? 1 : 0;
    int cause = scause & 0x7FFFFFFFFFFFFFFF;
    
    // 确保处于supervisor模式
    if ((tf->sstatus & SSTATUS_SPP) != 0) {
        uart_puts("错误：用户中断处理中检测到特权模式错误\n");
        dump_trap_frame(tf);
        while (1) {}
    }
    
    if (is_interrupt) {
        // 用户空间的中断处理
        handle_interrupt(cause, tf);
    } else {
        // 用户空间的异常处理
        handle_exception(cause, tf);
    }
}

/**
 * 内核panic处理函数
 */
void kernel_panic_handler(void) {
    uart_puts("=== KERNEL PANIC ===\n");
    uart_puts("系统遇到不可恢复的错误\n");
    
    // 打印当前状态
    uart_puts("当前中断嵌套级别: ");
    // 这里可以访问中断栈状态
    
    uart_puts("最后的中断统计:\n");
    print_interrupt_stats();
    
    uart_puts("栈统计:\n");
    print_stack_stats();
    
    uart_puts("系统挂起...\n");
    
    // 禁用所有中断
    disable_interrupts();
    
    // 无限循环
    while (1) {
        // 可以添加心跳LED或其他调试信息
    }
}

/**
 * 上下文保存测试函数
 */
void test_context_switching(void) {
    uart_puts("=== 上下文切换测试 ===\n");
    
    // 测试不同的保存策略
    uart_puts("1. 测试最小保存策略\n");
    set_context_save_config(SAVE_LEVEL_MINIMAL, 0, 1);
    
    uart_puts("2. 测试调用者保存策略\n");  
    set_context_save_config(SAVE_LEVEL_CALLER, 1, 1);
    
    uart_puts("3. 测试完整保存策略\n");
    set_context_save_config(SAVE_LEVEL_FULL, 1, 1);
    
    // 模拟一些寄存器操作
    register uint64_t test_val asm("t0") = 0x12345678;
    register uint64_t test_val2 asm("t1") = 0x87654321;
    
    uart_puts("4. 触发测试中断\n");
    // 这里可以触发一个软件中断进行测试
    
    uart_puts("测试寄存器值保持: ");
    if (test_val == 0x12345678 && test_val2 == 0x87654321) {
        uart_puts("通过\n");
    } else {
        uart_puts("失败\n");
    }
    
    uart_puts("上下文切换测试完成\n\n");
}

/**
 * 辅助函数：打印十六进制数
 */
static void print_hex(uint64_t value) {
    for (int i = 15; i >= 0; i--) {
        int digit = (value >> (i * 4)) & 0xF;
        uart_putc(digit < 10 ? '0' + digit : 'A' + digit - 10);
    }
}

/**
 * 打印中断统计信息
 */
void print_interrupt_stats(void) {
    uart_puts("=== 中断统计信息 ===\n");
    uart_puts("总中断数: "); 
    print_decimal(stats.total_interrupts); 
    uart_puts("\n");
    
    uart_puts("嵌套中断数: ");
    print_decimal(stats.nested_interrupts);
    uart_puts("\n");
    
    uart_puts("伪中断数: ");
    print_decimal(stats.spurious_interrupts);
    uart_puts("\n");
    
    uart_puts("最大嵌套级别: ");
    print_decimal(stats.max_nest_level);
    uart_puts("\n");
    
    uart_puts("各中断计数:\n");
    for (int i = 0; i < MAX_INTERRUPT_HANDLERS; i++) {
        if (stats.irq_counts[i] > 0) {
            uart_puts("  IRQ ");
            uart_putc('0' + (i / 10));
            uart_putc('0' + (i % 10));
            uart_puts(": ");
            print_decimal(stats.irq_counts[i]);
            uart_puts("\n");
        }
    }
}

/*
 * 具体异常处理函数实现
 */

/**
 * 系统调用处理
 */
void handle_syscall(struct trap_frame* tf) {
    uart_puts("系统调用异常处理\n");
    
    // 获取系统调用号 (a0寄存器)
    uint64_t syscall_num = tf->x10;  // a0
    
    uart_puts("系统调用号: ");
    print_decimal(syscall_num);
    uart_puts("\n");
    
    // 简单的系统调用实现
    switch (syscall_num) {
        case 1:  // SYS_EXIT
            uart_puts("系统调用: EXIT\n");
            tf->x10 = 0; // 返回值
            break;
        case 2:  // SYS_WRITE
            uart_puts("系统调用: WRITE\n");
            tf->x10 = tf->x11; // 返回写入的字节数
            break;
        default:
            uart_puts("未实现的系统调用\n");
            tf->x10 = -1; // 错误返回值
            break;
    }
    
    // 更新EPC，指向下一条指令
    tf->sepc += 4;
}

/**
 * 指令页故障处理
 */
void handle_instruction_page_fault(struct trap_frame* tf) {
    uart_puts("指令页故障处理\n");
    
    uint64_t stval = read_csr(stval);
    uart_puts("故障地址: 0x");
    print_hex(stval);
    uart_puts("\n");
    
    // 调用页面替换系统
    if (handle_page_fault(kernel_pagetable, stval, PTE_R | PTE_X) == 0) {
        uart_puts("指令页故障修复成功\n");
        return;
    }
    
    uart_puts("指令页故障修复失败\n");
    panic("Instruction page fault");
}

/**
 * 加载页故障处理
 */
void handle_load_page_fault(struct trap_frame* tf) {
    uart_puts("加载页故障处理\n");
    
    uint64_t stval = read_csr(stval);
    uart_puts("故障地址: 0x");
    print_hex(stval);
    uart_puts("\n");
    
    // 调用页面替换系统
    if (handle_page_fault(kernel_pagetable, stval, PTE_R) == 0) {
        uart_puts("加载页故障修复成功\n");
        return;
    }
    
    uart_puts("加载页故障修复失败\n");
    panic("Load page fault");
}

/**
 * 存储页故障处理
 */
void handle_store_page_fault(struct trap_frame* tf) {
    uart_puts("存储页故障处理\n");
    
    uint64_t stval = read_csr(stval);
    uart_puts("故障地址: 0x");
    print_hex(stval);
    uart_puts("\n");
    
    // 调用页面替换系统
    if (handle_page_fault(kernel_pagetable, stval, PTE_W) == 0) {
        uart_puts("存储页故障修复成功\n");
        return;
    }
    
    uart_puts("存储页故障修复失败\n");
    panic("Store page fault");
}

/**
 * 非法指令处理
 */
void handle_illegal_instruction(struct trap_frame* tf) {
    uart_puts("非法指令异常\n");
    
    uart_puts("PC: 0x");
    print_hex(tf->sepc);
    uart_puts("\n");
    
    uint64_t stval = read_csr(stval);
    uart_puts("指令编码: 0x");
    print_hex(stval);
    uart_puts("\n");
    
    // 对于非法指令，终止程序
    panic("Illegal instruction");
}

/**
 * 断点处理
 */
void handle_breakpoint(struct trap_frame* tf) {
    uart_puts("断点异常\n");
    
    uart_puts("断点地址: 0x");
    print_hex(tf->sepc);
    uart_puts("\n");
    
    // 简单的断点处理：打印寄存器状态然后继续
    uart_puts("寄存器状态:\n");
    uart_puts("x1(ra): 0x"); print_hex(tf->x1); uart_puts("\n");
    uart_puts("x2(sp): 0x"); print_hex(tf->x2); uart_puts("\n");
    uart_puts("x10(a0): 0x"); print_hex(tf->x10); uart_puts("\n");
    
    // 更新EPC，跳过断点指令
    tf->sepc += 4;
}

/**
 * 未对齐访问处理
 */
void handle_misaligned_access(struct trap_frame* tf, int type) {
    uart_puts("未对齐访问异常\n");
    
    uint64_t stval = read_csr(stval);
    uart_puts("访问地址: 0x");
    print_hex(stval);
    uart_puts("\n");
    
    const char* access_types[] = {
        "指令", "未知", "未知", "未知", "加载", "未知", "存储"
    };
    
    if (type >= 0 && type < 7) {
        uart_puts("访问类型: ");
        uart_puts(access_types[type]);
        uart_puts("\n");
    }
    
    // 对于未对齐访问，可以尝试软件修复或终止程序
    panic("Misaligned access");
}

/**
 * 访问故障处理
 */
void handle_access_fault(struct trap_frame* tf, int type) {
    uart_puts("访问故障异常\n");
    
    uint64_t stval = read_csr(stval);
    uart_puts("故障地址: 0x");
    print_hex(stval);
    uart_puts("\n");
    
    const char* fault_types[] = {
        "未知", "指令访问", "未知", "未知", "未知", "加载访问", "未知", "存储访问"
    };
    
    if (type >= 0 && type < 8) {
        uart_puts("故障类型: ");
        uart_puts(fault_types[type]);
        uart_puts("\n");
    }
    
    // 访问故障通常是严重错误
    panic("Access fault");
}

/**
 * 环境调用处理
 */
void handle_environment_call(struct trap_frame* tf, int mode) {
    uart_puts("环境调用异常\n");
    
    switch (mode) {
        case TRAP_ENVIRONMENT_CALL_FROM_U_MODE:
            uart_puts("来自用户模式的环境调用\n");
            handle_syscall(tf);
            break;
        case TRAP_ENVIRONMENT_CALL_FROM_S_MODE:
            uart_puts("来自监督模式的环境调用\n");
            // 可以实现SBI调用或其他系统服务
            tf->sepc += 4;
            break;
        default:
            uart_puts("未知的环境调用模式\n");
            panic("Unknown environment call");
    }
}