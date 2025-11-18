# xv6 风格系统调用实现说明

## 概述

本实现完全参考 xv6 的系统调用机制，从函数到机制到架构都与 xv6 相同。

## 系统调用机制

### 1. 系统调用号定义 (`include/syscall.h`)

参考 xv6，定义了所有标准系统调用号：

```c
#define SYS_fork    1
#define SYS_exit    2
#define SYS_wait    3
#define SYS_pipe    4
#define SYS_read    5
...
```

### 2. 系统调用分发器 (`kernel/syscall.c`)

完全按照 xv6 架构实现：

#### 参数提取函数

- `argint(int n, int *ip)` - 提取第 n 个整数参数
- `argaddr(int n, uint64 *ip)` - 提取第 n 个地址参数
- `argstr(int n, char *buf, int max)` - 提取第 n 个字符串参数
- `fetchstr(uint64 addr, char *buf, int max)` - 从用户空间获取字符串

参数按照 RISC-V 调用约定保存在 a0-a5 寄存器中。

#### 系统调用函数指针表

```c
static uint64 (*syscalls[])(void) = {
[SYS_fork]    sys_fork,
[SYS_exit]    sys_exit,
...
};
```

#### syscall() 分发函数

```c
void syscall(void)
{
  int num;
  struct proc *p = myproc();
  
  // 系统调用号在 a7 寄存器中
  num = p->trapframe->a7;
  
  // 调用对应的系统调用处理函数
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    p->trapframe->a0 = syscalls[num]();  // 返回值保存在 a0
  } else {
    p->trapframe->a0 = -1;  // 错误返回
  }
}
```

### 3. 系统调用实现 (`kernel/sysproc.c`)

实现了核心的进程相关系统调用：

- `sys_fork()` - 创建子进程
- `sys_exit()` - 退出进程
- `sys_wait()` - 等待子进程
- `sys_getpid()` - 获取进程 PID
- `sys_sbrk()` - 调整堆大小
- `sys_sleep()` - 睡眠指定时间
- `sys_kill()` - 杀死进程
- `sys_uptime()` - 获取系统运行时间

其他系统调用（文件系统相关）保留为存根，返回未实现错误。

### 4. 陷阱处理 (`kernel/trap.c`)

#### usertrap() - 用户态陷阱处理

完全参考 xv6 实现：

```c
void usertrap(void) {
    uint64 scause = r_scause();
    struct proc *p = myproc();
    
    // 保存 sepc
    p->trapframe->sepc = r_sepc();
    
    if (scause & (1UL << 63)) {
        // 中断处理
        devintr();
    } else {
        // 异常处理
        switch (scause) {
            case EXCP_UENV_CALL:  // ecall 系统调用
                // 跳过 ecall 指令
                p->trapframe->sepc += 4;
                
                // 启用中断
                intr_on();
                
                // 调用系统调用分发器
                syscall();
                break;
            ...
        }
    }
    
    // 检查进程是否被 kill
    if(p->killed)
        exit(-1);
    
    // 返回用户空间
    usertrapret();
}
```

#### usertrapret() - 返回用户空间

```c
void usertrapret(void) {
    struct proc *p = myproc();
    
    // 关闭中断
    intr_off();
    
    // 恢复 sepc
    w_sepc(p->trapframe->sepc);
    
    // 设置 sstatus 返回用户模式
    uint64 sstatus = r_sstatus();
    sstatus &= ~SSTATUS_SPP;  // 清除 SPP，返回用户模式
    sstatus |= SSTATUS_SPIE;  // 启用用户模式中断
    w_sstatus(sstatus);
    
    // 执行 sret 返回用户空间
}
```

## RISC-V 系统调用约定

### 寄存器使用

- **a7 (x17)**: 系统调用号
- **a0-a5 (x10-x15)**: 系统调用参数（最多 6 个）
- **a0 (x10)**: 返回值

### 调用流程

1. 用户程序准备参数：
   - 将系统调用号放入 a7
   - 将参数放入 a0-a5
   
2. 执行 `ecall` 指令：
   - 触发环境调用异常
   - CPU 切换到 S 模式
   - PC 跳转到 stvec 指向的处理函数
   
3. 进入 `usertrap()`：
   - 保存所有寄存器到 trapframe
   - 识别 ecall 异常
   - 调用 `syscall()` 分发器
   
4. 执行系统调用：
   - `syscall()` 根据 a7 中的号码查表
   - 调用对应的 `sys_xxx()` 函数
   - 函数通过 `argint/argaddr/argstr` 提取参数
   - 返回值写入 trapframe->a0
   
5. 返回用户空间：
   - `usertrapret()` 设置返回状态
   - 从 trapframe 恢复寄存器
   - 执行 `sret` 返回用户模式

## 与 xv6 的一致性

### 架构层面
- ✅ 使用相同的系统调用号
- ✅ 使用函数指针表分发
- ✅ 参数提取机制相同
- ✅ trapframe 结构相同

### 函数层面
- ✅ `syscall()` 分发函数
- ✅ `argint/argaddr/argstr` 参数提取
- ✅ `fetchstr/copyinstr` 字符串操作
- ✅ `usertrap/usertrapret` 陷阱处理

### 机制层面
- ✅ ecall 触发系统调用
- ✅ sepc += 4 跳过 ecall 指令
- ✅ 返回值通过 a0 寄存器
- ✅ 支持进程切换和抢占

## 已实现的系统调用

| 编号 | 名称 | 功能 | 状态 |
|------|------|------|------|
| 1 | fork | 创建子进程 | ✅ 已实现 |
| 2 | exit | 退出进程 | ✅ 已实现 |
| 3 | wait | 等待子进程 | ✅ 已实现 |
| 11 | getpid | 获取进程ID | ✅ 已实现 |
| 12 | sbrk | 调整堆大小 | ✅ 已实现 |
| 13 | sleep | 睡眠 | ✅ 已实现 |
| 6 | kill | 杀死进程 | ✅ 已实现 |
| 14 | uptime | 系统运行时间 | ✅ 已实现 |
| 其他 | 文件系统相关 | - | 🔲 存根 |

## 文件结构

```
include/
  syscall.h         # 系统调用号定义
  trap.h            # trapframe 和陷阱处理声明
  proc.h            # 进程结构和函数声明
  defs.h            # 全局函数声明

kernel/
  syscall.c         # 系统调用分发器
  sysproc.c         # 进程相关系统调用实现
  trap.c            # 陷阱处理（usertrap/usertrapret）
  proc.c            # 进程管理（fork/exit/wait等）
  vm.c              # 虚拟内存（copyin/copyout/copyinstr）
```

## 编译

所有系统调用相关文件已加入 Makefile：

```makefile
KERNEL_OBJS = ... \
              kernel/syscall.o \
              kernel/sysproc.o \
              ...
```

## 测试建议

可以创建用户程序测试系统调用：

```c
// 用户程序示例
void user_main() {
    // 测试 getpid
    int pid = syscall(SYS_getpid);
    
    // 测试 fork
    int child = syscall(SYS_fork);
    if (child == 0) {
        // 子进程
        syscall(SYS_exit, 0);
    } else {
        // 父进程
        int status;
        syscall(SYS_wait, &status);
    }
}
```

## 参考资料

- xv6 源码: https://github.com/mit-pdos/xv6-riscv
- xv6 手册第 4 章：系统调用
- RISC-V 特权级规范第 3 章：特权级切换
