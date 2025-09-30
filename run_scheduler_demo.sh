#!/bin/bash

echo "启动RISC-V操作系统调度系统演示..."
echo "========================================="
echo

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
    -d int,mmu,cpu_reset \
    -D qemu.log 2>&1 | tee run.log

echo
echo "系统运行日志已保存到 run.log"
echo "QEMU调试日志已保存到 qemu.log"