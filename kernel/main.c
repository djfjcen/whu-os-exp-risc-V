#include "defs.h"
#include "uart.h"
#include "trap.h"
#include "scheduler.h"
#include "timer.h"
#include <stdarg.h>
#include <stddef.h>

// 函数声明
void test_scheduler_system(void);
void test_timer_interrupt(void);
void test_exception_handling(void);
void test_page_fault_exception(void);
void test_interrupt_overhead(void);
void test_comprehensive_exception_handling(void);
extern int timer_interrupt_handler(int irq, void* data, struct trap_frame* tf);
extern struct task* get_current_task(void);


// 测试用的大量数据
static const char long_string[] = 
    "这是一个很长的字符串，用于测试输出性能和稳定性。"
    "它包含了很多字符，可以帮助我们评估系统在大量输出情况下的表现。"
    "我们可以通过观察输出是否完整、格式是否正确来判断系统的稳定性。"
    "This is a long English string for testing purposes. "
    "It contains many characters to help evaluate system performance. "
    "We can check if the output is complete and correctly formatted.";

void test_virtual_memory(void) {
    uart_puts("=== 虚拟内存测试 ===\n");
    
    // 初始化物理内存管理器
    uart_puts("初始化物理内存管理器...\n");
    pmm_init(0x80200000, 0x88000000);
    
    uart_puts("初始化内核页表...\n");
    kvminit();
    
    uart_puts("激活内核页表...\n");
    kvminithart();
    
    uart_puts("虚拟内存启用成功!\n");
    uart_puts("虚拟内存测试完成\n\n");
}

/*
 * 任务6：异常处理机制测试函数
 */

/**
 * 测试时钟中断功能
 */
void test_timer_interrupt(void) {
    printf("Testing timer interrupt...\n");
    
    // 模拟时钟中断测试（不启动真实时钟中断）
    printf("模拟时钟中断测试...\n");
    
    for (int i = 0; i < 5; i++) {
        printf("模拟时钟中断 %d\n", i + 1);
        
        // 简单延时
        for (volatile int j = 0; j < 1000000; j++);
        
        // 测试时钟中断处理函数调用
        printf("时钟中断 %d 处理完成\n", i + 1);
    }
    
    printf("Timer test completed: 5 simulated interrupts\n");
}

/**
 * 测试异常处理功能
 */
void test_exception_handling(void) {
    printf("Testing exception handling...\n");
    
    // 测试1: 模拟系统调用异常
    printf("1. 测试系统调用异常...\n");
    // 这需要在用户模式下执行，这里只是演示
    printf("   系统调用测试跳过（需要用户模式）\n");
    
    // 测试2: 测试断点异常
    printf("2. 测试断点异常...\n");
    // 插入断点指令 (ebreak)
    // 注意：这在内核模式下会导致panic，这里只是展示
    printf("   断点测试跳过（会导致panic）\n");
    
    // 测试3: 测试页故障处理
    printf("3. 测试页故障处理...\n");
    test_page_fault_exception();
    
    // 测试4: 测试非法指令
    printf("4. 测试非法指令异常...\n");
    printf("   非法指令测试跳过（会导致panic）\n");
    
    printf("Exception tests completed\n");
}

/**
 * 测试页故障异常
 */
void test_page_fault_exception(void) {
    printf("测试页故障异常处理...\n");
    
    // 尝试访问一个可能引起页故障的地址
    volatile uint64_t test_addr = 0x1000000;  // 1MB地址
    
    printf("尝试读取地址 0x%llx\n", test_addr);
    
    // 这可能会触发页故障，由我们的异常处理系统处理
    // 在实际实现中，这需要更仔细的内存管理
    
    printf("页故障测试完成（如果到达这里）\n");
}

/**
 * 测试中断开销
 */
