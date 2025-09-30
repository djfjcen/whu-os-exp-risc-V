/*
 * scheduler.h - 基础任务调度器
 */

#ifndef _SCHEDULER_H
#define _SCHEDULER_H

#include <stdint.h>
#include "trap.h"

// 任务状态
typedef enum {
    TASK_UNUSED = 0,
    TASK_EMBRYO,     // 正在创建
    TASK_SLEEPING,   // 睡眠中
    TASK_RUNNABLE,   // 可运行
    TASK_RUNNING,    // 正在运行
    TASK_ZOMBIE      // 已结束
} task_state_t;

// 任务优先级
typedef enum {
    PRIORITY_LOW = 0,
    PRIORITY_NORMAL = 1,
    PRIORITY_HIGH = 2,
    PRIORITY_REALTIME = 3
} task_priority_t;

// 任务控制块 (Task Control Block)
struct task {
    int pid;                    // 进程ID
    task_state_t state;         // 任务状态
    task_priority_t priority;   // 任务优先级
    uint64_t time_slice;        // 时间片
    uint64_t cpu_time;          // CPU使用时间
    uint64_t create_time;       // 创建时间
    
    // 上下文保存区域
    struct trap_frame* tf;      // 中断上下文
    uint64_t kstack;            // 内核栈
    
    // 调度相关
    struct task* next;          // 就绪队列链表
    int sleep_ticks;            // 睡眠时间
    
    // 任务信息
    char name[32];              // 任务名称
    void (*entry)(void);        // 入口函数
};

// 调度器统计信息
struct scheduler_stats {
    uint64_t total_switches;    // 总切换次数
    uint64_t idle_time;         // 空闲时间
    uint64_t tasks_created;     // 创建的任务数
    uint64_t tasks_finished;    // 完成的任务数
};

// 最大任务数
#define MAX_TASKS 64

// 函数声明
void scheduler_init(void);
void schedule(void);
void schedule_from_timer(void);
int create_task(void (*entry)(void), const char* name, task_priority_t priority);
void task_exit(void);
void task_yield(void);
void task_sleep(int ticks);
void wakeup_tasks(void);

// 调度器状态
struct task* get_current_task(void);
int get_task_count(void);
void print_scheduler_stats(void);
void print_task_list(void);

// 内部函数
void switch_task(struct task* prev, struct task* next);
struct task* pick_next_task(void);
void update_task_times(void);

// 空闲任务
void idle_task(void);

#endif /* _SCHEDULER_H */