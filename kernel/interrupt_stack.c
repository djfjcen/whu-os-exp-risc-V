/*
 * interrupt_stack.c - 中断栈管理实现
 * 基于 xv6 设计，支持栈溢出检测和多级中断
 */

#include "riscv_context.h"
#include "trap.h"
#include "uart.h"
#include "defs.h"

// 前向声明
static void print_decimal(uint64_t value);

// 每CPU的中断栈（这里简化为单CPU）
static struct interrupt_stack cpu_interrupt_stack;
static struct context_save_config save_config;

// 栈统计信息
static struct {
    uint32_t max_used_bytes;
    uint32_t overflow_count;
    uint32_t max_nest_level;
    uint32_t total_interrupts;
} stack_stats;

/**
 * 初始化中断栈系统
 */
void init_interrupt_stack(void) {
    uart_puts("初始化中断栈管理系统...\n");
    
    // 初始化栈描述符
    cpu_interrupt_stack.canary = STACK_CANARY;
    cpu_interrupt_stack.nest_level = 0;
    cpu_interrupt_stack.stack_base = (uint64_t)&cpu_interrupt_stack.stack[0];
    cpu_interrupt_stack.stack_top = (uint64_t)&cpu_interrupt_stack.stack[INTERRUPT_STACK_SIZE - 1];
    cpu_interrupt_stack.current_frame = 0;
    
    // 设置栈保护魔数
    uint32_t* guard = (uint32_t*)cpu_interrupt_stack.stack_base;
    *guard = STACK_CANARY;
    
    // 初始化保存配置（默认使用调用者保存策略）
    save_config.save_level = SAVE_LEVEL_CALLER;
    save_config.save_callee_saved = 1;  // 保守策略
    save_config.save_fp_regs = 0;       // 暂不支持浮点
    save_config.enable_stack_check = 1;
    save_config.enable_canary = 1;
    
    // 初始化统计信息
    stack_stats.max_used_bytes = 0;
    stack_stats.overflow_count = 0;
    stack_stats.max_nest_level = 0;
    stack_stats.total_interrupts = 0;
    
    uart_puts("中断栈管理系统初始化完成\n");
}

/**
 * 获取当前中断栈指针
 */
uint64_t get_interrupt_stack_top(void) {
    return cpu_interrupt_stack.stack_top;
}

/**
 * 检查栈溢出
 */
int check_stack_overflow(uint64_t current_sp) {
    // 检查栈指针是否越界
    if (current_sp < cpu_interrupt_stack.stack_base || 
        current_sp > cpu_interrupt_stack.stack_top) {
        return 1; // 栈溢出
    }
    
    // 检查是否接近栈底（留出512字节安全区域）
    if (current_sp - cpu_interrupt_stack.stack_base < 512) {
        return 1; // 即将栈溢出
    }
    
    // 检查栈保护魔数
    if (save_config.enable_canary) {
        uint32_t* guard = (uint32_t*)cpu_interrupt_stack.stack_base;
        if (*guard != STACK_CANARY) {
            return 1; // 栈被破坏
        }
    }
    
    return 0; // 栈正常
}

/**
 * 更新栈使用统计
 */
void update_stack_stats(uint64_t current_sp) {
    uint32_t used_bytes = cpu_interrupt_stack.stack_top - current_sp;
    
    if (used_bytes > stack_stats.max_used_bytes) {
        stack_stats.max_used_bytes = used_bytes;
    }
    
    if (cpu_interrupt_stack.nest_level > stack_stats.max_nest_level) {
        stack_stats.max_nest_level = cpu_interrupt_stack.nest_level;
    }
    
    stack_stats.total_interrupts++;
}

/**
 * 进入中断处理（栈管理）
 */
