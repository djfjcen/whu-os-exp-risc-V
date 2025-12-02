#include "syscall.h"
#include "defs.h"

extern struct Process* curr_proc;

/// @brief 获取第 n 个系统调用参数的原始值
/// @param n 参数索引
/// @return 
static u64 argraw( int n ) {
    struct Process* proc = curr_proc;

    switch ( n ) {
        case 0:
            return proc->trapframe->a0;
        case 1:
            return proc->trapframe->a1;
        case 2:
            return proc->trapframe->a2;
        case 3:
            return proc->trapframe->a3;
        case 4:
            return proc->trapframe->a4;
        case 5:
            return proc->trapframe->a5;
    }

    panic( "argraw" );

    return -1;
}

void argint( int n, int* ip ) {
    *ip = argraw( n );
}

void argaddr( int n, u64* ip ) {
    *ip = argraw( n );
}

u64 syscall_fork() {
    // debug: syscall entry
    // printf( "syscall_fork: called by pid %d\n", curr_proc->pid );

    return ( u64 ) kfork();
}

u64 syscall_exit() {
    // printf( "syscall_exit: called by pid %d\n", curr_proc->pid );

    int status;

    argint( 0, &status );

    kexit( status );

    return 0;
}

u64 syscall_wait() {
    // printf( "syscall_wait: called by pid %d\n", curr_proc->pid );

    u64* status;

    argaddr( 0, ( u64* ) &status );

    return kwait( status );
}

u64 syscall_getpid() {
    // printf( "syscall_getpid: returning pid %d\n", curr_proc->pid );

    return ( u64 ) curr_proc->pid;
}

u64 syscall_print() {
    char* s;

    argaddr( 0, ( u64* ) &s );
    
    // 检查 NULL 指针
    if ( s == 0 ) {
        printf( "[ERROR] print: NULL pointer\n" );
        return -1;
    }
    
    char buf[256];
    
    // 复制用户态字符串，限制最大大小为 255 字节（留一个字节给 \0）
    if ( copy_u2k( curr_proc->page_table, ( addr_t ) buf, ( addr_t ) s, 
                   sizeof( buf ) - 1 ) != 0 ) {
        printf( "[ERROR] print: failed to copy string from user space\n" );
        return -1;
    }
    
    // 确保字符串以 null 结尾
    buf[255] = '\0';
    
    printf( "%s", buf );

    return 0;
}

u64 syscall_kill() {
    int pid;

    argint( 0, &pid );

    return ( u64 ) kkill( pid );
}

// 文件系统相关系统调用（在 sysfile.c 中实现）
u64 syscall_open(void);
u64 syscall_close(void);
u64 syscall_read(void);
u64 syscall_write(void);
u64 syscall_mkdir(void);
u64 syscall_unlink(void);

/// @brief 系统调用处理函数指针数组
static u64( *syscalls[] )( void ) = {
    [SYSCALL_FORK] syscall_fork,
    [SYSCALL_WAIT] syscall_wait,
    [SYSCALL_EXIT] syscall_exit,
    [SYSCALL_GETPID] syscall_getpid,
    [SYSCALL_PRINT] syscall_print,
    [SYSCALL_KILL] syscall_kill,
    [SYSCALL_OPEN] syscall_open,
    [SYSCALL_CLOSE] syscall_close,
    [SYSCALL_READ] syscall_read,
    [SYSCALL_WRITE] syscall_write,
    [SYSCALL_MKDIR] syscall_mkdir,
    [SYSCALL_UNLINK] syscall_unlink,
};

void syscall() {
    struct Process* proc = curr_proc;
    u64 syscall_num = proc->trapframe->a7;

    if ( syscall_num <= 0 || syscall_num >= NELEM( syscalls ) || syscalls[syscall_num] == 0 ) {
        printf( "Unknown syscall %d from process %d\n", (int)syscall_num, proc->pid );

        proc->trapframe->a0 = ( u64 ) -1;

        return;
    }

    u64 sstatus = read_sstatus();
    write_sstatus( sstatus | SSTATUS_SUM );

    proc->trapframe->a0 = syscalls[syscall_num]();

    write_sstatus( sstatus );
}    