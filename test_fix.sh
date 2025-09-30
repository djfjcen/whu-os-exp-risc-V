#!/bin/bash

echo "测试修复后的RISC-V操作系统"
echo "==============================="
echo

# 使用timeout命令限制运行时间，避免无限卡住
timeout 30s qemu-system-riscv64 \
    -machine virt \
    -cpu rv64 \
    -smp 1 \
    -m 128M \
    -bios none \
    -kernel kernel.bin \
    -nographic \
    -serial mon:stdio \
    2>&1 | tee test_output.log

echo
echo "测试完成"
echo "输出日志保存在 test_output.log"
echo
echo "检查是否还有卡住的问题："
if grep -q "启动时钟中断" test_output.log; then
    if grep -q "调度系统运行中" test_output.log; then
        echo "✓ 系统成功通过时钟中断启动阶段"
    else
        echo "✗ 系统在时钟中断启动后卡住"
    fi
else
    echo "? 未检测到时钟中断启动信息"
fi

if grep -q "异常处理综合测试" test_output.log; then
    echo "✓ 异常处理测试已启动"
else
    echo "? 未检测到异常处理测试"
fi