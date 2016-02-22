cdef extern from "squaring.h":
    long c_square "square" (long x)

cpdef long square(long x):
    return c_square(x)

