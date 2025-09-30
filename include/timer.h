/*
 * timer.h - 时钟中断和定时器管理
 */

#ifndef _TIMER_H
#define _TIMER_H

#include <stdint.h>

// 时钟频率 (Hz) - RISC-V 标准为 10MHz
#define TIMER_FREQ      10000000UL

// 时间片长度 (ms)
#define TIME_SLICE_MS   10
#define TIME_SLICE_TICKS (TIMER_FREQ * TIME_SLICE_MS / 1000)

// 系统时间结构
struct system_time {
    uint64_t ticks;          // 系统滴答数
    uint64_t seconds;        // 系统运行秒数
    uint64_t milliseconds;   // 毫秒数
};

// 定时器事件结构
struct timer_event {
    uint64_t expire_time;    // 过期时间
    void (*callback)(void*); // 回调函数
    void* data;              // 回调数据
    struct timer_event* next; // 链表指针
};

// 时钟中断统计
struct timer_stats {
    uint64_t total_interrupts;
    uint64_t missed_deadlines;
    uint64_t max_handler_time;
    uint64_t avg_handler_time;
};

// 函数声明
void timer_init(void);
void timer_interrupt(void);
void timer_start(void);
void timer_stop(void);

// 时间获取函数
uint64_t get_system_ticks(void);
uint64_t get_system_time_ms(void);
uint64_t get_system_time(void);  // 返回ticks
void get_system_time_struct(struct system_time* time);

// 定时器事件管理
int add_timer_event(uint64_t delay_ms, void (*callback)(void*), void* data);
void remove_timer_events(void (*callback)(void*));
void process_timer_events(void);

// 调试和统计
void print_timer_stats(void);
void reset_timer_stats(void);

#endif /* _TIMER_H */
