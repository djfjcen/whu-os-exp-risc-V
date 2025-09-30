/*
 * timer.c - 时钟中断实现
 */

#include "timer.h"
#include "scheduler.h"
#include "sbi.h"
#include "trap.h"
#include "uart.h"
#include "defs.h"

// 函数声明
int timer_interrupt_handler(int irq, void* data, struct trap_frame* tf);
static void print_decimal(uint64_t value);

// 全局系统时间
static struct system_time sys_time = {0, 0, 0};

// 定时器事件链表
static struct timer_event* timer_events = 0;

// 时钟中断统计
static struct timer_stats stats = {0, 0, 0, 0};

// 下次时钟中断时间
static uint64_t next_timer_interrupt = 0;

// 时钟中断启用标志
static int timer_enabled = 0;

/**
 * 初始化时钟系统
 */
void timer_init(void) {
    uart_puts("初始化时钟系统...\n");
    
    // 初始化系统时间
    sys_time.ticks = 0;
    sys_time.seconds = 0;
    sys_time.milliseconds = 0;
    
    // 清空定时器事件链表
    timer_events = 0;
    
    // 重置统计信息
    stats.total_interrupts = 0;
    stats.missed_deadlines = 0;
    stats.max_handler_time = 0;
    stats.avg_handler_time = 0;
    
    // 注册时钟中断处理函数
    register_interrupt(TRAP_SUPERVISOR_TIMER_INTERRUPT,
                      timer_interrupt_handler,
                      0,
                      "Timer Interrupt",
                      IRQ_FLAG_ENABLED,
                      IRQ_PRIORITY_HIGH);
    
    uart_puts("时钟系统初始化完成\n");
}

/**
 * 启动时钟中断
 */
void timer_start(void) {
    if (timer_enabled) {
        return;
    }
    
    uart_puts("启动时钟中断...\n");
    
    // 获取当前时间
    uint64_t current_time = get_time();
    
    // 设置第一次时钟中断
    next_timer_interrupt = current_time + TIME_SLICE_TICKS;
    sbi_set_timer(next_timer_interrupt);
    
    // 启用时钟中断
    enable_interrupt(TRAP_SUPERVISOR_TIMER_INTERRUPT);
    timer_enabled = 1;
    
    uart_puts("时钟中断已启动\n");
}

/**
 * 停止时钟中断
 */
void timer_stop(void) {
    if (!timer_enabled) {
        return;
    }
    
    uart_puts("停止时钟中断...\n");
    
    // 禁用时钟中断
    disable_interrupt(TRAP_SUPERVISOR_TIMER_INTERRUPT);
    timer_enabled = 0;
    
    uart_puts("时钟中断已停止\n");
}

/**
 * 时钟中断处理函数
 */
int timer_interrupt_handler(int irq, void* data, struct trap_frame* tf) {
    uint64_t start_time = get_time();
    
    // 更新统计信息
    stats.total_interrupts++;
    
    // 1. 更新系统时间
    sys_time.ticks++;
    
    // 计算秒和毫秒
    uint64_t total_ms = (sys_time.ticks * 1000) / (TIMER_FREQ / TIME_SLICE_TICKS);
    sys_time.seconds = total_ms / 1000;
    sys_time.milliseconds = total_ms % 1000;
    
    // 2. 处理定时器事件
    process_timer_events();
    
    // 3. 触发任务调度
    schedule_from_timer();
    
    // 4. 设置下次中断时间
    next_timer_interrupt += TIME_SLICE_TICKS;
    
    // 检查是否错过了中断时间
    uint64_t current_time = get_time();
    if (current_time > next_timer_interrupt) {
        stats.missed_deadlines++;
        // 调整到下一个合理的中断时间
        next_timer_interrupt = current_time + TIME_SLICE_TICKS;
    }
    
    sbi_set_timer(next_timer_interrupt);
    
    // 更新处理时间统计
    uint64_t handler_time = get_time() - start_time;
    if (handler_time > stats.max_handler_time) {
        stats.max_handler_time = handler_time;
    }
    
    // 简单的平均时间计算
    stats.avg_handler_time = (stats.avg_handler_time * (stats.total_interrupts - 1) + handler_time) / stats.total_interrupts;
    
    return 0; // 中断处理成功
}

