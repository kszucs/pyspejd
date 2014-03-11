from libcpp.vector cimport vector
from libcpp.string cimport string
from libspejd cimport spejd, create_instance

import os

cdef class Spejd:
    """Wrapper class for libspejd."""

    cdef spejd *thisptr

    def __cinit__(self, config=False):
        self.thisptr = create_instance()
        if config:
            self.load_config_file(config)
            self.commit_config()

    def __dealloc__(self):
        del self.thisptr

    def load_config_file(self, config):
        self.thisptr.load_config_file(config)

    def config_get(self, key):
        return self.thisptr.config_get(key)

    def config_set(self, key, value):
        self.thisptr.config_set(key, value)

    def commit_config(self):
        self.thisptr.commit_config()

    def collect_config(self):
        self.thisptr.collect_config()

    def process_data(self, data):
        return self.thisptr.process_data(data)

    def process_files(self, path):
        if isinstance(path, basestring):
            if os.path.exists(path):
                path = [path]
            else:
                raise IOError('File not found @ {0}'.format(path))
        elif isinstance(path, list):
            for p in path:
                if not os.path.exists(p):
                    raise IOError('File not found @ {0}'.format(p))
        else:
            raise TypeError('Invalid type. List or basestring expected, got {0}.'.format(type(path)))
        cdef vector[string] cpp_path = path
        self.thisptr.process_files(cpp_path)

    def get_final_report(self):
        return self.thisptr.get_final_report()
