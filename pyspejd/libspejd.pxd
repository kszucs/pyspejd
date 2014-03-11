from libcpp.string cimport string
from libcpp.vector cimport vector

cdef extern from "spejd.h" namespace "libspejd":
    cdef cppclass spejd:
        void load_config_file(string) except +
        void config_set(string, string) except +
        string config_get(string) except +
        void commit_config() except +
        void collect_config() except +
        void reset_stats() except +
        string get_final_report() except +
        void process_files(vector[string])
        string process_data(string) except +

cdef extern from "spejd.h" namespace "libspejd::spejd":
    spejd *create_instance()
