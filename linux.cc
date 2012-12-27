// linux syscalls

#include "debug.hh"
#include <boost/format.hpp>

#define _GNU_SOURCE
#include <unistd.h>
#include <linux/unistd.h>

long gettid()
{
    return 0; // FIXME
}

long syscall(long number, ...)
{
    switch (number) {
    case __NR_gettid: return gettid();
    }

    debug(fmt("unimplemented syscall %d") % number);
    abort();
}