int enter_interrupt_handler(struct trap_frame* tf) {
    // 增加嵌套级别
    cpu_interrupt_stack.nest_level++;
    
    // 检查嵌套深度
    if (cpu_interrupt_stack.nest_level > MAX_INTERRUPT_NEST) {
        uart_puts("错误：中断嵌套深度超过限制\n");
        cpu_interrupt_stack.nest_level--;
        return -1;
    }
    
    // 检查栈溢出
    if (save_config.enable_stack_check) {
        if (check_stack_overflow((uint64_t)tf)) {
            uart_puts("错误：中断栈溢出\n");
            stack_stats.overflow_count++;
            cpu_interrupt_stack.nest_level--;
            return -1;
        }
    }
    
    // 更新当前栈帧
    struct trap_frame* old_frame = cpu_interrupt_stack.current_frame;
    cpu_interrupt_stack.current_frame = tf;
    
    // 在trap_frame中保存旧的栈帧指针（用于栈链）
    tf->x8 = (uint64_t)old_frame;  // 使用s0/fp寄存器
    
    // 更新统计信息
    update_stack_stats((uint64_t)tf);
    
    return 0;
}

/**
 * 退出中断处理（栈管理）
 */
void exit_interrupt_handler(struct trap_frame* tf) {
    if (cpu_interrupt_stack.nest_level == 0) {
        uart_puts("警告：中断嵌套级别不匹配\n");
        return;
    }
    
    // 恢复旧的栈帧
    cpu_interrupt_stack.current_frame = (struct trap_frame*)tf->x8;
    
    // 减少嵌套级别
    cpu_interrupt_stack.nest_level--;
}

/**
 * 获取栈统计信息
 */
void print_stack_stats(void) {
    uart_puts("=== 中断栈统计信息 ===\n");
    
    uart_puts("栈大小: ");
    print_decimal(INTERRUPT_STACK_SIZE);
    uart_puts(" 字节\n");
    
    uart_puts("最大使用: ");
    print_decimal(stack_stats.max_used_bytes);
    uart_puts(" 字节\n");
    
    uart_puts("使用率: ");
    print_decimal((stack_stats.max_used_bytes * 100) / INTERRUPT_STACK_SIZE);
    uart_puts("%\n");
    
    uart_puts("栈溢出次数: ");
    print_decimal(stack_stats.overflow_count);
    uart_puts("\n");
    
    uart_puts("最大嵌套深度: ");
    print_decimal(stack_stats.max_nest_level);
    uart_puts("\n");
    
    uart_puts("总中断次数: ");
    print_decimal(stack_stats.total_interrupts);
    uart_puts("\n");
    
    uart_puts("当前嵌套级别: ");
    print_decimal(cpu_interrupt_stack.nest_level);
    uart_puts("\n");
}

/**
 * 配置上下文保存策略
 */
void set_context_save_config(save_level_t level, int save_callee, int enable_checks) {
    save_config.save_level = level;
    save_config.save_callee_saved = save_callee;
    save_config.enable_stack_check = enable_checks;
    
    uart_puts("更新上下文保存配置: ");
    switch (level) {
        case SAVE_LEVEL_MINIMAL:
            uart_puts("最小保存模式\n");
            break;
        case SAVE_LEVEL_CALLER:
            uart_puts("调用者保存模式\n");
            break;
        case SAVE_LEVEL_FULL:
            uart_puts("完整保存模式\n");
            break;
    }
}

/**
 * 获取当前保存配置
 */
struct context_save_config* get_save_config(void) {
    return &save_config;
}

/**
 * 紧急栈恢复（用于栈溢出等异常情况）
 */
void emergency_stack_recovery(void) {
    uart_puts("执行紧急栈恢复...\n");
    
    // 重置栈状态
    cpu_interrupt_stack.nest_level = 0;
    cpu_interrupt_stack.current_frame = 0;
    
    // 重新设置栈保护
    uint32_t* guard = (uint32_t*)cpu_interrupt_stack.stack_base;
    *guard = STACK_CANARY;
    
    uart_puts("栈恢复完成\n");
}

/**
 * 辅助函数：打印十进制数（简化版本）
 */
static void print_decimal(uint64_t value) {
    if (value == 0) {
        uart_putc('0');
        return;
    }
    
    char buffer[21];
    int pos = 0;
    
    while (value > 0) {
        buffer[pos++] = '0' + (value % 10);
        value /= 10;
    }
    
    for (int i = pos - 1; i >= 0; i--) {
        uart_putc(buffer[i]);
    }
}