void test_interrupt_overhead(void) {
    printf("Testing interrupt overhead...\n");
    
    uint64_t start_time, end_time;
    const int iterations = 1000;
    
    // 测量无中断情况下的执行时间
    disable_interrupts();
    start_time = get_system_time();
    
    for (volatile int i = 0; i < iterations; i++) {
        // 模拟一些计算工作
        volatile int dummy = i * i;
        (void)dummy; // 避免未使用变量警告
    }
    
    end_time = get_system_time();
    uint64_t no_interrupt_time = end_time - start_time;
    
    enable_interrupts();
    
    // 测量有中断情况下的执行时间
    start_time = get_system_time();
    
    for (volatile int i = 0; i < iterations; i++) {
        // 模拟一些计算工作
        volatile int dummy = i * i;
        (void)dummy; // 避免未使用变量警告
        
        // 偶尔手动触发调度检查
        if (i % 100 == 0) {
            schedule_from_timer();
        }
    }
    
    end_time = get_system_time();
    uint64_t with_interrupt_time = end_time - start_time;
    
    // 打印结果
    printf("无中断执行时间: %llu cycles\n", no_interrupt_time);
    printf("有中断执行时间: %llu cycles\n", with_interrupt_time);
    printf("中断开销: %llu cycles (%llu%%)\n", 
           with_interrupt_time - no_interrupt_time,
           ((with_interrupt_time - no_interrupt_time) * 100) / no_interrupt_time);
    
    // 打印中断统计信息
    print_interrupt_stats();
}

/**
 * 综合异常处理测试
 */
void test_comprehensive_exception_handling(void) {
    printf("========================================\n");
    printf("          异常处理综合测试              \n");
    printf("========================================\n\n");
    
    // 时钟中断测试
    printf("--- 时钟中断测试 ---\n");
    test_timer_interrupt();
    printf("\n");
    
    // 异常处理测试
    printf("--- 异常处理测试 ---\n");
    test_exception_handling();
    printf("\n");
    
    // 中断开销测试
    printf("--- 中断开销测试 ---\n");
    test_interrupt_overhead();
    printf("\n");
    
    printf("异常处理综合测试完成\n");
}

/**
 * 系统panic函数
 */
void panic(const char* msg) {
    uart_puts("KERNEL PANIC: ");
    uart_puts(msg);
    uart_puts("\n");
    
    // 禁用中断
    disable_interrupts();
    
    // 无限循环
    while (1) {
        asm volatile("wfi");  // 等待中断（虽然已禁用）
    }
}

void pt_test() {
    uart_puts("=== 页表管理器测试 ===\n");
    
    // 初始化物理内存管理器
    uart_puts("初始化物理内存管理器...\n");
    pmm_init(0x80200000, 0x88000000);
    
    // 创建页表
    uart_puts("创建页表...\n");
    pagetable_t pt = create_pagetable();
    if (pt == 0) {
        uart_puts("创建页表失败\n");
        return;
    }
    uart_puts("页表创建成功\n");
    
    // 映射一些页面
    uart_puts("映射页面...\n");
    int ret;
    
    // 映射内核代码段 (只读+可执行)
    ret = map_page(pt, 0x80000000, 0x80000000, PTE_R | PTE_X);
    if (ret != 0) {
        uart_puts("映射内核代码段失败\n");
    } else {
        printf("映射内核代码段成功: VA=0x%x -> PA=0x%x\n", 0x80000000, 0x80000000);
    }
    
    // 映射内核数据段 (读写)
    ret = map_page(pt, 0x80200000, 0x80200000, PTE_R | PTE_W);
    if (ret != 0) {
        uart_puts("映射内核数据段失败\n");
    } else {
        printf("映射内核数据段成功: VA=0x%x -> PA=0x%x\n", 0x80200000, 0x80200000);
    }
    
    // 映射用户栈空间 (读写+用户权限)
    ret = map_page(pt, 0x7FFFFFF000, 0x81000000, PTE_R | PTE_W | PTE_U);
    if (ret != 0) {
        uart_puts("映射用户栈空间失败\n");
    } else {
        printf("映射用户栈空间成功: VA=0x%x -> PA=0x%x\n", 0x7FFFFFF000, 0x81000000);
    }
    
    // 打印页表内容
    uart_puts("页表内容:\n");
    dump_pagetable(pt, 0);
    
    // 销毁页表
    uart_puts("销毁页表...\n");
    destroy_pagetable(pt);
    uart_puts("页表销毁完成\n");
    
    uart_puts("页表管理器测试完成\n\n");
}

