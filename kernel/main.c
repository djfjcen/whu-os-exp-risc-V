#include "defs.h"
#include "uart.h"
#include <stdarg.h>


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
    
    uart_puts("========================================\n");
    uart_puts("         所有测试完成!                  \n");
    uart_puts("========================================\n");
    
    while(1) {
        // 系统运行循环
    }
}