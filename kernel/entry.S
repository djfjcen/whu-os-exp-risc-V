# 这段代码会被 kernel.ld 加载到 0x80000000 处并执行
.section .text

.global _entry
_entry:
        # stack0 定义于 start.c 的 __attribute__ ((aligned (16))) char stack0[4096 * NCPU];
        # 它保证了栈的基址足够为多核预留足够的空间（4KB/hart）
        # 从 main 函数开始，使用栈时向低位延伸

        # 考虑到我的程序是单核的，直接将栈顶 sp 设置为栈的最高地址即可
        la sp, stack0
        li a0, 1024*4
        add sp, sp, a0

        # 清零 BSS 段，更简单的方法应该是在 start 函数中清零
        # la a0, _bss_start
        # la a1, _bss_end

        # bss_clear:
        #         beq a0, a1, bss_done 

        #         # 用零寄存器刷掉 4B 的内存
        #         sw zero, 0(a0)

        #         addi a0, a0, 4      
        #         j bss_clear 
        
        # bss_done:

        # 跳转到 start 函数
        call start

# 防止 start 后意外侵入其他代码，在此自旋
# 理论上来说 _entry 是单独提出的，所以 _entry 的 .text 段后面不是 spin
spin:
        j spin