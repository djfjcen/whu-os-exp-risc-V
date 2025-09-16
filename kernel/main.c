#include "uart.h"
#include <stdarg.h>

// 声明测试函数
void basic_format_test();
void boundary_test();
void color_test();
void screen_test();
void performance_test();
void error_recovery_test();

// 测试用的大量数据
static const char long_string[] = 
    "这是一个很长的字符串，用于测试输出性能和稳定性。"
    "它包含了很多字符，可以帮助我们评估系统在大量输出情况下的表现。"
    "我们可以通过观察输出是否完整、格式是否正确来判断系统的稳定性。"
    "This is a long English string for testing purposes. "
    "It contains many characters to help evaluate system performance. "
    "We can check if the output is complete and correctly formatted.";

void performance_test() {
    uart_puts("=== 性能测试 ===\n");
    
    // 输出大量数据
    for (int i = 0; i < 100; i++) {
        printf("测试行 %d: %s\n", i, long_string);
    }
    
    uart_puts("性能测试完成\n\n");
}

void basic_format_test() {
    uart_puts("=== 基本格式化功能测试 ===\n");
    
    // 测试各种格式化输出
    printf("整数测试: %d\n", 12345);
    printf("负数测试: %d\n", -98765);
    printf("十六进制测试: 0x%x\n", 0xDEADBEEF);
    printf("字符串测试: %s\n", "Hello, World!");
    printf("字符测试: %c\n", 'A');
    printf("百分号测试: %%\n");
    
    // 测试边界值
    printf("零值测试: %d\n", 0);
    printf("最大整数: %d\n", 2147483647);
    printf("最小整数: %d\n", -2147483648);
    
    uart_puts("基本格式化功能测试完成\n\n");
}

void boundary_test() {
    uart_puts("=== 边界条件处理测试 ===\n");
    
    // 测试空指针
    printf("空字符串测试: %s\n", (char*)0);
    
    // 测试空格式字符串
    printf("空格式测试: %s\n", "");
    
    // 测试无效格式
    printf("无效格式测试: %z\n");
    
    // 测试截断格式
    printf("截断格式测试: %");
    
    uart_puts("\n边界条件处理测试完成\n\n");
}

void color_test() {
    uart_puts("=== 颜色输出测试 ===\n");
    
    printf_color(COLOR_RED, "红色文本\n");
    printf_color(COLOR_GREEN, "绿色文本\n");
    printf_color(COLOR_BLUE, "蓝色文本\n");
    printf_color(COLOR_YELLOW, "黄色文本\n");
    printf_color(COLOR_MAGENTA, "洋红色文本\n");
    printf_color(COLOR_CYAN, "青色文本\n");
    printf_color(COLOR_WHITE, "白色文本\n");
    
    // 测试彩色格式化
    printf_color(COLOR_RED, "红色数字: %d\n", 100);
    printf_color(COLOR_GREEN, "绿色字符串: %s\n", "Success");
    
    uart_puts("颜色输出测试完成\n\n");
}

void screen_test() {
    uart_puts("=== 屏幕操作功能测试 ===\n");
    
    // 测试清屏
    uart_puts("清屏前的内容...\n");
    for (int i = 0; i < 5; i++) {
        printf("行 %d\n", i);
    }
    
    // 等待片刻
    for (volatile int i = 0; i < 100000; i++);
    
    // 清屏
    clear_screen();
    uart_puts("清屏后的内容，之前的应该都看不到了\n\n");
    
    // 测试光标定位
    uart_puts("光标定位测试:\n");
    goto_xy(1, 5);
    uart_puts("第5行第1列");
    
    goto_xy(20, 5);
    uart_puts("第5行第20列");
    
    goto_xy(1, 7);
    printf_color(COLOR_CYAN, "彩色定位文本");
    
    // 测试行清除
    goto_xy(1, 9);
    uart_puts("这一行将被清除");
    goto_xy(1, 10);
    clear_line();
    uart_puts("上一行已被清除，这是第10行");
    
    uart_puts("\n\n屏幕操作功能测试完成\n\n");
}

void error_recovery_test() {
    uart_puts("=== 错误恢复测试 ===\n");
    
    // 测试NULL格式字符串
    int result = printf((char*)0);
    // 确保 printf 返回值处理正常
    if (result < 0) {
        uart_puts("检测到无效的格式字符串\n");
    }
    
    // 测试正常格式字符串
    printf("正常输出测试: %d %s\n", 42, "Test");
    
    uart_puts("错误恢复测试完成\n\n");
}

void main() {
    uart_puts("开始综合测试...\n\n");
    
    // 基本格式化功能测试
    basic_format_test();
    
    // 边界条件处理测试
    boundary_test();
    
    // 颜色输出测试
    color_test();
    
    // 屏幕操作功能测试
    screen_test();
    
    // 性能测试（大量输出）
    performance_test();
    
    // 错误恢复测试
    error_recovery_test();
    
    uart_puts("所有测试完成!\n");
    
    while(1) {
        //
    }
}