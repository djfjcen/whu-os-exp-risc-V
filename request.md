

-----

### [cite\_start]实验7：文件系统 [cite: 951]

[cite\_start]**实验目标** [cite: 951]
[cite\_start]通过深入分析xv6文件系统，理解文件系统核心概念和实现原理，独立实现一个最小的文件系统。 [cite: 951]

[cite\_start]**核心学习资料** [cite: 951]

[cite\_start]**文件系统理论基础** [cite: 951]

  * [cite\_start]操作系统概念 第11-13章：大容量存储器结构、文件系统接口、文件系统实现 [cite: 951]
  * [cite\_start]xv6手册 第8章：文件系统 [cite: 951]

[cite\_start]**xv6文件系统源码分析** [cite: 952]

  * [cite\_start]**`kernel/fs.h`** - 文件系统结构定义 [cite: 952]
      * [cite\_start]重点：超级块、inode、目录项的格式 [cite: 952]
  * [cite\_start]**`kernel/fs.c`** - 文件系统核心实现 [cite: 952]
      * [cite\_start]重点函数：`ialloc()`、`iget()`、`iput()`、`namei()` [cite: 952]
  * [cite\_start]**`kernel/file.c`** - 文件描述符管理 [cite: 952]
      * [cite\_start]重点：打开文件表、文件描述符分配 [cite: 952]
  * [cite\_start]**`kernel/log.c`** - 日志系统实现 [cite: 952]
      * [cite\_start]重点：事务处理、崩溃恢复、写前日志 [cite: 952]
  * [cite\_start]**`kernel/bio.c`** - 块缓存管理 [cite: 952]
      * [cite\_start]重点：缓存策略、磁盘I/O调度 [cite: 952]

[cite\_start]**磁盘和存储** [cite: 952]

  * [cite\_start]理解磁盘结构：扇区、柱面、磁头 [cite: 952]
  * [cite\_start]QEMU磁盘模拟：`virtio-blk`设备的使用 [cite: 952]

-----

### 任务列表

#### [cite\_start]任务1：理解xv6文件系统布局 [cite: 952]

[cite\_start]**学习重点：** [cite: 952]

1.  [cite\_start]**分析磁盘布局结构：** [cite: 952, 953]
    | `boot` | `super` | `log` | `inode blocks` | `bitmap` | `data blocks` |
    | :---: | :---: | :---: | :---: | :---: | :---: |
    | 1 | 0 | 1 | 2-? | ?-? | ?-end |
      * [cite\_start]每个区域的作用是什么？ [cite: 954]
      * [cite\_start]为什么要这样组织？ [cite: 954]
      * [cite\_start]各区域的大小如何确定？ [cite: 954]
2.  [cite\_start]**理解超级块（superblock）的作用：** [cite: 954]
    ```c
    struct superblock {
      uint magic;     [cite_start]// 文件系统魔数 [cite: 954, 955]
      uint size;      [cite_start]// 文件系统大小（块数） [cite: 955]
      uint nblocks;   [cite_start]// 数据块数量 [cite: 955]
      uint ninodes;   [cite_start]// inode数量 [cite: 955]
      uint nlog;      [cite_start]// 日志块数量 [cite: 955]
      uint logstart;  [cite_start]// 日志起始块号 [cite: 955, 956]
      uint inodestart; [cite_start]// inode区起始块号 [cite: 956]
      uint bmapstart; [cite_start]// 位图起始块号 [cite: 956]
    };
    ```
      * [cite\_start]为什么需要这些元数据？ [cite: 954]
      * [cite\_start]如何确保超级块的一致性？ [cite: 956]
3.  [cite\_start]**深入理解inode结构：** [cite: 956]
      * [cite\_start]直接块和间接块的设计思路 [cite: 956]
      * [cite\_start]如何支持大文件？ [cite: 956]
      * [cite\_start]硬链接机制的实现 [cite: 956]

