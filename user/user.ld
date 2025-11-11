SECTIONS
{
  /* start at 0 */
  . = 0;
  .text : {
    *(.text .text.*)
  }
  . = ALIGN(0x1000);
  .rodata : {
    *(.rodata .rodata.*)
  }
  . = ALIGN(0x1000);
  .data : {
    *(.data .data.*)
  }
  . = ALIGN(0x1000);
  .bss : {
    *(.bss .bss.*)
  }
  . = ALIGN(0x1000);
  _end = .;
}
