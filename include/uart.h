#ifndef _UART_H
#define _UART_H

#define __section(x) __attribute__((section(x)))
#define RODATA __section(".rodata")

void uart_putc(char c);
void uart_puts(const char *s);

#endif
