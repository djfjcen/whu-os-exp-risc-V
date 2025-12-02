#ifndef _FS_H_
#define _FS_H_

#include "defs.h"

// 文件系统基本参数
#define BSIZE 1024                  // 块大小
#define FSSIZE 1000                 // 文件系统块数
#define LOGSIZE 30                  // 日志块数
#define ROOTDEV 1                   // 根设备号
#define ROOTINO 1                   // 根目录 inode 号
#define FSMAGIC 0x10203040         // 文件系统魔数

// inode 块地址数组参数
#define NDIRECT 12                  // 直接块数量
#define NINDIRECT (BSIZE / sizeof(u64))  // 间接块数量
#define MAXFILE (NDIRECT + NINDIRECT)    // 最大文件块数

// 文件系统布局：
// [ boot block | super block | log | inode blocks | free bit map | data blocks ]

// 磁盘上的超级块结构
struct superblock {
    u64 magic;        // 魔数，用于验证文件系统
    u64 size;         // 文件系统大小（块数）
    u64 nblocks;      // 数据块数量
    u64 ninodes;      // inode 数量
    u64 nlog;         // 日志块数量
    u64 logstart;     // 日志起始块号
    u64 inodestart;   // inode 区起始块号
    u64 bmapstart;    // 位图起始块号
};

// 磁盘上的 inode 结构
struct dinode {
    short type;               // 文件类型
    short major;              // 主设备号（设备文件）
    short minor;              // 次设备号（设备文件）
    short nlink;              // 硬链接数
    u64 size;                 // 文件大小（字节）
    u64 addrs[NDIRECT + 1];   // 数据块地址数组
};

// 内存中的 inode 结构
struct inode {
    u64 dev;           // 设备号
    u64 inum;          // inode 号
    int ref;           // 引用计数
    int valid;         // inode 是否已从磁盘加载

    short type;        // 文件类型
    short major;       // 主设备号
    short minor;       // 次设备号
    short nlink;       // 硬链接数
    u64 size;          // 文件大小（字节）
    u64 addrs[NDIRECT + 1];  // 数据块地址数组
};

// 目录项结构
#define DIRSIZ 14

struct dirent {
    u64 inum;          // inode 号
    char name[DIRSIZ]; // 文件名
};

// 每个块的 inode 数量
#define IPB (BSIZE / sizeof(struct dinode))

// 计算包含 inode i 的块号
#define IBLOCK(i, sb) ((i) / IPB + sb.inodestart)

// 每个块的位图位数
#define BPB (BSIZE * 8)

// 计算包含块 b 的位图块号
#define BBLOCK(b, sb) ((b) / BPB + sb.bmapstart)

// 文件类型
#define T_DIR   1   // 目录
#define T_FILE  2   // 普通文件
#define T_DEVICE 3  // 设备

// 文件打开标志
#define O_RDONLY  0x000
#define O_WRONLY  0x001
#define O_RDWR    0x002
#define O_CREATE  0x200
#define O_TRUNC   0x400

// 文件系统函数声明
void fs_init(int dev);
int fs_alloc(u64 dev);
void fs_free(int dev, u64 b);
struct inode* ialloc(u64 dev, short type);
struct inode* iget(u64 dev, u64 inum);
struct inode* idup(struct inode *ip);
void ilock(struct inode *ip);
void iunlock(struct inode *ip);
void iput(struct inode *ip);
void iunlockput(struct inode *ip);
void iupdate(struct inode *ip);
int readi(struct inode *ip, int user_dst, u64 dst, u64 off, u64 n);
int writei(struct inode *ip, int user_src, u64 src, u64 off, u64 n);
void itrunc(struct inode *ip);
struct inode* dirlookup(struct inode *dp, char *name, u64 *poff);
int dirlink(struct inode *dp, char *name, u64 inum);
struct inode* namei(char *path);
struct inode* nameiparent(char *path, char *name);

#endif // _FS_H_
