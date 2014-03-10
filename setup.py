__version__ = '1.4.0b'

from distutils.core import setup
from distutils.extension import Extension
import os

try:
    from Cython.Distutils import build_ext
except ImportError:
    use_cython = False
else:
    use_cython = True

cmdclass = {}
ext_modules = []

if use_cython:
    ext_modules += [
        Extension('pyspejd', ['spejd.pyx'], libraries=['spejd', 'mpi'], language='c++')
    ]
    cmdclass.update({'build_ext': build_ext})
else:
    ext_modules += [
        Extension('pyspejd', ['spejd.cpp'], libraries=['spejd', 'mpi'], language='c++')
    ]

os.environ["CC"] = 'mpicxx'

setup(
    name='pyspejd',
    version = __version__,
    cmdclass = cmdclass,
    ext_modules=ext_modules,
)