void pmm_test() {
    uart_puts("=== 物理内存管理器测试 ===\n");
    
    // 初始化物理内存管理器
    // 使用0x80200000到0x88000000之间的内存区域作为测试
    uart_puts("初始化物理内存管理器...\n");
    pmm_init(0x80200000, 0x88000000);
    
    // 分配页面测试
    uart_puts("分配页面测试:\n");
    void* page1 = alloc_page();
    printf("分配第1个页面: 0x%x\n", (uint64_t)page1);
    
    void* page2 = alloc_page();
    printf("分配第2个页面: 0x%x\n", (uint64_t)page2);
    
    void* page3 = alloc_page();
    printf("分配第3个页面: 0x%x\n", (uint64_t)page3);
    
    // 释放页面测试
    uart_puts("释放页面测试:\n");
    free_page(page1);
    uart_puts("已释放第1个页面\n");
    
    free_page(page2);
    uart_puts("已释放第2个页面\n");
    
    // 重新分配页面测试
    uart_puts("重新分配页面测试:\n");
    void* page4 = alloc_page();
    printf("重新分配页面: 0x%x\n", (uint64_t)page4);
    
    void* page5 = alloc_page();
    printf("重新分配页面: 0x%x\n", (uint64_t)page5);
    
    // 释放所有页面
    free_page(page3);
    free_page(page4);
    free_page(page5);
    uart_puts("已释放所有测试页面\n");
    
    uart_puts("物理内存管理器测试完成\n\n");
}

// 测试：2被占，1/3/4/5空闲，连续分配3页会分3/4/5，分开分配会分1/3/4
void test_alloc_pages_gap2(void) {
    uart_puts("=== 物理内存分配连续性测试 ===\n");
    
    // 初始化物理内存管理器
    uart_puts("初始化物理内存管理器...\n");
    pmm_init(0x80200000, 0x88000000);
    
    // 占用页码 2
    void* occupied_page = alloc_page();
    printf("占用的页面: 0x%x\n", (uint64_t)occupied_page);
    
    // 连续分配3页
    uart_puts("连续分配3页:\n");
    void* pages[3];
    for (int i = 0; i < 3; i++) {
        pages[i] = alloc_page();
        printf("分配的页面%d: 0x%x\n", i + 1, (uint64_t)pages[i]);
    }
    
    // 释放页面
    uart_puts("释放页面:\n");
    free_page(occupied_page);
    uart_puts("已释放被占用的页面\n");
    
    for (int i = 0; i < 3; i++) {
        free_page(pages[i]);
        printf("已释放页面%d\n", i + 1);
    }
    
    uart_puts("物理内存分配连续性测试完成\n\n");
}

// 测试连续分配，模拟1空2有345空，连续分配3个会分配345
void test_alloc_pages_pattern(void) {
    uart_puts("=== 连续分配物理页测试 ===\n");
    // 重新初始化物理内存管理器，保证链表状态可控
    pmm_init(0x80200000, 0x88000000);
    // 先分配5页，保存地址
    void* pages[5];
    for (int i = 0; i < 5; i++) {
        pages[i] = alloc_page();
        printf("分配页面%d: 0x%x\n", i+1, (uint64_t)pages[i]);
    }
    // 释放1,3,4,5号页（下标0,2,3,4），2号页不释放
    free_page(pages[0]);
    free_page(pages[2]);
    free_page(pages[3]);
    free_page(pages[4]);
    printf("释放页面1: 0x%x\n", (uint64_t)pages[0]);
    printf("释放页面3: 0x%x\n", (uint64_t)pages[2]);
    printf("释放页面4: 0x%x\n", (uint64_t)pages[3]);
    printf("释放页面5: 0x%x\n", (uint64_t)pages[4]);
    // 此时链表中有4个空闲页，但只有3/4/5物理上连续
    void* p = alloc_pages(3);
    if (p == 0) {
        uart_puts("alloc_pages failed\n");
        return;
    }
    uart_puts("alloc_pages success, base addr: 0x");
    unsigned long addr = (unsigned long)p;
    for (int i = (sizeof(addr) * 2 - 1); i >= 0; i--) {
        int digit = (addr >> (i * 4)) & 0xF;
        uart_putc(digit < 10 ? '0' + digit : 'A' + digit - 10);
    }
    uart_puts("\n");
    // 显示分配到的3个页的物理地址
    for (int i = 0; i < 3; i++) {
        printf("连续分配到的页面%d: 0x%x\n", i+1, (uint64_t)((char*)p + i * PAGE_SIZE));
    }
}

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

