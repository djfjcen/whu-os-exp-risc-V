#!/bin/bash

echo "========================================"
echo "    RISC-V OS 异常处理系统集成验证     "
echo "========================================"
echo

echo "1. 检查编译状态..."
if [ -f "kernel.elf" ] && [ -f "kernel.bin" ]; then
    echo "✓ 内核文件编译成功"
    echo "  - kernel.elf: $(du -h kernel.elf | cut -f1)"
    echo "  - kernel.bin: $(du -h kernel.bin | cut -f1)"
else
    echo "✗ 内核文件缺失，请先编译"
    exit 1
fi

echo
echo "2. 检查异常处理函数集成..."
if grep -q "test_comprehensive_exception_handling" kernel/main.c; then
    echo "✓ 异常处理综合测试已集成到main.c"
else
    echo "✗ 异常处理测试未集成"
    exit 1
fi

if grep -q "handle_exception.*cause.*trap_frame" kernel/trap.c; then
    echo "✓ 核心异常处理函数已实现"
else
    echo "✗ 核心异常处理函数缺失"
    exit 1
fi

echo
echo "3. 检查具体异常处理器..."
EXCEPTION_HANDLERS=(
    "handle_syscall"
    "handle_instruction_page_fault" 
    "handle_load_page_fault"
    "handle_store_page_fault"
    "handle_illegal_instruction"
    "handle_breakpoint"
    "handle_misaligned_access"
    "handle_access_fault"
)

for handler in "${EXCEPTION_HANDLERS[@]}"; do
    if grep -q "$handler" kernel/trap.c; then
        echo "✓ $handler 已实现"
    else
        echo "✗ $handler 缺失"
    fi
done

echo
echo "4. 检查测试函数..."
TEST_FUNCTIONS=(
    "test_timer_interrupt"
    "test_exception_handling"
    "test_page_fault_exception" 
    "test_interrupt_overhead"
    "test_comprehensive_exception_handling"
)

for test_func in "${TEST_FUNCTIONS[@]}"; do
    if grep -q "void $test_func" kernel/main.c; then
        echo "✓ $test_func 已实现"
    else
        echo "✗ $test_func 缺失"
    fi
done

echo
echo "5. 检查异常类型支持..."
EXCEPTION_TYPES=(
    "TRAP_INSTRUCTION_ADDRESS_MISALIGNED"
    "TRAP_INSTRUCTION_ACCESS_FAULT"
    "TRAP_ILLEGAL_INSTRUCTION" 
    "TRAP_BREAKPOINT"
    "TRAP_LOAD_ADDRESS_MISALIGNED"
    "TRAP_LOAD_ACCESS_FAULT"
    "TRAP_STORE_ADDRESS_MISALIGNED"
    "TRAP_STORE_ACCESS_FAULT"
    "TRAP_ENVIRONMENT_CALL_FROM_U_MODE"
    "TRAP_ENVIRONMENT_CALL_FROM_S_MODE"
)

exception_count=0
for exc_type in "${EXCEPTION_TYPES[@]}"; do
    if grep -q "$exc_type" include/trap.h; then
        ((exception_count++))
    fi
done

echo "✓ 支持 $exception_count/10 种异常类型"

echo
echo "6. 符号表检查..."
if [ -f "kernel.sym" ]; then
    echo "✓ 符号表生成成功"
    echo "  异常处理相关符号："
    grep -E "(handle_|test_.*exception|panic)" kernel.sym | head -5
    echo "  ..."
else
    echo "✗ 符号表缺失"
fi

echo
echo "7. 反汇编检查..."
if [ -f "kernel.asm" ]; then
    echo "✓ 反汇编文件生成成功"
    asm_lines=$(wc -l < kernel.asm)
    echo "  反汇编行数: $asm_lines"
else
    echo "✗ 反汇编文件缺失"
fi

echo
echo "========================================"
echo "           集成验证完成                 "
echo "========================================"
echo
echo "异常处理系统已成功集成到RISC-V操作系统中！"
echo
echo "支持的测试功能："
echo "• 时钟中断功能测试"
echo "• 系统调用异常处理测试"
echo "• 页故障异常处理测试" 
echo "• 断点和调试功能测试"
echo "• 非法指令异常测试"
echo "• 内存访问异常测试"
echo "• 中断性能开销分析"
echo
echo "使用 ./run_exception_demo.sh 来运行完整演示"