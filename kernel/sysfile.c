#include "defs.h"
#include "file.h"
#include "fs.h"
#include "proc.h"
#include "log.h"
#include "syscall.h"

extern struct Process* curr_proc;

// 字符串比较
static int strncmp(const char *s1, const char *s2, u64 n) {
    while(n-- > 0) {
        if(*s1 != *s2)
            return (unsigned char)*s1 - (unsigned char)*s2;
        if(*s1 == 0)
            return 0;
        s1++;
        s2++;
    }
    return 0;
}

// 辅助函数：检查目录是否为空
static int isdirempty(struct inode *dp) {
    int off;
    struct dirent de;
    
    for(off = 2 * sizeof(de); off < dp->size; off += sizeof(de)) {
        if(readi(dp, 0, (u64)&de, off, sizeof(de)) != sizeof(de))
            panic("isdirempty: readi");
        if(de.inum != 0)
            return 0;
    }
    return 1;
}

// 从进程的文件描述符表中分配一个文件描述符
static int fdalloc(struct File *f) {
    int fd;
    struct Process *p = curr_proc;
    
    for(fd = 0; fd < NOFILE; fd++) {
        if(p->ofile[fd] == 0) {
            p->ofile[fd] = f;
            return fd;
        }
    }
    return -1;
}

// 从系统调用参数获取文件描述符
static int argfd(int n, int *pfd, struct File **pf) {
    int fd;
    struct File *f;
    
    argint(n, &fd);
    if(fd < 0 || fd >= NOFILE || (f = curr_proc->ofile[fd]) == 0)
        return -1;
    if(pfd)
        *pfd = fd;
    if(pf)
        *pf = f;
    return 0;
}

// 创建 inode
struct inode* create(char *path, short type, short major, short minor) {
    struct inode *ip, *dp;
    char name[DIRSIZ];
    
    if((dp = nameiparent(path, name)) == 0)
        return 0;
    
    ilock(dp);
    
    if((ip = dirlookup(dp, name, 0)) != 0) {
        iunlockput(dp);
        ilock(ip);
        if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
            return ip;
        iunlockput(ip);
        return 0;
    }
    
    if((ip = ialloc(dp->dev, type)) == 0)
        panic("create: ialloc");
    
    ilock(ip);
    ip->major = major;
    ip->minor = minor;
    ip->nlink = 1;
    iupdate(ip);
    
    if(type == T_DIR) {
        dp->nlink++;
        iupdate(dp);
        // 创建 . 和 ..
        if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
            panic("create: dots");
    }
    
    if(dirlink(dp, name, ip->inum) < 0)
        panic("create: dirlink");
    
    iunlockput(dp);
    
    return ip;
}

// sys_open - 打开文件
u64 syscall_open(void) {
    char path[128];
    int fd, omode;
    struct File *f;
    struct inode *ip;
    
    argint(1, &omode);
    
    // 从用户空间复制路径
    u64 path_ptr;
    argaddr(0, &path_ptr);
    if(copy_u2k(curr_proc->page_table, (u64)path, path_ptr, sizeof(path)) < 0)
        return -1;
    path[127] = 0;
    
    begin_op();
    
    if(omode & O_CREATE) {
        ip = create(path, T_FILE, 0, 0);
        if(ip == 0) {
            end_op();
            return -1;
        }
    } else {
        if((ip = namei(path)) == 0) {
            end_op();
            return -1;
        }
        ilock(ip);
        if(ip->type == T_DIR && omode != O_RDONLY) {
            iunlockput(ip);
            end_op();
            return -1;
        }
    }
    
    if((f = alloc_file()) == 0) {
        iunlockput(ip);
        end_op();
        return -1;
    }
    
    if((fd = fdalloc(f)) < 0) {
        file_close(f);
        iunlockput(ip);
        end_op();
        return -1;
    }
    
    if(ip->type == T_DEVICE) {
        f->type = FILE_DEVICE;
        f->major = ip->major;
    } else {
        f->type = FILE_INODE;
        f->off = 0;
    }
    f->ip = ip;
    f->readable = !(omode & O_WRONLY);
    f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    f->append = !!(omode & O_APPEND);  // 转换为布尔值
    
    iunlock(ip);
    end_op();
    
    return fd;
}

// sys_close - 关闭文件
u64 syscall_close(void) {
    int fd;
    struct File *f;
    
    if(argfd(0, &fd, &f) < 0)
        return -1;
    curr_proc->ofile[fd] = 0;
    file_close(f);
    return 0;
}

// sys_read - 读取文件
u64 syscall_read(void) {
    struct File *f;
    int n;
    u64 p;
    
    if(argfd(0, 0, &f) < 0)
        return -1;
    argint(2, &n);
    argaddr(1, &p);
    
    return file_read(f, p, n);
}

