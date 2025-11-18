# 工具链
CC = riscv64-unknown-elf-gcc
OBJDUMP = riscv64-unknown-elf-objdump
OBJCOPY = riscv64-unknown-elf-objcopy
LD = riscv64-unknown-elf-ld

# 编译选项
CFLAGS = -Wall -O2 -ffreestanding -nostdlib -nostartfiles \
         -march=rv64g -mabi=lp64d -mcmodel=medany \
         -I include

# 链接脚本
LINKER_SCRIPT = kernel/kernel.ld

# 内核目标文件
KERNEL_ELF = kernel.elf
KERNEL_BIN = kernel.bin

# 内核对象文件
KERNEL_OBJS = kernel/boot/entry.o \
              kernel/main.o \
              kernel/printf.o \
              kernel/uart.o \
              kernel/kalloc.o \
              kernel/vm.o \
              kernel/trap.o \
              kernel/proc.o \
              kernel/syscall.o \
              kernel/sysproc.o \
              kernel/machinevec.o \
              kernel/kernelvec.o \
              kernel/uservec.o \
              kernel/swtch.o

# 默认目标
.PHONY: all clean qemu

all: $(KERNEL_ELF) $(KERNEL_BIN) kernel.asm kernel.sym
	@echo "Build complete!"

# 链接内核
$(KERNEL_ELF): $(KERNEL_OBJS)
	$(LD) -T $(LINKER_SCRIPT) -o $@ $^
	@echo "Linking complete!"

# 生成二进制文件
$(KERNEL_BIN): $(KERNEL_ELF)
	$(OBJCOPY) -O binary $< $@

# 生成反汇编文件
kernel.asm: $(KERNEL_ELF)
	$(OBJDUMP) -S $< > $@

# 生成符号表
kernel.sym: $(KERNEL_ELF)
	$(OBJDUMP) -t $< | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $@

# 编译C源文件
kernel/%.o: kernel/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

# 编译汇编源文件
kernel/%.o: kernel/%.S
	$(CC) $(CFLAGS) -c -o $@ $<

kernel/boot/%.o: kernel/boot/%.S
	$(CC) $(CFLAGS) -c -o $@ $<
	@echo "Compiled $<"

# 清理
clean:
	rm -f $(KERNEL_ELF) $(KERNEL_BIN) kernel.asm kernel.sym $(KERNEL_OBJS)
	@echo "Cleanup complete!"

# 运行QEMU
qemu: all
	qemu-system-riscv64 -machine virt -nographic -bios none -kernel $(KERNEL_ELF)