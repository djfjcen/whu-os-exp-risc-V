# 工具链配置
TOOLCHAIN = riscv64-unknown-elf-
CC = $(TOOLCHAIN)gcc
LD = $(TOOLCHAIN)ld
OBJCOPY = $(TOOLCHAIN)objcopy

# 编译选项
CFLAGS = -Wall -O2 -fno-omit-frame-pointer -ggdb
CFLAGS += -march=rv64g -mabi=lp64d
CFLAGS += -mcmodel=medany -ffreestanding -nostdlib
CFLAGS += -Ikernel/

# 用户程序编译选项
USER_CFLAGS = -Wall -O2 -march=rv64g -mabi=lp64d -nostdlib -ffreestanding -Iuser/ -Ikernel/

# 源文件
KERNEL_SRCS = \
	kernel/entry.S \
	kernel/kernelvec.S \
	kernel/swtch.S \
	kernel/trampoline.S \
	kernel/start.c \
	kernel/uart.c \
	kernel/console.c \
	kernel/printf.c \
	kernel/kalloc.c \
	kernel/vm.c \
	kernel/riscv.c \
	kernel/trap.c \
	kernel/proc.c \
	kernel/syscall.c \
	kernel/kexec.c \
	kernel/userprog.c \
	kernel/bio.c \
	kernel/log.c \
	kernel/fs.c \
	kernel/file.c \
	kernel/sysfile.c

# 用户程序源文件
USER_SRCS = main.c user/usrsyscall.c

# 目标文件
OBJS = $(patsubst %.S,%.o,$(patsubst %.c,%.o,$(KERNEL_SRCS)))

# 默认目标
all: kernel.bin user_main.bin

# 编译规则
%.o: %.S
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# 默认目标 - 放在最前面
all: kernel.bin

# 用户程序编译
user/%.o: user/%.c
	$(CC) $(USER_CFLAGS) -c $< -o $@

main.o: main.c
	$(CC) $(USER_CFLAGS) -c $< -o $@

user_main.elf: main.o user/usrsyscall.o
	$(LD) -Ttext=0 -o $@ $^

user_main.bin: user_main.elf
	$(OBJCOPY) -O binary $< $@

kernel/userprog_data.h: user_main.bin
	./scripts/bin2c.sh $< $@ user_main_bin

# kernel/userprog.o 依赖生成的头文件
kernel/userprog.o: kernel/userprog.c kernel/userprog_data.h
	$(CC) $(CFLAGS) -c kernel/userprog.c -o kernel/userprog.o

# 链接内核 - 需要先生成 userprog_data.h
kernel.elf: kernel/userprog_data.h $(OBJS) kernel.ld
	$(LD) -T kernel.ld -o $@ $(OBJS)

# 生成原始二进制
kernel.bin: kernel.elf
	$(OBJCOPY) -O binary $< $@

# 清理
clean:
	rm -f kernel.elf kernel.bin $(OBJS) user_main.elf user_main.bin main.o user/usrsyscall.o

# 运行QEMU
run: kernel.bin
	qemu-system-riscv64 -machine virt -bios none \
		-kernel kernel.bin \
		-m 256M \
		-nographic