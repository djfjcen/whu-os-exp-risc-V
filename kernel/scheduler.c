/*
 * scheduler.c - 基础任务调度器实现
 */

#include "scheduler.h"
#include "timer.h"
#include "trap.h"
#include "defs.h"
#include <stddef.h>

// 静态函数声明
static void add_to_ready_queue(struct task* task);
static void remove_from_ready_queue(struct task* task);

// 全局任务表
static struct task tasks[MAX_TASKS];
static struct task* current_task = NULL;
static struct task* idle_task_ptr = NULL;

// 就绪队列
static struct task* ready_queue[4] = {NULL, NULL, NULL, NULL}; // 4个优先级队列

// 调度器状态
static struct scheduler_stats stats = {0};
static int next_pid = 1;
static uint64_t last_schedule_time = 0;

// 时间片配置 (以timer ticks为单位)
static const uint64_t TIME_SLICES[] = {
    50,   // LOW priority: 50 ticks
    20,   // NORMAL priority: 20 ticks  
    10,   // HIGH priority: 10 ticks
    5     // REALTIME priority: 5 ticks
};

/*
 * 调度器初始化
 */
void scheduler_init(void) {
    printf("Scheduler: Initializing scheduler\n");
    
    // 初始化任务表
    for (int i = 0; i < MAX_TASKS; i++) {
        tasks[i].state = TASK_UNUSED;
        tasks[i].pid = 0;
        tasks[i].next = NULL;
    }
    
    // 清空就绪队列
    for (int i = 0; i < 4; i++) {
        ready_queue[i] = NULL;
    }
    
    // 创建空闲任务
    int idle_pid = create_task(idle_task, "idle", PRIORITY_LOW);
    if (idle_pid > 0) {
        idle_task_ptr = &tasks[idle_pid - 1];
        printf("Scheduler: Created idle task (PID %d)\n", idle_pid);
    }
    
    current_task = idle_task_ptr;
    if (current_task) {
        current_task->state = TASK_RUNNING;
    }
    
    printf("Scheduler: Initialization complete\n");
}

/*
 * 创建新任务
 */
int create_task(void (*entry)(void), const char* name, task_priority_t priority) {
    struct task* task = NULL;
    
    // 查找空闲任务槽
    for (int i = 0; i < MAX_TASKS; i++) {
        if (tasks[i].state == TASK_UNUSED) {
            task = &tasks[i];
            break;
        }
    }
    
    if (!task) {
        printf("Scheduler: No free task slots\n");
        return -1;
    }
    
    // 初始化任务
    task->pid = next_pid++;
    task->state = TASK_EMBRYO;
    task->priority = priority;
    task->time_slice = TIME_SLICES[priority];
    task->cpu_time = 0;
    task->create_time = get_system_time();
    task->sleep_ticks = 0;
    task->entry = entry;
    task->next = NULL;
    
    // 复制任务名称
    int i;
    for (i = 0; i < 31 && name[i]; i++) {
        task->name[i] = name[i];
    }
    task->name[i] = '\0';
    
    // 分配内核栈 (简化版，实际需要物理内存分配)
    task->kstack = 0x80000000 + task->pid * 4096;
    
    // 初始化trap frame (简化版)
    task->tf = (struct trap_frame*)(task->kstack + 4096 - sizeof(struct trap_frame));
    
    // 将任务加入就绪队列
    task->state = TASK_RUNNABLE;
    add_to_ready_queue(task);
    
    stats.tasks_created++;
    
    printf("Scheduler: Created task '%s' (PID %d, priority %d)\n", 
           task->name, task->pid, task->priority);
    
    return task->pid;
}

/*
 * 将任务加入就绪队列
 */
static void add_to_ready_queue(struct task* task) {
    int prio = task->priority;
    
    if (ready_queue[prio] == NULL) {
        ready_queue[prio] = task;
        task->next = task; // 循环链表
    } else {
        // 插入到队列尾部
        task->next = ready_queue[prio]->next;
        ready_queue[prio]->next = task;
        ready_queue[prio] = task; // 队列头指向最后插入的元素
    }
}

/*
 * 从就绪队列中移除任务
 */
static void remove_from_ready_queue(struct task* task) {
    int prio = task->priority;
    
    if (ready_queue[prio] == NULL) {
        return;
    }
    
    // 单个任务的情况
    if (ready_queue[prio] == task && task->next == task) {
        ready_queue[prio] = NULL;
        task->next = NULL;
        return;
    }
    
    // 查找前驱节点
    struct task* prev = ready_queue[prio];
    while (prev->next != task && prev->next != ready_queue[prio]) {
        prev = prev->next;
    }
    
    if (prev->next == task) {
        prev->next = task->next;
        if (ready_queue[prio] == task) {
            ready_queue[prio] = prev;
        }
        task->next = NULL;
    }
}

/*
 * 选择下一个要运行的任务
 */
struct task* pick_next_task(void) {
    // 按优先级从高到低查找可运行任务
    for (int prio = PRIORITY_REALTIME; prio >= PRIORITY_LOW; prio--) {
        if (ready_queue[prio] != NULL) {
            struct task* task = ready_queue[prio]->next;
            
            // 轮转到下一个任务
            ready_queue[prio] = task;
            
            return task;
        }
    }
    
    // 没有可运行任务，返回空闲任务
    return idle_task_ptr;
}

/*
 * 主调度函数
 */
