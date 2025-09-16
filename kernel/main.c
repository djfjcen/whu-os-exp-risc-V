#include "uart.h"

static const char hello_str[] RODATA = "Hello OS!\n";

void main() {
    uart_puts(hello_str);
    
    while(1) {
        //
    }
}
