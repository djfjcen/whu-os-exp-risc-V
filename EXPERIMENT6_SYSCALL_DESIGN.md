# 实验六：系统调用设计文档

## 1. 系统调用流程概述

当用户程序执行 `ecall` 指令时，CPU会执行以下操作：
1.  **特权级切换**：从用户态（U-mode）切换到监管者态（S-mode）。
2.  **保存现场**：
    *   将当前的PC（程序计数器）值保存到 `sepc` (Supervisor Exception Program Counter) 寄存器中，以便在处理完系统调用后能返回到用户程序的下一条指令。
    *   将当前的特权级保存到 `sstatus` 寄存器中。
3.  **设置原因**：在 `scause` (Supervisor Cause) 寄存器中设置异常原因。对于 `ecall` 指令，该值通常是8（Environment call from U-mode）。
4.  **跳转到陷阱处理程序**：CPU会跳转到 `stvec` (Supervisor Trap Vector) 寄存器指定的地址，开始执行内核的陷阱处理代码。

我们的陷阱处理流程如下：
1.  `machinevec.S` 中的 `kernelvec` 作为统一的陷阱入口。
2.  `kernelvec` 保存所有用户寄存器到当前进程的陷阱帧（trapframe）中。
3.  切换到内核栈，并跳转到C语言实现的 `usertrap()` 函数 (`kernel/trap.c`)。
4.  `usertrap()` 函数检查 `scause` 寄存器，判断陷阱类型。
5.  如果 `scause` 表明是来自用户态的 `ecall`，则调用 `syscall()` 函数进行系统调用分发。
6.  `syscall()` 函数从陷阱帧中读取 `a7` 寄存器的值，这个值就是用户程序请求的 **系统调用号**。
7.  根据系统调用号，`syscall()` 在一个函数指针数组中找到对应的内核处理函数并执行。
8.  内核处理函数的返回值将被存入陷阱帧的 `a0` 寄存器中。
9.  `usertrap()` 返回后，`usertrapret()` 函数会恢复用户寄存器，并执行 `sret` 指令返回用户态。

## 2. 系统调用号 (Syscall Numbers)

我们将定义一系列宏来表示不同的系统调用号。这些定义将放在 `include/syscall.h` 文件中。

- `SYS_fork`: 1
- `SYS_exit`: 2
- `SYS_wait`: 3
- `SYS_pipe`: 4
- `SYS_read`: 5
- `SYS_kill`: 6
- `SYS_exec`: 7
- `SYS_fstat`: 8
- `SYS_chdir`: 9
- `SYS_dup`: 10
- `SYS_getpid`: 11
- `SYS_sbrk`: 12
- `SYS_sleep`: 13
- `SYS_uptime`: 14
- `SYS_open`: 15
- `SYS_write`: 16
- `SYS_mknod`: 17
- `SYS_unlink`: 18
- `SYS_link`: 19
- `SYS_mkdir`: 20
- `SYS_close`: 21

## 3. 参数传递规约

- **系统调用号**：存放在 `a7` 寄存器中。
- **参数**：最多6个参数，依次存放在 `a0`, `a1`, `a2`, `a3`, `a4`, `a5` 寄存器中。
- **返回值**：存放在 `a0` 寄存器中。

内核需要从当前进程的陷阱帧中提取这些参数。我们将实现辅助函数来安全地获取这些参数，特别是对于指针类型的参数，需要验证其指向的地址是否在用户地址空间内，防止内核访问非法内存。

## 4. 内核处理函数框架

每个系统调用都对应一个内核中的函数，原型通常为 `uint64 sys_xxx(void)`。

这些函数通过 `argint()`, `argaddr()`, `argstr()` 等辅助函数从陷阱帧中获取参数。

例如, `sys_getpid` 的实现将非常简单：
```c
uint64 sys_getpid(void) {
  return myproc()->pid;
}
```

而 `sys_sbrk` 的实现会复杂一些，需要处理内存分配：
```c
uint64 sys_sbrk(void) {
  int n;
  if (argint(0, &n) < 0) {
    return -1;
  }
  // ... 内存增长逻辑 ...
  return myproc()->sz;
}
```

## 5. 用户态接口

为了方便用户程序使用系统调用，我们将提供一个用户库：
1.  **汇编桩代码 (Assembly Stubs)**: 在 `user/usys.S` 中，为每个系统调用创建一个简单的汇编函数。它负责将系统调用号加载到 `a7`，然后执行 `ecall`。
    ```assembly
    .global getpid
    getpid:
      li a7, SYS_getpid
      ecall
      ret
    ```
2.  **C函数原型**: 在 `user/user.h` 中，为用户程序提供C函数声明。
    ```c
    int getpid(void);
    int write(int, const void*, int);
    // ...
    ```
3.  **C函数库**: 在 `user/ulib.c` 中，提供一些更复杂的库函数，例如 `printf`。

这个设计文档为我们接下来的编码实现提供了清晰的蓝图。
