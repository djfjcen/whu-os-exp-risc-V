#!/bin/bash

echo "启动RISC-V操作系统异常处理演示..."
echo "========================================="
echo "任务6：异常处理机制"
echo "========================================="
echo
echo "本演示将测试以下异常处理功能："
echo "1. 系统调用异常处理"
echo "2. 页故障异常处理" 
echo "3. 断点异常处理"
echo "4. 非法指令异常处理"
echo "5. 未对齐访问异常处理"
echo "6. 访问故障异常处理"
echo "7. 时钟中断功能测试"
echo "8. 中断开销性能测试"
echo
echo "启动系统..."

# 使用QEMU模拟器运行内核
qemu-system-riscv64 \
    -machine virt \
    -cpu rv64 \
    -smp 1 \
    -m 128M \
    -bios none \
    -kernel kernel.bin \
    -nographic \
    -serial mon:stdio \
    -d int,cpu_reset \
    -D qemu_exception.log 2>&1 | tee exception_demo.log

echo
echo "异常处理演示完成"
echo "系统日志已保存到 exception_demo.log"
echo "QEMU调试日志已保存到 qemu_exception.log"