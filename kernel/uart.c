#include "memlayout.h"

#define Reg(reg) ((volatile unsigned char *)(UART0 + (reg)))

#define RHR 0                 // 接收保持寄存器（用于输入字节）
#define THR 0                 // 发送保持寄存器（用于输出字节）
#define IER 1                 // 中断使能寄存器
#define IER_RX_ENABLE (1<<0)
#define IER_TX_ENABLE (1<<1)
#define FCR 2                 // FIFO 控制寄存器
#define FCR_FIFO_ENABLE (1<<0)
#define FCR_FIFO_CLEAR (3<<1) // clear the content of the two FIFOs
#define ISR 2                 // 中断状态寄存器
#define LCR 3                 // 行控制寄存器
#define LCR_EIGHT_BITS (3<<0)
#define LCR_BAUD_LATCH (1<<7) // 设置波特率的特殊模式
#define LSR 5                 // 行状态寄存器
#define LSR_RX_READY (1<<0)   // RHR 中有数据可读
#define LSR_TX_IDLE (1<<5)    // THR 可以接受下一个要发送的字符

#define ReadReg(reg) (*(Reg(reg)))
#define WriteReg(reg, v) (*(Reg(reg)) = (v))

/// @brief 初始化 UART
void uart_init( void ) {
    // 暂时不考虑以下内存式寄存器的细节
    WriteReg( IER, 0x00 );
    WriteReg( LCR, LCR_BAUD_LATCH );
    WriteReg( 0, 0x03 );
    WriteReg( 1, 0x00 );
    WriteReg( LCR, LCR_EIGHT_BITS );
    WriteReg( FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR );
    WriteReg( IER, IER_TX_ENABLE | IER_RX_ENABLE );

    // 这里把 spinlock 初始化也删掉了
}

/// @brief 通过 UART 发送一个字符
/// @param c 待发送字符
void uart_putc( char c ) {
    // 这个地方把所有的错误处理全部删掉了，暂时不处理

    // 轮询检查 LSR 的 TX 空闲标志，确保 THR 都是空闲的
    // 防止 OS 输入速度与 UART 硬件消费速度不匹配，覆盖内存导致字符丢失
    while ( ( ReadReg( LSR ) & LSR_TX_IDLE ) == 0 );

    WriteReg( THR, c );
}

/// @brief 通过 UART 发送一个字符串，底层调用 uart_putc
/// @param s 待发送字符串
void uart_puts( char* s ) {
    while ( *s ) {
        uart_putc( *s );
        s++;
    }
}
