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
#define SYS_FSTAT 13
#define SYS_DUP 14
#define SYS_LINK 15

#define O_RDONLY  0x000
#define O_WRONLY  0x001
#define O_RDWR    0x002
#define O_CREATE  0x200
#define O_TRUNC   0x400
#define O_APPEND  0x800

// 文件类型
#define T_DIR   1   // 目录
#define T_FILE  2   // 普通文件
#define T_DEVICE 3  // 设备

// 文件stat结构
struct stat {
    int dev;     // 文件系统的磁盘设备
    unsigned long ino;     // Inode号
    short type;  // 文件类型
    short nlink; // 指向文件的链接数
    unsigned long size;    // 文件字节数
};

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
int sys_fstat( int fd, struct stat* st );
int sys_dup( int fd );
int sys_link( const char* oldpath, const char* newpath );

#endif // !_USR_SYSCALL_H_