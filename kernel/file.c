#include "file.h"

#define FILE_TABLE_SIZE 16
#define FILE_DATA_CAP PAGE_SIZE

static struct File file_table[FILE_TABLE_SIZE];
static char file_storage[FILE_TABLE_SIZE][FILE_DATA_CAP];
static int file_used[FILE_TABLE_SIZE];

static int file_index( struct File* f ) {
    if ( !f ) {
        return -1;
    }

    if ( f < file_table || f >= file_table + FILE_TABLE_SIZE ) {
        return -1;
    }

    return ( int ) ( f - file_table );
}

static void reset_file_slot( int idx ) {
    mem_set( ( addr_t ) &file_table[idx], 0, sizeof( struct File ) );
    mem_set( ( addr_t ) file_storage[idx], 0, FILE_DATA_CAP );

    file_table[idx].data = 0;

    file_used[idx] = 0;
}

struct File* alloc_file() {
    for ( int i = 0; i < FILE_TABLE_SIZE; i++ ) {
        if ( file_used[i] ) {
            continue;
        }

        file_used[i] = 1;

        mem_set( ( addr_t ) &file_table[i], 0, sizeof( struct File ) );

        mem_set( ( addr_t ) file_storage[i], 0, FILE_DATA_CAP );

        file_table[i].data = file_storage[i];

        return &file_table[i];
    }

    return 0;
}

void close_file( struct File* f ) {
    int idx = file_index( f );

    if ( idx < 0 ) {
        return;
    }

    reset_file_slot( idx );
}

struct File* duplicate_file( struct File* f ) {
    if ( !f ) {
        return 0;
    }

    struct File* nf = alloc_file();

    if ( !nf ) {
        return 0;
    }

    nf->type = f->type;
    nf->readable = f->readable;
    nf->writable = f->writable;
    nf->size = f->size;

    u64 copy_len = f->size;

    if ( copy_len > FILE_DATA_CAP ) {
        copy_len = FILE_DATA_CAP;
    }

    mem_move( nf->data, f->data, copy_len );

    return nf;
}

int read_file( struct File* f, addr_t addr, u64 len, u64 offset ) {
    if ( !f || !f->readable ) {
        return -1;
    }

    if ( offset >= f->size ) {
        return 0;
    }

    u64 available = f->size - offset;

    if ( len > available ) {
        len = available;
    }

    if ( len > FILE_DATA_CAP ) {
        len = FILE_DATA_CAP;
    }

    mem_move( ( void* ) addr, f->data + offset, len );

    return ( int ) len;
}

int write_file( struct File* f, addr_t addr, u64 len, u64 offset ) {
    if ( !f || !f->writable ) {
        return -1;
    }

    u64 end = offset + len;

    if ( end > FILE_DATA_CAP ) {
        return -1;
    }

    mem_move( f->data + offset, ( void* ) addr, len );

    if ( end > f->size ) {
        f->size = end;
    }

    return ( int ) len;
}