[cite\_start]**深入思考：** [cite: 956]

  * [cite\_start]为什么选择这种简单的布局？ [cite: 956]
  * [cite\_start]如何提高空间利用率？ [cite: 956]
  * [cite\_start]现代文件系统有什么改进？ [cite: 956]

#### [cite\_start]任务2：分析xv6的inode管理机制 [cite: 956]

[cite\_start]**代码阅读指导：** [cite: 956]

1.  [cite\_start]**研读inode缓存管理：** [cite: 956]
      * [cite\_start]内存inode和磁盘inode的关系 [cite: 957]
      * [cite\_start]引用计数的作用和管理 [cite: 957]
2.  [cite\_start]**分析inode分配与释放：** [cite: 957]
      * [cite\_start]`struct inode* ialloc(uint dev, short type);` // 分配一个新inode [cite: 957]
      * [cite\_start]`void idec(struct inode *ip);` // 减少inode引用计数，如果为0则释放块 [cite: 958]
      * [cite\_start]如何找到一个空闲的inode？ [cite: 958]
      * [cite\_start]释放inode时需要清理哪些数据？ [cite: 958]
3.  [cite\_start]**理解inode块读写：** [cite: 958]
      * [cite\_start]`bmap()` 函数的作用：将文件偏移量转换为磁盘块号 [cite: 958]
      * [cite\_start]`readi()` 和 `writei()` 的实现：如何处理直接块和间接块 [cite: 958]

[cite\_start]**设计思考：** [cite: 958]

  * [cite\_start]如何优化大文件读写性能？ [cite: 958]
  * [cite\_start]如何支持稀疏文件？ [cite: 958]
  * [cite\_start]文件的所有者、权限位应该如何设计？ [cite: 958]

#### [cite\_start]任务3：实现你的inode和文件结构 [cite: 958]

[cite\_start]**核心结构设计：** [cite: 960]

```c
// 内存中的inode
struct inode {
  [cite_start]// ...字段 [cite: 966]
};

// 磁盘上的inode
struct dinode {
  short type;    [cite_start]// 文件类型 [cite: 967]
  short major;   [cite_start]// 主要设备号 [cite: 967]
  short minor;   [cite_start]// 次要设备号 [cite: 967]
  short nlink;   [cite_start]// 硬链接数 [cite: 967]
  uint size;     [cite_start]// 文件大小（字节） [cite: 967]
  uint addrs[NDIRECT + 1]; [cite_start]// 块地址 [cite: 967]
};

// 块地址数组定义
[cite_start]#define NDIRECT 12 // 直接块数量 [cite: 968]
[cite_start]#define NINDIRECT (BSIZE / sizeof(uint32_t)) // 间接块数量 [cite: 968]
[cite_start]#define MAXFILE (NDIRECT + NINDIRECT + NINDIRECT * NINDIRECT) // 最大文件块数 [cite: 969]
```

[cite\_start]**实现策略：** [cite: 969]

1.  [cite\_start]实现基本的内存inode结构 [cite: 970]
2.  [cite\_start]完善磁盘inode结构，支持直接块和一级间接块 [cite: 970]
3.  [cite\_start]实现 `ialloc()` 和 `idec()` [cite: 970]

[cite\_start]**调试检查点：** [cite: 970]

```c
// 实现inode使用情况打印
void debug_inode_usage(void) {
  printf("=== Inode Usage ===\n");
  for (int i = 0; i < NINODE; i++) {
    struct inode *ip = &icache.inode[i];
    if (ip->ref > 0) {
      printf("Inode %d: ref=%d, type=%d, size=%d\n",
             ip->inum, ip->ref, ip->type, ip->size);
    }
  }
}
```

#### [cite\_start]任务4：实现块缓存系统 [cite: 975, 976]

[cite\_start]参考xv6的`bio.c`，理解： [cite: 977]

