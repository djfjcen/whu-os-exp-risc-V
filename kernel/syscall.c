// 系统调用分发器 - 完全参考 xv6 实现
// 负责从 trapframe 中提取参数，并分发到具体的系统调用处理函数

#include <stddef.h>
#include "trap.h"
#include "proc.h"
#include "syscall.h"
#include "defs.h"
#include "uart.h"

// 前向声明 - 所有系统调用的实现函数
extern uint64 sys_fork(void);
extern uint64 sys_exit(void);
extern uint64 sys_wait(void);
extern uint64 sys_pipe(void);
extern uint64 sys_read(void);
extern uint64 sys_kill(void);
extern uint64 sys_exec(void);
extern uint64 sys_fstat(void);
extern uint64 sys_chdir(void);
extern uint64 sys_dup(void);
extern uint64 sys_getpid(void);
extern uint64 sys_sbrk(void);
extern uint64 sys_sleep(void);
extern uint64 sys_uptime(void);
extern uint64 sys_open(void);
extern uint64 sys_write(void);
extern uint64 sys_mknod(void);
extern uint64 sys_unlink(void);
extern uint64 sys_link(void);
extern uint64 sys_mkdir(void);
extern uint64 sys_close(void);

// 系统调用函数指针数组 - 参考 xv6
// 通过系统调用号索引到对应的处理函数
static uint64 (*syscalls[])(void) = {
[SYS_fork]    sys_fork,
[SYS_exit]    sys_exit,
[SYS_wait]    sys_wait,
[SYS_pipe]    sys_pipe,
[SYS_read]    sys_read,
[SYS_kill]    sys_kill,
[SYS_exec]    sys_exec,
[SYS_fstat]   sys_fstat,
[SYS_chdir]   sys_chdir,
[SYS_dup]     sys_dup,
[SYS_getpid]  sys_getpid,
[SYS_sbrk]    sys_sbrk,
[SYS_sleep]   sys_sleep,
[SYS_uptime]  sys_uptime,
[SYS_open]    sys_open,
[SYS_write]   sys_write,
[SYS_mknod]   sys_mknod,
[SYS_unlink]  sys_unlink,
[SYS_link]    sys_link,
[SYS_mkdir]   sys_mkdir,
[SYS_close]   sys_close,
};

// 系统调用名称数组 - 用于调试输出
static char *syscall_names[] = {
[SYS_fork]    "fork",
[SYS_exit]    "exit",
[SYS_wait]    "wait",
[SYS_pipe]    "pipe",
[SYS_read]    "read",
[SYS_kill]    "kill",
[SYS_exec]    "exec",
[SYS_fstat]   "fstat",
[SYS_chdir]   "chdir",
[SYS_dup]     "dup",
[SYS_getpid]  "getpid",
[SYS_sbrk]    "sbrk",
[SYS_sleep]   "sleep",
[SYS_uptime]  "uptime",
[SYS_open]    "open",
[SYS_write]   "write",
[SYS_mknod]   "mknod",
[SYS_unlink]  "unlink",
[SYS_link]    "link",
[SYS_mkdir]   "mkdir",
[SYS_close]   "close",
};

// 从当前进程的 trapframe 中获取第 n 个整数参数
// 参考 xv6: 参数按照 RISC-V 调用约定保存在 a0-a5 寄存器中
int
argint(int n, int *ip)
{
  struct proc *p = myproc();
  if (p == NULL || p->trapframe == NULL)
    return -1;
  
  switch(n) {
    case 0:
      *ip = p->trapframe->a0;
      return 0;
    case 1:
      *ip = p->trapframe->a1;
      return 0;
    case 2:
      *ip = p->trapframe->a2;
      return 0;
    case 3:
      *ip = p->trapframe->a3;
      return 0;
    case 4:
      *ip = p->trapframe->a4;
      return 0;
    case 5:
      *ip = p->trapframe->a5;
      return 0;
  }
  return -1;
}

// 从当前进程的 trapframe 中获取第 n 个 raw 指针参数
// 参考 xv6: 获取 uint64 类型的参数（通常是地址）
int
argraw(int n, uint64 *ip)
{
  struct proc *p = myproc();
  if (p == NULL || p->trapframe == NULL)
    return -1;
  
  switch(n) {
    case 0:
      *ip = p->trapframe->a0;
      return 0;
    case 1:
      *ip = p->trapframe->a1;
      return 0;
    case 2:
      *ip = p->trapframe->a2;
      return 0;
    case 3:
      *ip = p->trapframe->a3;
      return 0;
    case 4:
      *ip = p->trapframe->a4;
      return 0;
    case 5:
      *ip = p->trapframe->a5;
      return 0;
  }
  return -1;
}

// 从当前进程的 trapframe 中获取第 n 个地址参数
// 参考 xv6: 获取用户空间地址
int
argaddr(int n, uint64 *ip)
{
  return argraw(n, ip);
}

// 从当前进程的 trapframe 中获取第 n 个字符串参数
// 参考 xv6: 从用户空间复制字符串到内核空间
int
argstr(int n, char *buf, int max)
{
  uint64 addr;
  if(argaddr(n, &addr) < 0)
    return -1;
  return fetchstr(addr, buf, max);
}

// 从用户空间地址 addr 获取以 null 结尾的字符串，
// 复制到 buf，最多 max 字节
// 参考 xv6: 使用 copyinstr 从用户空间复制字符串
int
fetchstr(uint64 addr, char *buf, int max)
{
  struct proc *p = myproc();
  if (p == NULL || p->pagetable == 0)
    return -1;
  
  int err = copyinstr(p->pagetable, buf, addr, max);
  if(err < 0)
    return err;
  return err;  // 返回字符串长度（包括 null 结尾符）
}

// 从用户空间地址 srcva 复制 len 字节到 dst
// 参考 xv6: 已经在 vm.c 中实现，这里只是包装
static int
fetchaddr(uint64 addr, uint64 *ip)
{
  struct proc *p = myproc();
  if (p == NULL || p->pagetable == 0)
    return -1;
  
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    return -1;
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    return -1;
  return 0;
}

// 系统调用分发器 - 完全参考 xv6
// 从 trapframe 中读取系统调用号 (a7)，分发到对应函数，
// 并将返回值写回 a0
void
syscall(void)
{
  int num;
  struct proc *p = myproc();

  if (p == NULL || p->trapframe == NULL) {
    printf("syscall: no process or trapframe\n");
    return;
  }

  // 系统调用号保存在 a7 寄存器中
  num = p->trapframe->a7;
  
  // 检查系统调用号是否有效
  if(num > 0 && num < sizeof(syscalls)/sizeof(syscalls[0]) && syscalls[num]) {
    // 调用对应的系统调用处理函数，并将返回值保存在 a0 中
    p->trapframe->a0 = syscalls[num]();
    
    // 调试输出
    if (num < sizeof(syscall_names)/sizeof(syscall_names[0]) && syscall_names[num]) {
      printf("%d %s -> %d\n", p->pid, syscall_names[num], p->trapframe->a0);
    }
  } else {
    // 未知的系统调用号
    printf("%d %s: unknown sys call %d\n",
            p->pid, p->name, num);
    p->trapframe->a0 = -1;  // 返回错误
  }
}