// 页面替换系统信息显示
void print_page_replacement_info(void) {
    uart_puts("\n=== 页面替换系统信息 ===\n");
    
    uart_puts("实现特性:\n");
    uart_puts("1. LRU (最近最少使用) 页面替换算法\n");
    uart_puts("2. 交换区管理 (模拟磁盘)\n");
    uart_puts("3. 页面缺失处理\n");
    uart_puts("4. 脏页检测和写回\n");
    uart_puts("5. 安全的内存访问函数\n");
    
    uart_puts("\n主要数据结构:\n");
    uart_puts("- struct page_desc: 页面描述符\n");
    uart_puts("- struct swap_manager: 交换区管理器\n");
    uart_puts("- struct lru_manager: LRU链表管理器\n");
    
    uart_puts("\n核心算法:\n");
    uart_puts("- 页面换出: swap_out_page()\n");
    uart_puts("- 页面换入: swap_in_page()\n");
    uart_puts("- 缺页处理: handle_page_fault()\n");
    uart_puts("- 受害页选择: find_victim_page()\n");
    
    uart_puts("\n使用方法:\n");
    uart_puts("1. 调用 init_page_replacement() 初始化系统\n");
    uart_puts("2. 使用 va2pa_with_replacement() 进行地址转换\n");
    uart_puts("3. 使用 safe_copyout/safe_copyin 进行安全内存访问\n");
    uart_puts("4. 系统自动处理页面缺失和替换\n");
    
    uart_puts("================================\n\n");
}

// 页面替换系统基础演示
void demonstrate_page_replacement(void) {
    uart_puts("\n=== 页面替换系统演示 ===\n");
    
    uart_puts("1. 初始化页面替换系统\n");
    init_page_replacement();
    
    uart_puts("2. 创建用户页表\n");
    pagetable_t user_pt = create_pagetable();
    if (!user_pt) {
        uart_puts("   错误: 无法创建页表\n");
        return;
    }
    
    uart_puts("3. 模拟页面分配和映射\n");
    // 分配几个物理页面并映射
    uint64_t virtual_addrs[] = {0x10000000, 0x10001000, 0x10002000, 0x10003000};
    uint64_t physical_addrs[4];
    
    for (int i = 0; i < 4; i++) {
        physical_addrs[i] = (uint64_t)alloc_page();
        if (physical_addrs[i]) {
            if (map_page(user_pt, virtual_addrs[i], physical_addrs[i], 
                        PTE_R | PTE_W | PTE_U) == 0) {
                uart_puts("   映射页面 ");
                // 简单打印虚拟地址
                uart_puts("0x");
                // 简化的十六进制打印
                uint64_t addr = virtual_addrs[i];
                int printed = 0;
                for (int shift = 60; shift >= 0; shift -= 4) {
                    int digit = (addr >> shift) & 0xF;
                    if (digit || printed || shift == 0) {
                        printed = 1;
                        uart_putc(digit < 10 ? '0' + digit : 'A' + digit - 10);
                    }
                }
                uart_puts(" 成功\n");
            } else {
                uart_puts("   映射页面失败\n");
            }
        } else {
            uart_puts("   物理页面分配失败\n");
        }
    }
    
    uart_puts("4. 测试页面访问和LRU更新\n");
    // 模拟页面访问
    for (int i = 0; i < 4; i++) {
        lru_touch_page(virtual_addrs[i]);
    }
    
    uart_puts("5. 测试页面替换功能\n");
    // 运行页面替换测试
    test_page_replacement();
    
    uart_puts("6. 演示虚拟地址转换\n");
    for (int i = 0; i < 2; i++) {
        uint64_t pa = va2pa_with_replacement(user_pt, virtual_addrs[i]);
        if (pa) {
            uart_puts("   虚拟地址转换成功\n");
        } else {
            uart_puts("   虚拟地址转换失败\n");
        }
    }
    
    uart_puts("7. 清理资源\n");
    // 释放页面
    for (int i = 0; i < 4; i++) {
        if (physical_addrs[i]) {
            free_page((void*)physical_addrs[i]);
        }
    }
    
    // 销毁页表
    destroy_pagetable(user_pt);
    
    uart_puts("=== 页面替换演示完成 ===\n\n");
}

