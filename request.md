# 从零构建操作系统—学生指导手册

## [cite\_start]实验4：中断处理与时钟管理 [cite: 39]

**实验目标**
[cite\_start]通过分析xv6的中断处理机制，理解操作系统如何响应硬件事件，实现完整的中断处理框架和时钟中断驱动的任务调度。 [cite: 39]

**核心学习资料**

  * [cite\_start]**RISC-V中断机制** [cite: 39]
      * [cite\_start]RISC-V特权级规范 第3章：Machine-Level ISA [cite: 39]
          * [cite\_start]3.1.9节：Machine Interrupt Registers [cite: 39]
          * [cite\_start]3.2.1节：Machine Timer Registers [cite: 39]
      * [cite\_start]RISC-V特权级规范 第12章：Supervisor-Level ISA [cite: 40]
          * [cite\_start]12.1.3节：Supervisor Interrupt Registers [cite: 40]
          * [cite\_start]重点理解：`mie`、`mip`、`sie`、`sip`寄存器的作用 [cite: 40]
  * [cite\_start]**xv6中断处理源码分析** [cite: 40]
      * [cite\_start]`kernel/trap.c` - 中断和异常处理 [cite: 40]
          * [cite\_start]重点函数：`usertrap()`, `kerneltrap()`, `devintr()` [cite: 40]
          * [cite\_start]学习要点：中断分发、异常处理、系统调用入口 [cite: 40]
      * [cite\_start]`kernel/kernelvec.S` - 内核态中断向量 [cite: 40]
          * [cite\_start]重点：上下文保存和恢复机制 [cite: 40]
      * [cite\_start]`kernel/start.c` - 机器模式初始化 [cite: 40]
          * [cite\_start]重点函数：timer中断的设置和代理 [cite: 40]
  * [cite\_start]**时钟管理理论** [cite: 40]
      * [cite\_start]SBI规范：[https://github.com/riscv-non-isa/riscv-sbi-doc](https://github.com/riscv-non-isa/riscv-sbi-doc) [cite: 40]
          * [cite\_start]第4.6节：Timer Extension [cite: 40]
      * [cite\_start]操作系统概念 第5章：CPU调度 [cite: 40]

**任务列表**

### [cite\_start]任务1：理解RISC-V中断架构 [cite: 40]

  * [cite\_start]**学习重点：** [cite: 40]
    1.  [cite\_start]分析中断特权级委托： [cite: 40]
          * [cite\_start]Machine Mode → Supervisor Mode 委托 [cite: 40]
          * [cite\_start]`medeleg`: 异常委托寄存器 [cite: 40]
          * [cite\_start]`mideleg`: 中断委托寄存器 [cite: 40]
          * [cite\_start]为什么需要中断委托？ [cite: 40]
          * [cite\_start]哪些中断应该委托给S模式？ [cite: 40]
    2.  [cite\_start]理解中断寄存器组合： [cite: 40]
          * [cite\_start]`mie/sie`：中断使能寄存器 [cite: 40]
          * [cite\_start]`mip/sip`：中断挂起寄存器 [cite: 40]
          * [cite\_start]`mtvec/stvec`：中断向量基址 [cite: 40]
          * [cite\_start]`mcause/scause`：中断原因寄存器 [cite: 40]
  * [cite\_start]**深入思考：** [cite: 40]
      * [cite\_start]时钟中断为什么在M模式产生，却在S模式处理？ [cite: 40]
      * [cite\_start]如何理解"中断是异步的，异常是同步的"？ [cite: 40]

### [cite\_start]任务2：分析xv6的中断处理流程 [cite: 40]

  * [cite\_start]**代码阅读指导：** [cite: 40]
    1.  [cite\_start]研读 `start.c` 中的机器模式设置： [cite: 40]
        ````c
        // 时钟中断委托给S模式
        w _ mideleg(r_mideleg() | (1L << 5)); 
        // 设置机器模式陷阱向量
        w _ mtvec((uint64)timervec);
        [cite_start]``` [cite: 40, 41]
        * [cite_start]为什么时钟中断需要特殊处理？ [cite: 41]
        * [cite_start]`timervec` 的作用是什么？ [cite: 41]
        ````
    2.  [cite\_start]分析 `kernelvec.S` 的上下文切换： [cite: 41]
          * [cite\_start]哪些寄存器需要保存？ [cite: 41]
          * [cite\_start]为什么不保存所有寄存器？ [cite: 41]
          * [cite\_start]栈的使用策略是什么？ [cite: 41]
    3.  [cite\_start]理解 `trap.c` 的中断分发： [cite: 41]
        ````c
        void kerneltrap(void) { 
            // 中断还是异常？ 
            // 如何确定中断源？ 
            // 如何调用相应处理函数？ 
        }
        [cite_start]``` [cite: 41]
        ````
  * [cite\_start]**关键问题：** [cite: 41]
      * [cite\_start]中断处理中的重入问题如何解决？ [cite: 41]
      * [cite\_start]中断处理时间过长会有什么后果？ [cite: 41]

### [cite\_start]任务3：设计你的中断处理框架 [cite: 41]

  * [cite\_start]**架构设计要求：** [cite: 41]
    1.  [cite\_start]设计中断向量表结构 [cite: 41]
    2.  [cite\_start]定义中断处理函数接口 [cite: 41]
    3.  [cite\_start]实现中断的注册和注销机制 [cite: 42]
  * [cite\_start]**设计考虑：** [cite: 42]
    ````c
    // 中断处理函数类型
    typedef void (*interrupt_handler_t)(void);
    // 中断控制接口
    void trap_init(void); // 初始化中断系统
    void register_interrupt(int irq, interrupt_handler_t h); // 注册中断处理函数
    void enable _ interrupt(int irq); // 开启特定中断
    void disable _ interrupt(int irq); // 关闭特定中断
    [cite_start]``` [cite: 42, 43]
    * [cite_start]你需要考虑的问题： [cite: 43]
        1.  [cite_start]如何设计中断优先级？ [cite: 43]
        2.  [cite_start]是否支持中断嵌套？ [cite: 43]
        3.  [cite_start]如何处理共享中断？ [cite: 43]
    ````
  * [cite\_start]**实现策略：** [cite: 43]
    1.  [cite\_start]先实现最基本的时钟中断处理 [cite: 43]
    2.  [cite\_start]逐步添加其他中断源支持 [cite: 43]
    3.  [cite\_start]考虑性能和可扩展性 [cite: 43]

### [cite\_start]任务4：实现上下文保存与恢复 [cite: 43]

  * [cite\_start]**参考xv6的`kernelvec.S`，理解：** [cite: 43]
    1.  [cite\_start]哪些寄存器必须保存？ [cite: 43]
          * [cite\_start]调用者保存寄存器 vs 被调用者保存寄存器 [cite: 43]
          * [cite\_start]临时寄存器的处理策略 [cite: 43]
          * [cite\_start]CSR寄存器的保存需求 [cite: 43]
    2.  [cite\_start]栈的管理： [cite: 43]
          * [cite\_start]中断栈的分配 [cite: 43]
          * [cite\_start]栈溢出检测 [cite: 43]
          * [cite\_start]多级中断的栈管理 [cite: 43]
  * [cite\_start]**实现挑战：** [cite: 43]
    ````assembly
    # 你的中断入口实现框架
    kernelvec:
        # 保存上下文
        # 你需要决定： 
        # 1. 保存到哪里？内核栈？专用区域？
        # 2. 保存哪些寄存器？ 
        # 3. 如何快速保存和恢复？ 
        # 调用C处理函数
        call kerneltrap
        # 恢复上下文并返回
    [cite_start]``` [cite: 43]

    ````

### [cite\_start]任务5：实现时钟中断与调度 [cite: 44]

  * [cite\_start]**时钟中断处理：** [cite: 44]
    1.  [cite\_start]理解SBI时钟接口： [cite: 44]
        ````c
        // 设置下次时钟中断时间
        void sbi _ set _ timer(uint64 time);
        // 获取当前时间
        uint64 get_time(void);
        [cite_start]``` [cite: 44]
        ````
    2.  [cite\_start]实现时钟中断处理函数： [cite: 44]
        ````c
        void timer _ interrupt(void) { 
            // 1. 更新系统时间 
            // 2. 处理定时器事件 
            // 3. 触发任务调度 
            // 4. 设置下次中断时间 
        }
        [cite_start]``` [cite: 44]
        ````
  * [cite\_start]**调度器集成：** [cite: 44]
      * [cite\_start]如何在时钟中断中触发调度？ [cite: 44]
      * [cite\_start]调度的时机选择有什么考虑？ [cite: 44]
      * [cite\_start]如何确保调度的原子性？ [cite: 44]

### [cite\_start]任务6：异常处理机制 [cite: 44]

  * [cite\_start]**异常类型理解：** [cite: 44, 45]
      * [cite\_start]指令地址未对齐 [cite: 44]
      * [cite\_start]指令访问故障 [cite: 44]
      * [cite\_start]非法指令 [cite: 44]
      * [cite\_start]断点 [cite: 44]
      * [cite\_start]加载地址未对齐 [cite: 44]
      * [cite\_start]加载访问故障 [cite: 44]
      * [cite\_start]存储地址未对齐 [cite: 45]
      * [cite\_start]存储访问故障 [cite: 45]
      * [cite\_start]用户模式环境调用 [cite: 45]
      * [cite\_start]监督模式环境调用 [cite: 45]
  * [cite\_start]**实现要求：** [cite: 45]
    ````c
    void handle _ exception(struct trapframe *tf) { 
        uint64 cause = r _ scause();
        switch (cause) {
            case 8: // 系统调用
                handle _ syscall(tf);
                break;
            case 12: // 指令页故障
                handle _ instruction _page_fault(tf);
                break;
            case 13: // 加载页故障
                handle _ load _page_fault(tf);
                break;
            case 15: // 存储页故障
                handle _ store _page_fault(tf);
                break;
            default:
                panic("Unknown exception");
        }
    }
    [cite_start]``` [cite: 45, 46, 47]

    ````

### 测试与调试策略

  * [cite\_start]**中断功能测试** [cite: 47]
      * [cite\_start]`void test _ timer _ interrupt(void) { /* ... */ }` [cite: 47, 48]
  * [cite\_start]**异常处理测试** [cite: 48]
      * [cite\_start]`void test _ exception_handling(void) { /* ... */ }` [cite: 48]
  * [cite\_start]**性能测试** [cite: 48]
      * [cite\_start]`void test _ interrupt_overhead(void) { /* ... */ }` [cite: 48]
  * [cite\_start]**调试建议** [cite: 48]
      * [cite\_start]**分阶段调试** [cite: 48]
        1.  [cite\_start]**基础设置验证：** 验证中断寄存器设置是否正确、检查中断向量地址是否对齐、确认中断使能位设置。 [cite: 48]
        2.  [cite\_start]**中断触发测试：** 使用简单的时钟中断测试、在中断处理函数中添加输出确认被调用、验证中断频率是否符合预期。 [cite: 48]
        3.  [cite\_start]**上下文完整性：** 在中断前后检查寄存器值、验证栈指针的正确性、确认中断返回后程序继续正常执行。 [cite: 48]
  * [cite\_start]**常见问题诊断** [cite: 48, 49]
      * [cite\_start]**问题：中断无响应**：检查中断使能位设置、验证中断向量地址、确认中断源是否正确配置。 [cite: 49]
      * [cite\_start]**问题：系统在中断处理后崩溃**：检查栈指针保存和恢复、验证上下文保存的完整性、确认中断处理函数没有破坏调用约定。 [cite: 49]
      * [cite\_start]**问题：中断频率异常**：检查时钟设置参数、验证SBI调用是否正确、确认时间计算没有溢出。 [cite: 49]

### [cite\_start]思考题 [cite: 49]

1.  [cite\_start]**中断设计：** 为什么时钟中断需要在M模式处理后再委托给S模式？如何设计一个支持中断优先级的系统？ [cite: 49]
2.  [cite\_start]**性能考虑：** 中断处理的时间开销主要在哪里？如何优化？高频率中断对系统性能有什么影响？ [cite: 49]
3.  [cite\_start]**可靠性：** 如何确保中断处理函数的安全性？中断处理中的错误应该如何处理？ [cite: 49]
4.  [cite\_start]**扩展性：** 如何支持更多类型的中断源？如何实现中断的动态路由？ [cite: 49]
5.  [cite\_start]**实时性：** 当前实现的中断延迟特征如何？如何设计一个满足实时要求的中断系统？ [cite: 49]

-----

## [cite\_start]实验5：进程管理与调度 [cite: 49]

**实验目标**
[cite\_start]通过深入分析xv6的进程管理机制，理解操作系统如何创建、管理和调度进程，实现完整的进程生命周期管理和简单的调度算法。 [cite: 49]

**核心学习资料**

  * [cite\_start]**进程管理理论基础** [cite: 49]
      * [cite\_start]操作系统概念 第3-5章：进程、线程、CPU调度 [cite: 49]
      * [cite\_start]xv6手册 第2-4章：操作系统组织、页表、陷阱和系统调用 [cite: 49]
      * [cite\_start]RISC-V调用约定：[https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf](https://www.google.com/search?q=https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf) [cite: 49]
  * [cite\_start]**xv6进程管理源码分析** [cite: 49]
      * [cite\_start]`kernel/proc.h` - 进程结构体定义 [cite: 49]
          * [cite\_start]重点：`struct proc` 的字段含义和生命周期 [cite: 50]
      * [cite\_start]`kernel/proc.c` - 进程管理核心函数 [cite: 50]
          * [cite\_start]重点函数：`allocproc()`, `fork()`, `exit()`, `wait()`, `scheduler()` [cite: 50]
          * [cite\_start]学习要点：进程状态转换、内存管理、调度策略 [cite: 50]
      * [cite\_start]`kernel/swtch.S` - 上下文切换汇编代码 [cite: 50]
          * [cite\_start]理解：寄存器保存策略、栈切换机制 [cite: 50]
      * [cite\_start]`kernel/sysproc.c` - 进程相关系统调用 [cite: 50]
          * [cite\_start]重点：`sys_fork()`, `sys_exit()`, `sys_wait()`, `sys_kill()` [cite: 50]

**任务列表**

### [cite\_start]任务1：深入理解进程抽象 [cite: 50]

  * [cite\_start]**学习重点：** [cite: 50]
    1.  [cite\_start]分析xv6的进程结构体： [cite: 50]
        ````c
        struct proc {
            struct spinlock lock;
            enum procstate state; // 进程状态
            void *chan; // 等待通道
            int killed; // 是否被杀死
            int xstate; // 退出状态
            int pid; // 进程ID
            pagetable_t pagetable; // 用户页表
            struct trapframe *trapframe; // 陷阱帧
            struct context context; // 调度上下文
            // ...更多字段
        };
        [cite_start]``` [cite: 50, 51, 52]
        * [cite_start]每个字段的作用是什么？ [cite: 52]
        * [cite_start]进程状态转换图是怎样的？ [cite: 52]
        * [cite_start]为什么需要锁保护？ [cite: 52]
        ````
    2.  [cite\_start]理解进程生命周期： [cite: 52]
          * [cite\_start]`UNUSED → USED → RUNNABLE → RUNNING → SLEEPING → ZOMBIE` [cite: 52]
          * [cite\_start]每个状态转换的触发条件是什么？ [cite: 52]
          * [cite\_start]哪些操作需要原子性保护？ [cite: 52]
  * [cite\_start]**深入思考：** [cite: 52]
      * [cite\_start]为什么需要`ZOMBIE`状态？ [cite: 52]
      * [cite\_start]进程表的大小限制有什么影响？ [cite: 52]
      * [cite\_start]如何防止进程ID重复？ [cite: 52]

### [cite\_start]任务2：分析xv6的进程创建机制 [cite: 52]

  * [cite\_start]**代码阅读指导：** [cite: 52]
    1.  [cite\_start]研读 `allocproc()` 函数： [cite: 52]
          * [cite\_start]如何在进程表中找到空闲槽位？ [cite: 52]
          * [cite\_start]进程ID是如何分配的？ [cite: 52]
          * [cite\_start]用户栈是如何设置的？ [cite: 52]
          * [cite\_start]陷阱帧的初始化过程 [cite: 52]
    2.  [cite\_start]深入理解 `fork()` 实现： [cite: 52, 53]
        ````c
        int fork(void) { 
            // 1. 分配新进程结构 
            // 2. 复制用户内存 
            // 3. 复制陷阱帧 
            // 4. 设置返回值 
            // 5. 标记为RUNNABLE 
        }
        [cite_start]``` [cite: 53]
        * [cite_start]为什么父子进程有不同的返回值？ [cite: 53]
        * [cite_start]内存复制是如何实现的？ [cite: 53]
        * [cite_start]失败时的资源清理策略 [cite: 53]
        ````
    3.  [cite\_start]分析进程退出机制： [cite: 53]
          * [cite\_start]`exit()` 与 `wait()` 的协作关系 [cite: 53]
          * [cite\_start]资源回收的时机和方式 [cite: 53]
          * [cite\_start]孤儿进程的处理 [cite: 53]
  * [cite\_start]**关键问题：** [cite: 53]
      * [cite\_start]`fork()`的性能瓶颈在哪里？ [cite: 53]
      * [cite\_start]如何实现写时复制优化？ [cite: 53]

### [cite\_start]任务3：设计你的进程管理系统 [cite: 53]

  * [cite\_start]**设计要求：** [cite: 53, 54]
    1.  [cite\_start]确定进程结构体设计 [cite: 53]
    2.  [cite\_start]选择合适的进程表组织方式 [cite: 54]
    3.  [cite\_start]设计进程ID分配策略 [cite: 54]
  * [cite\_start]**核心接口设计：** [cite: 54, 55]
    ````c
    // 进程管理基本接口
    struct proc* alloc_process(void); // 分配进程结构
    void free _process(struct proc *p); // 释放进程资源
    int create _process(void (*entry)(void)); // 创建新进程
    void exit _process(int status); // 终止当前进程
    int wait _process(int *status); // 等待子进程
    [cite_start]``` [cite: 54, 55]
    ````
  * [cite\_start]**你需要考虑的设计问题：** [cite: 55]
    1.  [cite\_start]进程表用数组还是链表？ [cite: 55]
    2.  [cite\_start]如何高效查找特定PID的进程？ [cite: 55]
    3.  [cite\_start]是否需要进程组和会话的概念？ [cite: 55]
    4.  [cite\_start]如何处理进程资源限制？ [cite: 55]
  * [cite\_start]**实现策略：** [cite: 55]
    1.  [cite\_start]先实现基本的进程创建和销毁 [cite: 55]
    2.  [cite\_start]再添加父子关系管理 [cite: 55]
    3.  [cite\_start]最后考虑性能优化 [cite: 55]

### [cite\_start]任务4：实现上下文切换机制 [cite: 55]

  * [cite\_start]**参考xv6的`swtch.S`，理解：** [cite: 55]
    1.  [cite\_start]上下文切换的本质： [cite: 55]
          * [cite\_start]哪些寄存器需要保存？ [cite: 55]
          * [cite\_start]为什么不保存所有寄存器？ [cite: 55]
          * [cite\_start]调用者保存 vs 被调用者保存的区别 [cite: 55]
    2.  [cite\_start]栈的切换： [cite: 55, 56]
          * [cite\_start]内核栈 vs 用户栈的管理 [cite: 56]
          * [cite\_start]栈指针的保存和恢复 [cite: 56]
          * [cite\_start]栈溢出的检测和预防 [cite: 56]
  * [cite\_start]**实现挑战：** [cite: 56, 57]
    ````c
    // 上下文结构体设计
    struct context {
        uint64 ra; // 返回地址
        uint64 sp; // 栈指针
        // 需要保存哪些其他寄存器？ 
        // 为什么这样选择？ 
    };
    // 上下文切换函数
    void swtch(struct context *old, struct context *new);
    [cite_start]``` [cite: 56, 57]
    ````
  * [cite\_start]**关键技术点：** [cite: 57]
      * [cite\_start]上下文切换必须是原子操作 [cite: 57]
      * [cite\_start]中断状态的管理 [cite: 57]
      * [cite\_start]多级栈的处理 [cite: 57]

### [cite\_start]任务5：实现调度器 [cite: 57]

  * [cite\_start]**参考xv6的调度策略：** [cite: 57, 58]
    1.  [cite\_start]分析 `scheduler()` 函数： [cite: 57]
          * [cite\_start]轮转调度的实现方式 [cite: 57]
          * [cite\_start]如何避免忙等待？ [cite: 57]
          * [cite\_start]为什么需要开启中断？ [cite: 58]
    2.  [cite\_start]理解调度时机： [cite: 58]
          * [cite\_start]主动调度 vs 抢占调度 [cite: 58]
          * [cite\_start]`yield()` 函数的作用 [cite: 58]
          * [cite\_start]时钟中断如何触发调度 [cite: 58]
  * [cite\_start]**调度器设计考虑：** [cite: 58]
    ````c
    void scheduler(void) { 
        struct proc *p;
        struct cpu *c = mycpu(); 
        c->proc = 0; 
        for(;;) { 
            // 开启中断，允许设备中断
            intr _ on();
            // 你的调度算法： 
            // 1. 如何选择下一个运行的进程？ 
            // 2. 如何处理优先级？ 
            // 3. 如何避免饥饿？ 
            // 4. 如何平衡公平性和效率？ 
            for(p = proc; p < &proc[NPROC]; p++) { 
                acquire(&p->lock);
                if(p->state == RUNNABLE) { 
                    // 找到可运行进程，切换过去
                    p->state = RUNNING; 
                    c->proc =... 
                }
                // ...
    [cite_start]``` [cite: 58, 59, 60]

    ````

-----