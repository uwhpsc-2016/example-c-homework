cdef extern from "cubing.h":
    long c_cube "cube" (long x)


cpdef long cube(long x):
    return c_cube(x)