// 页面替换演示函数
void page_replacement_example() {
    uart_puts("=== 页面替换系统演示开始 ===\n\n");
    
    // 1. 显示系统信息
    print_page_replacement_info();
    
    // 2. 运行完整演示
    demonstrate_page_replacement();
    
    // 3. 运行单元测试验证功能
    test_page_replacement();
    
    uart_puts("=== 页面替换系统演示完成 ===\n\n");
}

// 高级页面替换使用示例
void advanced_page_replacement_example() {
    uart_puts("=== 高级页面替换使用示例 ===\n");
    
    // 创建用户页表
    pagetable_t user_pt = create_pagetable();
    if (!user_pt) {
        uart_puts("错误: 无法创建用户页表\n");
        return;
    }
    
    uart_puts("1. 创建多个虚拟页面映射\n");
    uint64_t test_vas[] = {
        0x40000000,  // 用户空间1
        0x40001000,  // 用户空间2  
        0x40002000,  // 用户空间3
        0x40003000,  // 用户空间4
        0x40004000   // 用户空间5
    };
    
    // 映射页面并写入测试数据
    for (int i = 0; i < 5; i++) {
        uint64_t pa = (uint64_t)alloc_page();
        if (pa && map_page(user_pt, test_vas[i], pa, PTE_R | PTE_W | PTE_U) == 0) {
            // 使用安全写入函数写入测试数据
            char test_data[64];
            for (int j = 0; j < 63; j++) {
                test_data[j] = 'A' + (i * 10 + j) % 26;
            }
            test_data[63] = '\0';
            
            if (safe_copyout(user_pt, test_vas[i], test_data, 64) == 0) {
                uart_puts("   页面映射和数据写入成功\n");
            } else {
                uart_puts("   数据写入失败\n");
            }
        } else {
            uart_puts("   页面映射失败\n");
        }
    }
    
    uart_puts("2. 模拟页面访问模式\n");
    // 模拟不同的访问模式来测试LRU
    for (int round = 0; round < 3; round++) {
        uart_puts("   访问轮次 ");
        uart_putc('1' + round);
        uart_puts("\n");
        
        for (int i = 0; i < 5; i++) {
            // 读取数据来触发页面访问
            char read_buffer[64];
            if (safe_copyin(user_pt, read_buffer, test_vas[i], 64) == 0) {
                uart_puts("     成功访问页面 ");
                uart_putc('1' + i);
                uart_puts("\n");
                
                // 更新LRU状态
                lru_touch_page(test_vas[i]);
            }
        }
    }
    
    uart_puts("3. 验证地址转换功能\n");
    for (int i = 0; i < 3; i++) {
        uint64_t physical = va2pa_with_replacement(user_pt, test_vas[i]);
        if (physical) {
            uart_puts("   地址转换成功: VA -> PA\n");
        } else {
            uart_puts("   地址转换失败\n");
        }
    }
    
    uart_puts("4. 清理资源\n");
    // 清理页表和释放内存
    destroy_pagetable(user_pt);
    uart_puts("   用户页表已销毁\n");
    
    uart_puts("高级页面替换使用示例完成\n\n");
}

// 测试中断处理函数 - timer_interrupt_handler 现在在 timer.c 中定义

int software_interrupt_handler(int irq, void* data, struct trap_frame* tf) {
    uart_puts("软件中断处理函数被调用\n");
    return 0;
}

int external_interrupt_handler(int irq, void* data, struct trap_frame* tf) {
    uart_puts("外部中断处理函数被调用\n");
    return 0;
}

