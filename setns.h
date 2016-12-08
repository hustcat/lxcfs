// Use raw setns syscall for versions of glibc that don't include it (namely glibc-2.12)
#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 14
#include <sched.h>
#include "syscall.h"
#define _GNU_SOURCE
#include <sched.h>
#include "syscall.h"
#ifdef SYS_setns
int setns(int fd, int nstype)
{
    return syscall(__SYS_setns, fd, nstype);
}
#elif __NR_setns
int setns(int fd, int nstype)
{
    return syscall(__NR_setns, fd, nstype);
}
#endif
#endif
