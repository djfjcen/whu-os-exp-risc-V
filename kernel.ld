OUTPUT_ARCH("riscv")

/*
* 将 global 符号 _entry 作为 pc 的初始值
*/
ENTRY(_entry)

SECTIONS
{
  /* 将当前位置设置为 0x80000000，同样是内核的起始位置 */
  . = 0x80000000;

  .text : {
    /*
    * 将 _entry 符号提取出来作为 .text 段的第一个符号
    * 这个路径应该是相对于 Makefile 所在的目录而言的 
    */
    kernel/entry.o(_entry)

    /* 然后再存放其他符号 */
    *(.text .text.*)
    

    /* 
    * trampoline 段，放在 .text 段的最后 
    * 定义在 trampoline.S 文件中
    */
    . = ALIGN(0x1000);
    _trampoline_start = .;
    *(trampsec)

    . = ALIGN(0x1000);
    ASSERT(. - _trampoline_start == 0x1000, "error: size of trampoline does not equals to one page");
    
    PROVIDE(etext = .);
  }

  .rodata : {
    . = ALIGN(16);
    *(.srodata .srodata.*)

    . = ALIGN(16);
    *(.rodata .rodata.*)
  }

  .data : {
    . = ALIGN(16);
    *(.sdata .sdata.*)

    . = ALIGN(16);
    *(.data .data.*)
  }

  .bss : {
    /* 防止清零侵入 .data 段，先对齐后设定 sbss */
    . = ALIGN(16);
    PROVIDE(_bss_start = .);

    *(.sbss .sbss.*)

    . = ALIGN(16);
    *(.bss .bss.*)

    /* 为了方便清零 bss 段，向 16B 对齐一次 */
    . = ALIGN(16);
    PROVIDE(_bss_end = .);
  }

  PROVIDE(end = .);
}