/**
 * 时钟中断入口（兼容原有接口）
 */
void timer_interrupt(void) {
    // 这个函数保持为空，实际处理在 timer_interrupt_handler 中
}

/**
 * 获取系统滴答数
 */
uint64_t get_system_ticks(void) {
    return sys_time.ticks;
}

/**
 * 获取系统时间（毫秒）
 */
uint64_t get_system_time_ms(void) {
    return (sys_time.ticks * 1000) / (TIMER_FREQ / TIME_SLICE_TICKS);
}

/**
 * 获取系统时间（ticks）
 */
uint64_t get_system_time(void) {
    return sys_time.ticks;
}

/**
 * 获取系统时间结构
 */
void get_system_time_struct(struct system_time* time) {
    time->ticks = sys_time.ticks;
    time->seconds = sys_time.seconds;
    time->milliseconds = sys_time.milliseconds;
}

/**
 * 添加定时器事件
 */
int add_timer_event(uint64_t delay_ms, void (*callback)(void*), void* data) {
    if (!callback) {
        return -1;
    }
    
    // 分配新的定时器事件
    struct timer_event* event = (struct timer_event*)alloc_page();
    if (!event) {
        return -1;
    }
    
    // 计算过期时间
    uint64_t current_ms = get_system_time_ms();
    event->expire_time = current_ms + delay_ms;
    event->callback = callback;
    event->data = data;
    
    // 插入到链表中（按时间排序）
    disable_interrupts();
    
    if (!timer_events || event->expire_time < timer_events->expire_time) {
        // 插入到链表头
        event->next = timer_events;
        timer_events = event;
    } else {
        // 找到合适的插入位置
        struct timer_event* current = timer_events;
        while (current->next && current->next->expire_time <= event->expire_time) {
            current = current->next;
        }
        event->next = current->next;
        current->next = event;
    }
    
    enable_interrupts();
    return 0;
}

/**
 * 移除定时器事件
 */
void remove_timer_events(void (*callback)(void*)) {
    if (!callback) {
        return;
    }
    
    disable_interrupts();
    
    struct timer_event* current = timer_events;
    struct timer_event* prev = 0;
    
    while (current) {
        if (current->callback == callback) {
            // 移除这个事件
            if (prev) {
                prev->next = current->next;
            } else {
                timer_events = current->next;
            }
            
            struct timer_event* to_free = current;
            current = current->next;
            free_page((void*)to_free);
        } else {
            prev = current;
            current = current->next;
        }
    }
    
    enable_interrupts();
}

/**
 * 处理定时器事件
 */
void process_timer_events(void) {
    uint64_t current_ms = get_system_time_ms();
    
    while (timer_events && timer_events->expire_time <= current_ms) {
        struct timer_event* event = timer_events;
        timer_events = timer_events->next;
        
        // 调用回调函数
        if (event->callback) {
            event->callback(event->data);
        }
        
        // 释放事件内存
        free_page((void*)event);
    }
}

/**
 * 打印时钟统计信息
 */
void print_timer_stats(void) {
    uart_puts("=== 时钟中断统计 ===\n");
    
    uart_puts("总中断次数: ");
    print_decimal(stats.total_interrupts);
    uart_puts("\n");
    
    uart_puts("错过的截止时间: ");
    print_decimal(stats.missed_deadlines);
    uart_puts("\n");
    
    uart_puts("最大处理时间: ");
    print_decimal(stats.max_handler_time);
    uart_puts(" 时钟周期\n");
    
    uart_puts("平均处理时间: ");
    print_decimal(stats.avg_handler_time);
    uart_puts(" 时钟周期\n");
    
    uart_puts("系统运行时间: ");
    print_decimal(sys_time.seconds);
    uart_puts(".");
    print_decimal(sys_time.milliseconds);
    uart_puts(" 秒\n");
    
    uart_puts("时钟中断频率: ");
    print_decimal(1000 / TIME_SLICE_MS);
    uart_puts(" Hz\n");
}

/**
 * 重置时钟统计
 */
void reset_timer_stats(void) {
    stats.total_interrupts = 0;
    stats.missed_deadlines = 0;
    stats.max_handler_time = 0;
    stats.avg_handler_time = 0;
}

/**
 * 简化的十进制打印函数
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
