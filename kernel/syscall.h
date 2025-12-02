#ifndef _SYSCALL_H_
#define _SYSCALL_H_

#include "defs.h"

#define SYSCALL_FORK 1
#define SYSCALL_WAIT 2
#define SYSCALL_EXIT 3
#define SYSCALL_GETPID 4
#define SYSCALL_PRINT 5
#define SYSCALL_KILL 6
#define SYSCALL_OPEN 7
#define SYSCALL_CLOSE 8
#define SYSCALL_READ 9
#define SYSCALL_WRITE 10
#define SYSCALL_MKDIR 11
#define SYSCALL_UNLINK 12
#define SYSCALL_FSTAT 13
#define SYSCALL_DUP 14
#define SYSCALL_LINK 15

void syscall();
void argint(int n, int *ip);
void argaddr(int n, u64 *ip);

#endif // !_SYSCALL_H_