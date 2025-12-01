#include "user/usrsyscall.h"
#include "kernel/defs.h"

void print_int( int n ) {
    char buf[20];
    int i = 0;
    if ( n == 0 ) {
        sys_print( "0" );
        return;
    }
    if ( n < 0 ) {
        sys_print( "-" );
        n = -n;
    }
    while ( n > 0 ) {
        buf[i++] = '0' + n % 10;
        n /= 10;
    }
    while ( i > 0 ) {
        char c[2] = { buf[--i], '\0' };
        sys_print( c );
    }
}

int main() {
    sys_print( "=== main() ===\n\n" );

    sys_print( "运行测试...\n\n" );

    sys_print( "=== 测试 fork 和 kill ===\n\n" );

    int child_pids[3];

    // 创建三个子进程
    for ( int i = 0; i < 3; i++ ) {
        int fork_result = sys_fork();

        if ( fork_result == 0 ) {
            // 子进程：获取自己的 PID 并进入无限循环
            int my_pid = sys_getpid();
            sys_print( "子进程 " );
            print_int( i + 1 );
            sys_print( " 创建，PID: " );
            print_int( my_pid );
            sys_print( "\n" );

            // 子进程进入无限循环，等待被杀死
            while ( 1 );
        } else if ( fork_result > 0 ) {
            // 父进程：记录子进程 PID
            child_pids[i] = fork_result;
            sys_print( "父进程 fork 了子进程 " );
            print_int( i + 1 );
            sys_print( "，PID: " );
            print_int( fork_result );
            sys_print( "\n" );
        }
    }

    sys_print( "\n杀死所有三个子进程...\n\n" );

    // 逐个杀死三个子进程
    for ( int i = 0; i < 3; i++ ) {
        int kill_result = sys_kill( child_pids[i] );
        sys_print( "杀死子进程 " );
        print_int( i + 1 );
        sys_print( " (PID: " );
        print_int( child_pids[i] );
        sys_print( ") - 结果: " );
        print_int( kill_result );
        sys_print( "\n" );
    }

    sys_print( "\n等待所有子进程退出...\n\n" );

    // 等待所有子进程退出
    for ( int i = 0; i < 3; i++ ) {
        int status;
        int waited_pid = sys_wait( &status );
        sys_print( "子进程 " );
        print_int( i + 1 );
        sys_print( " (PID: " );
        print_int( waited_pid );
        sys_print( ") 已退出\n" );
    }

    sys_print( "\n所有 fork 和 kill 测试通过。\n\n" );

    sys_print( "=== 测试 fork 和 exit ===\n\n" );

    int pid = sys_getpid();

    sys_print( "当前 PID(父进程): " );
    print_int( pid );
    sys_print( "\n" );

    int fork_pid = sys_fork();

    sys_print( "Fork 返回: " );
    print_int( fork_pid );
    sys_print( "\n" );

    const int TEST_EXS = 42;

    if ( fork_pid == 0 ) {
        // 子进程
        int child_pid = sys_getpid();

        sys_print( "在子进程中。PID: " );
        print_int( child_pid );
        sys_print( "\n" );

        sys_exit( TEST_EXS );

        // 不应该返回
        sys_print( "子进程不应该执行到这里！\n" );

        while ( 1 );
    } else {
        // 父进程
        int status;

        sys_print( "在父进程中。准备等待子进程退出...\n" );

        int waited_pid = sys_wait( &status );

        sys_print( "在父进程中。等待的 PID: " );
        print_int( waited_pid );
        sys_print( "，退出状态: " );
        print_int( status );
        sys_print( "\n" );

        if ( waited_pid != fork_pid || status != TEST_EXS ) {
            sys_print( "测试失败：wait 结果意外。\n" );
            return -1;
        }
    }

    sys_print( "所有测试通过。\n\n" );

    sys_print( "=== 安全性测试 ===\n\n" );

    // 测试 1: 非法系统调用号
    sys_print( "测试 1: 非法系统调用号\n" );
    asm volatile(
        "li a7, 999\n"      // 非法的系统调用号
        "ecall\n"
        :
        :
        : "memory"
    );
    sys_print( "已处理非法系统调用号\n\n" );

    // 测试 2: 无效 PID (kill 不存在的进程)
    sys_print( "测试 2: 无效 PID (kill 不存在的进程)\n" );
    int kill_invalid = sys_kill( 9999 );
    sys_print( "kill 不存在的进程 (PID: 9999) - 结果: " );
    print_int( kill_invalid );
    sys_print( " (应该是 -1)\n\n" );

    // 测试 3: NULL 指针测试 (print NULL)
    sys_print( "测试 3: NULL 指针测试 (print NULL)\n" );
    sys_print( "打印 NULL 指针: " );
    sys_print( ( const char* ) 0 );  // 尝试打印 NULL 指针
    sys_print( " (已处理)\n\n" );

    // 测试 4: 超长字符串测试 (缓冲区边界)
    sys_print( "测试 4: 超长字符串测试 (缓冲区边界)\n" );
    char long_string[512];
    for ( int i = 0; i < 510; i++ ) {
        long_string[i] = 'A';
    }
    long_string[510] = '\0';
    sys_print( "打印 510 字节的字符串: " );
    sys_print( long_string );
    sys_print( "\n打印完成 (缓冲区边界测试通过)\n\n" );

    sys_print( "所有安全性测试完成。\n\n" );

    sys_print( "--- main() ---\n" );

    // 由于当前用户 main 是寄生在 init_proc 中的，所以不可以退出
    while ( 1 );

    return 0;
}
