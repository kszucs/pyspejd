from libcpp.string cimport string
from libcpp.vector cimport vector


cdef extern from "<iostream>" namespace "std":
    cdef cppclass ostream:
        pass

    extern ostream cout
    extern ostream cerr


# cdef extern from "<iostream>" namespace "std" nogil:
#     cdef cppclass istream:
#         istream() except +
#         istream& read (char* s, int n) except +

#     cdef cppclass ostream:
#         ostream() except +
#         ostream& write (char* s, int n) except +


cdef extern from "spejd.h" namespace "libspejd":
    cdef cppclass spejd:
        void set_out_stream(ostream*)
        void set_err_stream(ostream*)
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