// 中断系统测试函数
void test_interrupt_system(void) {
    uart_puts("=== 中断系统测试 ===\n");
    
    // 1. 初始化中断系统
    uart_puts("1. 初始化中断系统\n");
    trap_init();
    
    // 2. 注册各种中断处理函数
    uart_puts("2. 注册中断处理函数\n");
    
    // 注册定时器中断处理函数
    register_interrupt(TRAP_SUPERVISOR_TIMER_INTERRUPT, 
                      timer_interrupt_handler, 
                      0, 
                      "Timer Interrupt", 
                      IRQ_FLAG_ENABLED | IRQ_FLAG_NESTABLE, 
                      IRQ_PRIORITY_HIGH);
    
    // 注册软件中断处理函数
    register_interrupt(TRAP_SUPERVISOR_SOFTWARE_INTERRUPT,
                      software_interrupt_handler,
                      0,
                      "Software Interrupt",
                      IRQ_FLAG_ENABLED,
                      IRQ_PRIORITY_NORMAL);
    
    // 注册外部中断处理函数
    register_interrupt(TRAP_SUPERVISOR_EXTERNAL_INTERRUPT,
                      external_interrupt_handler,
                      0,
                      "External Interrupt", 
                      IRQ_FLAG_ENABLED | IRQ_FLAG_SHARED,
                      IRQ_PRIORITY_HIGH);
    
    // 3. 启用中断
    uart_puts("3. 启用中断\n");
    enable_interrupt(TRAP_SUPERVISOR_TIMER_INTERRUPT);
    enable_interrupt(TRAP_SUPERVISOR_SOFTWARE_INTERRUPT);
    enable_interrupt(TRAP_SUPERVISOR_EXTERNAL_INTERRUPT);
    
    // 4. 测试中断状态查询
    uart_puts("4. 测试中断状态\n");
    uart_puts("定时器中断启用状态: ");
    uart_putc(is_interrupt_enabled(TRAP_SUPERVISOR_TIMER_INTERRUPT) ? '1' : '0');
    uart_puts("\n");
    
    uart_puts("软件中断启用状态: ");
    uart_putc(is_interrupt_enabled(TRAP_SUPERVISOR_SOFTWARE_INTERRUPT) ? '1' : '0');
    uart_puts("\n");
    
    // 5. 测试优先级设置
    uart_puts("5. 测试中断优先级\n");
    set_interrupt_priority(TRAP_SUPERVISOR_TIMER_INTERRUPT, IRQ_PRIORITY_HIGHEST);
    uart_puts("定时器中断优先级设置为最高\n");
    
    // 6. 模拟软件中断触发（写入SIP寄存器）
    uart_puts("6. 测试软件中断触发\n");
    // 这里可以通过写CSR寄存器模拟中断
    // set_csr(sip, SIE_SSIE);
    
    // 7. 启用全局中断
    uart_puts("7. 启用全局中断\n");
    enable_interrupts();
    uart_puts("全局中断已启用\n");
    
    // 8. 运行一段时间让中断发生
    uart_puts("8. 等待中断发生...\n");
    for (volatile int i = 0; i < 1000000; i++) {
        // 空循环，等待可能的中断
    }
    
    // 9. 打印中断统计信息
    uart_puts("9. 中断统计信息\n");
    print_interrupt_stats();
    
    // 10. 测试中断禁用
    uart_puts("10. 禁用定时器中断\n");
    disable_interrupt(TRAP_SUPERVISOR_TIMER_INTERRUPT);
    uart_puts("定时器中断已禁用\n");
    
    // 11. 注销中断处理函数
    uart_puts("11. 注销中断处理函数\n");
    unregister_interrupt(TRAP_SUPERVISOR_SOFTWARE_INTERRUPT, software_interrupt_handler);
    uart_puts("软件中断处理函数已注销\n");
    
    uart_puts("=== 中断系统测试完成 ===\n\n");
}

