#ifndef _FILE_H_
#define _FILE_H_

#include "defs.h"

enum EnumFileType {
    FILE_NONE,
    FILE_PIPE,
    FILE_INODE
};

struct File {
    enum EnumFileType type;
    int readable;
    int writable;

    // TODO: 暂时直接存储文件内容
    u64 size;
    char* data;
};

struct File* alloc_file();
void close_file( struct File* f );
struct File* duplicate_file( struct File* f );
int read_file( struct File* f, addr_t addr, u64 len, u64 offset );
int write_file( struct File* f, addr_t addr, u64 len, u64 offset );

#endif // !_FILE_H_