void schedule(void) {
    if (current_task == NULL) {
        return;
    }
    
    struct task* prev = current_task;
    struct task* next = pick_next_task();
    
    if (next == NULL) {
        next = idle_task_ptr;
    }
    
    if (prev != next) {
        // 更新统计信息
        stats.total_switches++;
        
        // 更新任务状态
        if (prev->state == TASK_RUNNING) {
            prev->state = TASK_RUNNABLE;
        }
        next->state = TASK_RUNNING;
        
        // 切换任务
        current_task = next;
        
        printf("Scheduler: Switch from %s(PID %d) to %s(PID %d)\n",
               prev->name, prev->pid, next->name, next->pid);
        
        // 实际的上下文切换会在这里调用汇编代码
        switch_task(prev, next);
    }
    
    last_schedule_time = get_system_time();
}

/*
 * 任务切换 (简化版)
 */
void switch_task(struct task* prev, struct task* next) {
    // 这里应该调用汇编代码进行实际的上下文切换
    // 现在只是简单的标记切换
    
    printf("Scheduler: Context switch from PID %d to PID %d\n", 
           prev->pid, next->pid);
    
    // TODO: 调用kernelvec.S中的上下文切换代码
    // swtch(&prev->context, &next->context);
}

/*
 * 时钟中断调度
 */
void schedule_from_timer(void) {
    if (current_task == NULL) {
        return;
    }
    
    // 更新当前任务的CPU时间
    current_task->cpu_time++;
    
    // 检查时间片是否用完
    uint64_t current_time = get_system_time();
    uint64_t running_time = current_time - last_schedule_time;
    
    if (running_time >= current_task->time_slice) {
        printf("Scheduler: Time slice expired for %s (PID %d)\n",
               current_task->name, current_task->pid);
        schedule();
    }
    
    // 更新睡眠任务
    wakeup_tasks();
}

/*
 * 任务主动让出CPU
 */
void task_yield(void) {
    printf("Scheduler: Task %s (PID %d) yielding CPU\n",
           current_task->name, current_task->pid);
    schedule();
}

/*
 * 任务退出
 */
void task_exit(void) {
    if (current_task == NULL) {
        return;
    }
    
    printf("Scheduler: Task %s (PID %d) exiting\n",
           current_task->name, current_task->pid);
    
    // 从就绪队列中移除
    remove_from_ready_queue(current_task);
    
    // 标记为僵尸状态
    current_task->state = TASK_ZOMBIE;
    
    stats.tasks_finished++;
    
    // 调度下一个任务
    schedule();
}

/*
 * 任务睡眠
 */
void task_sleep(int ticks) {
    if (current_task == NULL || ticks <= 0) {
        return;
    }
    
    printf("Scheduler: Task %s (PID %d) sleeping for %d ticks\n",
           current_task->name, current_task->pid, ticks);
    
    // 从就绪队列中移除
    remove_from_ready_queue(current_task);
    
    // 设置睡眠时间
    current_task->sleep_ticks = ticks;
    current_task->state = TASK_SLEEPING;
    
    // 调度其他任务
    schedule();
}

/*
 * 唤醒睡眠任务
 */
void wakeup_tasks(void) {
    for (int i = 0; i < MAX_TASKS; i++) {
        if (tasks[i].state == TASK_SLEEPING) {
            tasks[i].sleep_ticks--;
            if (tasks[i].sleep_ticks <= 0) {
                printf("Scheduler: Waking up task %s (PID %d)\n",
                       tasks[i].name, tasks[i].pid);
                
                tasks[i].state = TASK_RUNNABLE;
                add_to_ready_queue(&tasks[i]);
            }
        }
    }
}

/*
 * 获取当前任务
 */
struct task* get_current_task(void) {
    return current_task;
}

/*
 * 获取任务数量
 */
int get_task_count(void) {
    int count = 0;
    for (int i = 0; i < MAX_TASKS; i++) {
        if (tasks[i].state != TASK_UNUSED) {
            count++;
        }
    }
    return count;
}

/*
 * 打印调度器统计信息
 */
void print_scheduler_stats(void) {
    printf("\n=== Scheduler Statistics ===\n");
    printf("Total context switches: %llu\n", stats.total_switches);
    printf("Tasks created: %llu\n", stats.tasks_created);
    printf("Tasks finished: %llu\n", stats.tasks_finished);
    printf("Active tasks: %d\n", get_task_count());
    printf("Current task: %s (PID %d)\n", 
           current_task ? current_task->name : "none",
           current_task ? current_task->pid : 0);
}

/*
 * 打印任务列表
 */
void print_task_list(void) {
    printf("\n=== Task List ===\n");
    printf("PID\tState\t\tPriority\tName\t\tCPU Time\n");
    
    for (int i = 0; i < MAX_TASKS; i++) {
        if (tasks[i].state != TASK_UNUSED) {
            const char* state_names[] = {
                "UNUSED", "EMBRYO", "SLEEPING", 
                "RUNNABLE", "RUNNING", "ZOMBIE"
            };
            
            printf("%d\t%s\t\t%d\t\t%s\t\t%llu\n",
                   tasks[i].pid,
                   state_names[tasks[i].state],
                   tasks[i].priority,
                   tasks[i].name,
                   tasks[i].cpu_time);
        }
    }
}

/*
 * 空闲任务
 */
void idle_task(void) {
    printf("Scheduler: Idle task started\n");
    
    while (1) {
        // 空闲循环
        stats.idle_time++;
        
        // 简单的忙等待，实际实现中可以使用WFI指令
        for (volatile int i = 0; i < 1000000; i++) {
            // 空循环
        }
    }
}

/*
 * 更新任务时间统计
 */
void update_task_times(void) {
    if (current_task) {
        current_task->cpu_time++;
    }
}