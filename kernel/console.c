#include "defs.h"

/// @brief 同步地调用 UART 发送一个字符到控制台
/// @param c 待发送字符
void console_putc( char c )
{
    uart_putc( c );
}
