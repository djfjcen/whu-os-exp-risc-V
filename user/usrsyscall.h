#ifndef _USR_SYSCALL_H_
#define _USR_SYSCALL_H_

#include "types.h"

#define SYS_FORK 1
#define SYS_WAIT 2
#define SYS_EXIT 3
#define SYS_GETPID 4
#define SYS_PRINT 5
#define SYS_KILL 6
#define SYS_OPEN 7
#define SYS_CLOSE 8
#define SYS_READ 9
#define SYS_WRITE 10
#define SYS_MKDIR 11
#define SYS_UNLINK 12

#define O_RDONLY  0x000
#define O_WRONLY  0x001
#define O_RDWR    0x002
#define O_CREATE  0x200
#define O_TRUNC   0x400

int sys_fork();
int sys_wait( int* status );
void sys_exit( int status );
int sys_getpid();
void sys_print( const char* s );
int sys_kill( int pid );
int sys_open( const char* path, int omode );
int sys_close( int fd );
int sys_read( int fd, char* buf, int n );
int sys_write( int fd, const char* buf, int n );
int sys_mkdir( const char* path );
int sys_unlink( const char* path );

#endif // !_USR_SYSCALL_H_