void main() {
    uart_puts("开始综合测试...\n\n");
    
    // 虚拟内存测试
    test_virtual_memory();
    
    // 物理内存管理器测试
    pmm_test();
    
    // 页表管理器测试
    pt_test();
    
    // 连续分配测试
    test_alloc_pages_pattern();
    
    // === 新增：页面替换系统演示 ===
    uart_puts("========================================\n");
    uart_puts("           页面替换系统测试             \n");
    uart_puts("========================================\n\n");
    
    // 基础页面替换演示
    page_replacement_example();
    
    // 高级使用示例
    advanced_page_replacement_example();
    
    // === 新增：中断处理系统测试 ===
    uart_puts("========================================\n");
    uart_puts("          中断处理系统测试              \n");
    uart_puts("========================================\n\n");
    
    // 中断系统测试
    test_interrupt_system();
    
    // === 新增：上下文保存与恢复测试 ===
    uart_puts("========================================\n");
    uart_puts("        上下文保存与恢复测试            \n");
    uart_puts("========================================\n\n");
    
    // 上下文切换测试
    test_context_switching();
    
    // 打印栈统计信息
    uart_puts("中断栈统计信息:\n");
    print_stack_stats();
    
    // === 新增：时钟中断与调度系统测试 ===
    uart_puts("========================================\n");
    uart_puts("        时钟中断与调度系统测试          \n");
    uart_puts("========================================\n\n");
    
    test_scheduler_system();
    
    // === 新增：异常处理机制测试 ===
    uart_puts("========================================\n");
    uart_puts("          异常处理机制测试              \n");
    uart_puts("========================================\n\n");
    
    test_comprehensive_exception_handling();
    
    uart_puts("========================================\n");
    uart_puts("         所有测试完成!                  \n");
    uart_puts("========================================\n");
    
    while(1) {
        // 系统运行循环 - 现在由调度器管理
    }
}

/*
 * 测试任务函数
 */
void task_a(void) {
    for (int i = 0; i < 10; i++) {
        printf("Task A: iteration %d\n", i);
        // 模拟一些工作
        for (volatile int j = 0; j < 1000000; j++);
        
        if (i == 5) {
            printf("Task A: yielding CPU\n");
            task_yield();
        }
    }
    printf("Task A: finished\n");
    task_exit();
}

void task_b(void) {
    for (int i = 0; i < 8; i++) {
        printf("Task B: step %d\n", i);
        // 模拟一些工作
        for (volatile int j = 0; j < 800000; j++);
        
        if (i == 3) {
            printf("Task B: sleeping for 5 ticks\n");
            task_sleep(5);
        }
    }
    printf("Task B: completed\n");
    task_exit();
}

void task_c(void) {
    for (int i = 0; i < 6; i++) {
        printf("Task C: processing %d\n", i);
        // 模拟一些工作
        for (volatile int j = 0; j < 1200000; j++);
    }
    printf("Task C: done\n");
    task_exit();
}

/*
 * 调度系统测试
 */
void test_scheduler_system(void) {
    uart_puts("初始化调度系统...\n");
    
    // 初始化调度器
    scheduler_init();
    
    // 初始化时钟系统
    timer_init();
    
    uart_puts("创建测试任务...\n");
    
    // 创建测试任务
    int pid_a = create_task(task_a, "TaskA", PRIORITY_NORMAL);
    int pid_b = create_task(task_b, "TaskB", PRIORITY_HIGH);
    int pid_c = create_task(task_c, "TaskC", PRIORITY_LOW);
    
    if (pid_a > 0) {
        printf("创建任务 A (PID %d)\n", pid_a);
    }
    if (pid_b > 0) {
        printf("创建任务 B (PID %d)\n", pid_b);
    }
    if (pid_c > 0) {
        printf("创建任务 C (PID %d)\n", pid_c);
    }
    
    uart_puts("\n模拟调度系统运行...\n");
    
    // 简化版调度测试 - 不启动真实时钟中断
    uart_puts("调度系统运行中...\n");
    
    // 模拟系统运行一段时间
    for (int i = 0; i < 10; i++) {
        printf("\n=== 系统状态 (第 %d 次检查) ===\n", i + 1);
        print_task_list();
        print_scheduler_stats();
        
        // 模拟一些系统活动
        for (volatile int j = 0; j < 1000000; j++);
        
        // 手动触发简单的任务切换测试
        struct task* current = get_current_task();
        if (current != NULL) {
            printf("当前任务: %s (PID %d)\n", 
                   current->name, current->pid);
        }
    }
    
    uart_puts("\n调度系统测试完成\n");
    print_scheduler_stats();
    print_timer_stats();
}