1.  [cite\_start]**缓存结构设计：** [cite: 977]
2.  [cite\_start]**缓存管理策略：** [cite: 977]

[cite\_start]**实现挑战：** [cite: 977]

```c
// 内存中的 inode 块地址定义（可选）
uint32_t direct[12];    [cite_start]// 直接块指针 [cite: 977]
uint32_t indirect;      [cite_start]// 一级间接块 [cite: 978]
uint32_t double_indirect; [cite_start]// 二级间接块（可选） [cite: 978]
// ...
struct buf {
  int valid;           [cite_start]// 缓存是否有效 [cite: 979]
  int disk;            [cite_start]// 是否需要写回磁盘 [cite: 979]
  uint dev;            [cite_start]// 设备号 [cite: 979]
  uint blockno;        [cite_start]// 块号 [cite: 979]
  struct sleeplock lock; [cite_start]// 保护缓存内容 [cite: 979, 980]
  uint refcnt;         [cite_start]// 引用计数 [cite: 980]
  struct buf *prev, *next; [cite_start]// LRU链表 [cite: 980]
  uchar data[BSIZE];   [cite_start]// 实际数据 [cite: 980, 981]
};
struct buf* bread(uint dev, uint blockno); [cite_start]// 读取块 [cite: 981]
void bwrite(struct buf *b);               [cite_start]// 写入块 [cite: 982]
void brelse(struct buf *b);               [cite_start]// 释放块 [cite: 982]
// ...
```

[cite\_start]**你需要考虑的问题：** [cite: 978]

1.  [cite\_start]如何平衡小文件和大文件的效率？ [cite: 978]
2.  [cite\_start]是否需要扩展属性支持？ [cite: 978]
3.  [cite\_start]如何优化目录性能？ [cite: 978]
4.  [cite\_start]是否支持符号链接？ [cite: 978]
5.  [cite\_start]如何实现缓存替换策略（如LRU）？ [cite: 985]
6.  [cite\_start]如何保证缓存的一致性（脏块管理）？ [cite: 985]
7.  [cite\_start]如何处理并发访问的同步问题？ [cite: 985]

#### [cite\_start]任务5：实现目录和路径解析 [cite: 985]

[cite\_start]参考xv6的`fs.c`和`file.c`，理解： [cite: 985, 986]

1.  [cite\_start]目录和文件描述符的关系： [cite: 986]
2.  [cite\_start]路径解析的原理： [cite: 986]

[cite\_start]**实现策略：** [cite: 986]

1.  [cite\_start]实现目录项结构 [cite: 986]
2.  [cite\_start]实现目录查找、链接、删除操作 [cite: 986]
3.  [cite\_start]实现路径解析函数 [cite: 986]

[cite\_start]**理解xv6的目录机制：** [cite: 994]

  * [cite\_start]**目录项格式：** [cite: 994]
    ```c
    struct dirent {
      ushort inum;         [cite_start]// inode号，0表示空闲 [cite: 994]
      char name[DIRSIZ];   [cite_start]// 文件名 [cite: 995]
    };
    ```
  * [cite\_start]**路径解析算法：** [cite: 995]
    ```c
    static struct inode* namex(char *path, int nameiparent, char *name) {
      [cite_start]// 解析路径，返回对应的inode [cite: 995]
      [cite_start]// nameiparent=1时返回父目录inode [cite: 995]
    }
    ```
  * [cite\_start]**目录操作接口：** [cite: 995]
    ```c
    [cite_start]struct inode* dir_lookup(struct inode *dp, char *name, uint *poff); [cite: 995]
    [cite_start]int dir_link(struct inode *dp, char *name, uint inum); [cite: 995]
    [cite_start]int dir_unlink(struct inode *dp, char *name); [cite: 995]
    [cite_start]// 路径解析 [cite: 995]
    [cite_start]struct inode* path_walk(char path); [cite: 996]
    [cite_start]struct inode path_parent(char *pa th, char *name); [cite: 996]
    ```

