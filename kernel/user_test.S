#
# user_test.S - 用户态测试代码
# 这段代码将被映射到用户空间并执行
#

.section .text
.align 4

# 测试函数1: 调用 sys_getpid (系统调用号 11)
.global user_test_getpid
user_test_getpid:
    # 立即执行 ecall，不做其他操作
    li a7, 11           # SYS_getpid = 11
    ecall               # 触发系统调用
    
    # 如果到达这里，说明 ecall 返回了
    # 写 'U' 到 UART 表示 ecall 成功返回
    li t0, 0x10000000
    li t1, 85  # 'U'
    sb t1, 0(t0)
    
    # 写 'K' 表示完成
    li t1, 75  # 'K'
    sb t1, 0(t0)
    
    # 使用 ebreak 来停止执行（会触发 breakpoint 异常）
    ebreak

# 测试函数2: 调用 sys_uptime (系统调用号 14)
.global user_test_uptime
user_test_uptime:
    li a7, 14           # SYS_uptime = 14
    ecall
    j user_test_uptime

# 测试函数3: 调用 sys_sbrk 带参数 (系统调用号 12)
.global user_test_sbrk
user_test_sbrk:
    li a7, 12           # SYS_sbrk = 12
    li a0, 1024         # 参数: 增加 1024 字节
    ecall
    j user_test_sbrk

# 测试函数4: 无效的系统调用号
.global user_test_invalid
user_test_invalid:
    li a7, 999          # 无效的系统调用号
    ecall
    j user_test_invalid

# 测试函数的结束标记
.global user_test_end
user_test_end:
    nop
