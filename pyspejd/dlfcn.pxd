cdef extern from "dlfcn.h":
    void *dlopen(const char *filename, int flag)
    int dlclose(void *handle)
    int RTLD_GLOBAL
    int RTLD_LAZY
    int RTLD_NOW