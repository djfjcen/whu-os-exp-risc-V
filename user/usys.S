#include "include/syscall.h"
#include "user/user.h"

#define SYS(name) \
  .global name; \
  name: \
    li a7, SYS_##name; \
    ecall; \
    ret;

SYS(fork)
SYS(exit)
SYS(wait)
SYS(pipe)
SYS(read)
SYS(write)
SYS(close)
SYS(kill)
SYS(exec)
SYS(open)
SYS(mknod)
SYS(unlink)
SYS(fstat)
SYS(link)
SYS(mkdir)
SYS(chdir)
SYS(dup)
SYS(getpid)
SYS(sbrk)
SYS(sleep)
SYS(uptime)
