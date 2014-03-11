cimport pyspejd.dlfcn as dlfcn

cdef void* handle = dlfcn.dlopen("libmpi.so", dlfcn.RTLD_NOW | dlfcn.RTLD_LAZY | dlfcn.RTLD_GLOBAL)
if(not handle):
    raise RuntimeError("Could not load perl: %s" % dlfcn.dlerror())