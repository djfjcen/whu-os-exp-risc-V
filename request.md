实验6：系统调用
实验目标
通过深入分析xv6的系统调用机制，理解用户态到内核态的切换过程，独立实现一套简单的系统调用接口 。

核心学习资料

xv6手册：第4章：系统调用 


RISC-V特权级规范：第3章：特权级切换 


ecall指令、a7/a0寄存器的使用 


xv6系统调用源码分析 


kernel/syscall.c - 系统调用分发 


kernel/trap.c - 陷阱处理 


user/usys.pl - 系统调用桩代码生成 

任务列表
任务1：理解系统调用机制
学习重点：

系统调用是如何从用户态进入内核态的？ 


参数如何传递？ 


返回值如何返回？ 


研究RISC-V的ecall机制： 



ecall指令的作用 



scause寄存器中系统调用的编码 



sepc寄存器的作用和更新 


理解特权级切换： 


用户栈到内核栈的转换 


寄存器状态的保存和恢复 


页表的切换时机 


深入思考：

为什么需要陷阱帧（trapframe）？ 


系统调用和中断处理有什么相同和不同？ 


任务2：分析xv6的系统调用分发机制
代码阅读指导：

研读 syscall.c 中的核心分发逻辑： 


系统调用号是如何传递的？ 

返回值存储在哪里？ 

错误处理机制是什么？ 

分析参数提取函数： 


int argint(int n, int *ip); // 获取整数参数 


int argaddr(int n, uint64 *ip); // 获取地址参数 


int argstr(int n, char *buf, int max); // 获取字符串参数 

参数是从哪里提取的？ 

如何处理不同类型的参数？ 

边界检查是如何实现的？ 

深入思考：

用户内存访问（例如读取字符串）为什么需要特殊的函数（如copyin）？ 

如何防止用户进程通过系统调用访问其他进程或内核内存？ 

任务3：设计你的系统调用框架

设计要求： 

设计系统调用号的枚举或宏定义 。

定义系统调用函数接口（如 sys_fork） 。

设计一个分发表（函数指针数组） 。


关键技术点： 

陷阱帧的正确解析 

用户参数的正确获取和验证 

任务4：实现基本的系统调用

实现目标： 

实现至少5个系统调用（建议包含进程类和文件类） 。

示例系统调用：


进程管理类： 


int sys_fork(void); // 创建子进程 


void sys_exit(int status); // 退出进程 


int sys_wait(int *status); // 等待子进程 


int sys_getpid(void); // 获取进程ID 


文件操作类： 


int sys_open(void); // 打开文件 


int sys_close(void); // 关闭文件 


int sys_read(void); // 读文件 


int sys_write(void); // 写文件 

实现策略：

C

// 以sys_write为例 
int sys_write(void) {
    int fd;
    char *buf;
    int count;

    // 1. 提取参数 [cite: 921]
    if (argint(0, &fd) < 0 || argaddr(1, (uint64*)&buf) < 0 || argint(2, &count) < 0) {
        return -1; [cite: 922]
    }

    // 2. 参数有效性检查 [cite: 922]
    if (fd < 0 || fd >= NOFILE || count < 0) {
        return -1; [cite: 923]
    }

    // 3. 调用内核函数实现 
    return filewrite(myproc()->ofile[fd], buf, count);
}
任务5：实现用户态系统调用接口
参考xv6的 usys.pl，理解： 


桩代码生成机制： 

Code snippet

.global write
write:
  li a7, SYS_write # 系统调用号加载到a7 
  ecall # 陷入内核 
  ret # 返回 

用户库函数设计： 

C

int fork(void); [cite: 924]
int exit(int) __attribute__((noreturn)); [cite: 924]
int wait(int*); [cite: 924]
int pipe(int*); [cite: 924]
int write(int, const void*,... [cite: 924]
任务6：综合测试与调试

功能测试： 


基本功能测试（如 getpid, fork, exit, wait） 



参数传递测试 



安全性测试 



性能测试 



调试建议 

系统调用跟踪 

参数检查调试 


常见问题诊断 


问题：系统调用返回-1 

检查陷阱帧中的a7寄存器（系统调用号） 

验证参数是否正确提取 


问题：内核崩溃 

检查用户指针的安全性 

验证内核堆栈是否溢出 

思考题

安全和隔离 

内核如何确保用户进程不能伪造系统调用参数？ 


trapframe在安全隔离中扮演什么角色？ 


性能优化 

系统调用开销的主要来源是什么？ 

如何设计一个更轻量级的系统调用机制（如vsyscall）？ 


扩展性 

如何为模块化的驱动程序添加新的系统调用？