// sys_write - 写入文件
u64 syscall_write(void) {
    struct File *f;
    int n;
    u64 p;
    
    if(argfd(0, 0, &f) < 0)
        return -1;
    argint(2, &n);
    argaddr(1, &p);
    
    return file_write(f, p, n);
}

// sys_mkdir - 创建目录
u64 syscall_mkdir(void) {
    char path[128];
    struct inode *ip;
    
    u64 path_ptr;
    argaddr(0, &path_ptr);
    if(copy_u2k(curr_proc->page_table, (u64)path, path_ptr, sizeof(path)) < 0)
        return -1;
    path[127] = 0;
    
    begin_op();
    if((ip = create(path, T_DIR, 0, 0)) == 0) {
        end_op();
        return -1;
    }
    iunlockput(ip);
    end_op();
    
    return 0;
}

// sys_unlink - 删除文件
u64 syscall_unlink(void) {
    char path[128];
    struct inode *ip, *dp;
    struct dirent de;
    char name[DIRSIZ];
    u64 off;
    
    u64 path_ptr;
    argaddr(0, &path_ptr);
    if(copy_u2k(curr_proc->page_table, (u64)path, path_ptr, sizeof(path)) < 0)
        return -1;
    path[127] = 0;
    
    begin_op();
    
    if((dp = nameiparent(path, name)) == 0) {
        end_op();
        return -1;
    }
    
    ilock(dp);
    
    // 不能删除 . 和 ..
    if(strncmp(name, ".", DIRSIZ) == 0 || strncmp(name, "..", DIRSIZ) == 0) {
        iunlockput(dp);
        end_op();
        return -1;
    }
    
    if((ip = dirlookup(dp, name, &off)) == 0) {
        iunlockput(dp);
        end_op();
        return -1;
    }
    ilock(ip);
    
    if(ip->nlink < 1)
        panic("unlink: nlink < 1");
    
    if(ip->type == T_DIR && !isdirempty(ip)) {
        iunlockput(ip);
        iunlockput(dp);
        end_op();
        return -1;
    }
    
    mem_set((u64)&de, 0, sizeof(de));
    if(writei(dp, 0, (u64)&de, off, sizeof(de)) != sizeof(de))
        panic("unlink: writei");
    if(ip->type == T_DIR) {
        dp->nlink--;
        iupdate(dp);
    }
    iunlockput(dp);
    
    ip->nlink--;
    iupdate(ip);
    iunlockput(ip);
    
    end_op();
    
    return 0;
}

// fstat - 获取打开文件的stat信息
u64 syscall_fstat(void) {
    struct File *f;
    u64 st_addr;
    struct stat st;
    int fd;
    
    argint(0, &fd);
    argaddr(1, &st_addr);
    
    if(fd < 0 || fd >= NOFILE || (f = curr_proc->ofile[fd]) == 0)
        return -1;
    
    if(f->type != FILE_INODE)
        return -1;
    
    ilock(f->ip);
    stati(f->ip, &st);
    iunlock(f->ip);
    
    if(copy_k2u(curr_proc->page_table, (addr_t)st_addr, (addr_t)&st, sizeof(st)) < 0)
        return -1;
    
    return 0;
}

// dup - 复制文件描述符
u64 syscall_dup(void) {
    struct File *f;
    int fd, newfd;
    
    argint(0, &fd);
    
    if(fd < 0 || fd >= NOFILE || (f = curr_proc->ofile[fd]) == 0)
        return -1;
    
    if((newfd = fdalloc(f)) < 0)
        return -1;
    
    file_dup(f);
    return newfd;
}

// link - 创建硬链接
u64 syscall_link(void) {
    char oldpath[128], newpath[128], name[DIRSIZ];
    struct inode *ip, *dp;
    u64 oldpath_ptr, newpath_ptr;
    
    argaddr(0, &oldpath_ptr);
    argaddr(1, &newpath_ptr);
    
    if(copy_u2k(curr_proc->page_table, (addr_t)oldpath, (addr_t)oldpath_ptr, sizeof(oldpath)) < 0)
        return -1;
    if(copy_u2k(curr_proc->page_table, (addr_t)newpath, (addr_t)newpath_ptr, sizeof(newpath)) < 0)
        return -1;
    
    oldpath[127] = 0;
    newpath[127] = 0;
    
    begin_op();
    
    if((ip = namei(oldpath)) == 0) {
        end_op();
        return -1;
    }
    
    ilock(ip);
    
    if(ip->type == T_DIR) {
        iunlockput(ip);
        end_op();
        return -1;
    }
    
    ip->nlink++;
    iupdate(ip);
    iunlock(ip);
    
    if((dp = nameiparent(newpath, name)) == 0)
        goto bad;
    
    ilock(dp);
    
    if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0) {
        iunlockput(dp);
        goto bad;
    }
    
    iunlockput(dp);
    iput(ip);
    
    end_op();
    return 0;

bad:
    ilock(ip);
    ip->nlink--;
    iupdate(ip);
    iunlockput(ip);
    end_op();
    return -1;
}

