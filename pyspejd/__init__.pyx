from ctypes import *
cimport pyspejd.libspejd as libspejd
include "spejd.pyx"

mpi = CDLL('libmpi.so', RTLD_GLOBAL)
f = pythonapi.Py_GetArgcArgv
argc = c_int()
argv = POINTER(c_char_p)()
f(byref(argc), byref(argv))
mpi.MPI_Init(byref(argc), byref(argv))
mpi.MPI_Finalize()