[cite\_start]**你需要考虑的问题：** [cite: 996]

1.  [cite\_start]目录的最大大小限制 [cite: 996]
2.  [cite\_start]长文件名的支持 [cite: 996]
3.  [cite\_start]目录遍历的效率 [cite: 996]
4.  [cite\_start]硬链接和符号链接的处理 [cite: 996]

#### [cite\_start]任务6：实现文件操作与系统调用 [cite: 996]

[cite\_start]参考xv6的`sysfile.c`和`file.c`，实现： [cite: 996]

1.  [cite\_start]文件描述符分配/回收 [cite: 997]
2.  [cite\_start]文件读写操作： `read()`、`write()` [cite: 997]
3.  [cite\_start]文件打开/创建/删除： `open()`、`close()`、`unlink()` [cite: 997]

[cite\_start]**实现挑战：** [cite: 997]

  * [cite\_start]如何处理文件描述符表的并发访问？ [cite: 997]
  * [cite\_start]读写操作如何与inode块读写关联？ [cite: 997]
  * [cite\_start]如何实现文件权限检查？ [cite: 997]

-----

### 测试与调试策略

[cite\_start]**文件系统完整性测试** [cite: 997]

```c
void test_filesystem_integrity(void) {
  printf("Testing filesystem integrity…\n");
  // 创建测试文件
  int fd = open("testfile", O_CREATE | O_RDWR);
  assert(fd >= 0);
  // 写入数据
  char buffer[] = "Hello, filesystem!";
  int bytes = write(fd, buffer, strlen(buffer));
  assert(bytes == strlen(buffer));
  close(fd);
  // 重新打开并验证
  fd = open("testfile", O_RDONLY);
  assert(fd >= 0);
  
  // ...
  
  [cite_start]char read_buffer[64]; [cite: 997]
  [cite_start]bytes = read(fd, read_buffer, sizeof(read_buffer)); [cite: 997]
  [cite_start]read_buffer[bytes] = '\0'; [cite: 997]
  
  [cite_start]assert(strcmp(buffer, read_buffer) == 0); [cite: 997]
  [cite_start]close(fd); [cite: 997]
  
  [cite_start]// 删除文件 [cite: 997]
  [cite_start]assert(unlink("testfile") == 0); [cite: 997]
  
  [cite_start]printf("Filesystem integrity test passed\n"); [cite: 997]
}
```

[cite\_start]**并发访问测试** [cite: 998]

  * [cite\_start]创建多个进程 [cite: 998]
  * [cite\_start]同时对一个文件进行读写操作 [cite: 998]
  * [cite\_start]验证数据一致性 [cite: 998]

[cite\_start]**崩溃恢复测试** [cite: 1003]

```c
printf("Testing crash recovery…2 ");
// 模拟崩溃场景：
// 1. 开始大量文件操作
// 2. 在中途"崩溃"（重启系统）
// 3. 检查文件系统一致性
// 注意：这个测试需要特殊的测试框架
// 可以通过修改内核代码来模拟崩溃
```

[cite\_start]**性能测试** [cite: 1003]

```c
void test_filesystem_performance(void) {
  printf("Testing filesystem performance…\n");
  uint64 start_time = get_time();
  // 大量小文件测试
  for (int i = 0; i < 1000; i++) {
    char filename[32];
    snprintf(filename, sizeof(filename), "small_%d", i);
    int fd = open(filename, O_CREATE | O_RDWR);
    write(fd, "test", 4);
    close(fd);
  }
  uint64 small_files_time = get_time() - start_time;
  // 大文件测试
  start_time = get_time();
  int fd = open("large_file", O_CREATE | O_RDWR);
  char large_buffer[4096];
  [cite_start]for (int i = 0; i < 1024; i++) { // 4MB文件 [cite: 1004]
    write(fd, large_buffer, sizeof(large_buffer));
  }
  close(fd);
  // ...
}
```

-----