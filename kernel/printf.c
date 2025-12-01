#include <stdarg.h>
#include <stdint.h>

#include "defs.h"

/// @brief 十六进制数字字符表，用于整数快速查表转字符串
static char HEX_DIGITS[] = "0123456789ABCDEF";

/// @brief 同步地调用 console_putc 输出一个整数，支持 2~16 进制
/// @param num 待输出的整数
/// @param base 该整数的输出进制（与内存中存储的进制无关）
/// @param is_signed 该整数是否为有符号数，如果 num 为复数则该参数无效
static void print_number( long long num, int base, int is_signed )
{
    if ( base < 2 || base > 16 )
    {
        // 不是我支持的进制，直接返回
        return;
    }

    char buf[ 32 ];
    int idx = 0;

    unsigned long long n = num;

    if ( is_signed && ( is_signed = ( num < 0 ) ) )
    {
        // 如果是有符号数且为负数，则额外取其绝对值
        // 方便统一进行求模运算
        n = -num;
    }

    // 逐轮取模并转换为对应的字符，buf 中存储顺序相当于小端序
    // 简单的计算，为了防止 4KB 栈溢出，采用迭代
    do
    {
        buf[ idx++ ] = HEX_DIGITS[ n % base ];
    } while ( ( n /= base ) != 0 );

    if ( is_signed )
    {
        // 如果是有符号数且为负数，则在前面添加负号
        buf[ idx++ ] = '-';
    }

    // 从内存高位向低位输出字符
    while ( --idx >= 0 )
        console_putc( buf[ idx ] );
}

/// @brief 单线程的格式化输出函数，支持 %d, %x, %c, %s 和 %%
/// @param fmt 待输出的格式化字符串
/// @param args... 具体的参数
void printf( const char* fmt, ... )
{
    va_list args;

    va_start( args, fmt );

    // 暂时不支持 %ll 等多位控制符
    int cx;

    for ( int i = 0; ( cx = fmt[ i ] & 0xFF ) != 0; i++ )
    {
        if ( cx != '%' )
        {
            console_putc( cx );
            continue;
        }

        // 处理 %d 控制符，额外先跳过 '%' 字符
        i++;

        cx = fmt[ i ] & 0xFF;

        switch ( cx )
        {
            case 'd':
                // 有符号十进制整数
                print_number( va_arg( args, int ), 10, 1 );
                break;

            case 'x':
                // 无符号十六进制整数
                print_number( va_arg( args, unsigned int ), 16, 0 );
                break;

            case 'c':
                // 字符
                console_putc( va_arg( args, unsigned int ) );
                break;

            case 's':
                // 字符串
                char* s = va_arg( args, char* );
                if ( s == 0 )
                    s = "(null)";
                for ( ; *s; s++ )
                    console_putc( *s );
                break;

            case '%':
                // 百分号本身
                console_putc( '%' );
                break;

            default:
                // 不支持的格式符，原样输出 % 和 cx
                console_putc( '%' );
                console_putc( cx );
                break;
        }
    }

    va_end( args );
}

void
panic( char* s )
{
    printf( "panic: " );
    printf( "%s\n", s );

    for ( ;;);
}