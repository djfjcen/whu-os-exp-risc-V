TARGET := kernel.elf
CC := riscv64-unknown-elf-gcc
AS := riscv64-unknown-elf-as
LD := riscv64-unknown-elf-ld
OBJCOPY := riscv64-unknown-elf-objcopy
OBJDUMP := riscv64-unknown-elf-objdump

CFLAGS = -Wall -O2 -ffreestanding -nostdlib -nostartfiles -march=rv64g -mabi=lp64d -mcmodel=medany
LDFLAGS = -T kernel/kernel.ld

INCLUDES = -I include

# 源文件
ASM_SRCS = $(wildcard kernel/boot/*.S)
C_SRCS = $(wildcard kernel/*.c)

# 目标文件
ASM_OBJS = $(ASM_SRCS:.S=.o)
C_OBJS = $(C_SRCS:.c=.o)
OBJS = $(ASM_OBJS) $(C_OBJS)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^
	$(OBJDUMP) -S $@ > kernel.asm
	$(OBJDUMP) -t $@ | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > kernel.sym

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<

%.o: %.S
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<

run: $(TARGET)
	qemu-system-riscv64 -machine virt -nographic -bios none -kernel $(TARGET)

qemu: run

clean:
	rm -f $(OBJS) $(TARGET) kernel.asm kernel.sym

.PHONY: all clean run qemu
