// 进程相关系统调用实现 - 完全参考 xv6
// 包括 fork, exit, wait, getpid, sleep 等

#include "trap.h"
#include "proc.h"
#include "defs.h"
#include "uart.h"
#include "syscall.h"

// sys_fork - 创建子进程
// 参考 xv6: 复制父进程的地址空间和状态
uint64
sys_fork(void)
{
  return fork();
}

// sys_exit - 退出当前进程
// 参考 xv6: 释放资源，将子进程交给 init，唤醒父进程
uint64
sys_exit(void)
{
  int n;
  if(argint(0, &n) < 0)
    return -1;
  exit(n);
  return 0;  // not reached
}

// sys_wait - 等待子进程退出
// 参考 xv6: 返回退出的子进程 pid，并通过参数返回退出状态
uint64
sys_wait(void)
{
  uint64 p;
  if(argaddr(0, &p) < 0)
    return -1;
  return wait(p);
}

// sys_getpid - 获取当前进程 PID
// 参考 xv6: 简单返回当前进程的 pid
uint64
sys_getpid(void)
{
  return myproc()->pid;
}

// sys_sbrk - 增长或收缩进程的数据段
// 参考 xv6: 改变进程的堆大小
uint64
sys_sbrk(void)
{
  int n;
  uint64 addr;
  struct proc *p = myproc();
  
  if(argint(0, &n) < 0)
    return -1;
  
  addr = p->sz;
  if(n > 0) {
    if(uvmalloc(p->pagetable, p->sz, p->sz + n) == 0)
      return -1;
  } else if(n < 0) {
    if(uvmdealloc(p->pagetable, p->sz, p->sz + n) == 0)
      return -1;
  }
  p->sz += n;
  return addr;
}

// sys_sleep - 睡眠指定的 ticks 数
// 参考 xv6: 让进程睡眠，等待时钟中断唤醒
uint64
sys_sleep(void)
{
  int n;
  uint64 ticks0;

  if(argint(0, &n) < 0)
    return -1;
  
  ticks0 = get_ticks();
  while(get_ticks() - ticks0 < n) {
    if(myproc()->killed) {
      return -1;
    }
    // 简化版本：主动让出 CPU
    yield();
  }
  return 0;
}

// sys_kill - 杀死指定进程
// 参考 xv6: 设置进程的 killed 标志
uint64
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

// sys_uptime - 返回系统启动以来的 ticks 数
// 参考 xv6: 返回全局时钟计数
uint64
sys_uptime(void)
{
  return get_ticks();
}

// 以下是文件系统相关的系统调用存根
// 暂时返回错误或简单实现

uint64
sys_pipe(void)
{
  printf("sys_pipe: not implemented\n");
  return -1;
}

uint64
sys_read(void)
{
  printf("sys_read: not implemented\n");
  return -1;
}

uint64
sys_exec(void)
{
  printf("sys_exec: not implemented\n");
  return -1;
}

uint64
sys_fstat(void)
{
  printf("sys_fstat: not implemented\n");
  return -1;
}

uint64
sys_chdir(void)
{
  printf("sys_chdir: not implemented\n");
  return -1;
}

uint64
sys_dup(void)
{
  printf("sys_dup: not implemented\n");
  return -1;
}

uint64
sys_open(void)
{
  printf("sys_open: not implemented\n");
  return -1;
}

uint64
sys_write(void)
{
  // 简单实现：写到 UART
  uint64 addr;
  int n;
  
  if(argaddr(1, &addr) < 0 || argint(2, &n) < 0)
    return -1;
  
  // TODO: 实现完整的 write 系统调用
  printf("sys_write: fd=0, addr=%p, n=%d\n", addr, n);
  return n;
}

uint64
sys_mknod(void)
{
  printf("sys_mknod: not implemented\n");
  return -1;
}

uint64
sys_unlink(void)
{
  printf("sys_unlink: not implemented\n");
  return -1;
}

uint64
sys_link(void)
{
  printf("sys_link: not implemented\n");
  return -1;
}

uint64
sys_mkdir(void)
{
  printf("sys_mkdir: not implemented\n");
  return -1;
}

uint64
sys_close(void)
{
  printf("sys_close: not implemented\n");
  return -1;
}
