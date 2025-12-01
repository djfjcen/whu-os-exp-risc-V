#ifndef _SYSCALL_H_
#define _SYSCALL_H_

#include "defs.h"

#define SYSCALL_FORK 1
#define SYSCALL_WAIT 2
#define SYSCALL_EXIT 3
#define SYSCALL_GETPID 4
#define SYSCALL_PRINT 5
#define SYSCALL_KILL 6

void syscall();

#endif // !_SYSCALL_H_