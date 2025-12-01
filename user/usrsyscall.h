#ifndef _USR_SYSCALL_H_
#define _USR_SYSCALL_H_

#include "types.h"

#include "types.h"

#define SYS_FORK 1
#define SYS_WAIT 2
#define SYS_EXIT 3
#define SYS_GETPID 4
#define SYS_PRINT 5
#define SYS_KILL 6

int sys_fork();
int sys_wait( int* status );
void sys_exit( int status );
int sys_getpid();
void sys_print( const char* s );
int sys_kill( int pid );

#endif // !_USR_SYSCALL_H_