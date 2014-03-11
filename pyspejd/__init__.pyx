cimport pyspejd.dlfcn as dlfcn
cimport pyspejd.libspejd as libspejd
include "spejd.pyx"

cdef void* handle = dlfcn.dlopen("libmpi.so", dlfcn.RTLD_NOW | dlfcn.RTLD_LAZY | dlfcn.RTLD_GLOBAL)
if(not handle):
    raise RuntimeError("Could not load mpi library: %s" % dlfcn.dlerror())