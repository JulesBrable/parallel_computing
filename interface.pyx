from libcpp.vector cimport vector
from libc.math cimport exp

from cython.parallel import prange
import cython

import numpy as np


ctypedef vector[float] FloatVector
ctypedef vector[FloatVector] FloatMatrix


cdef extern from "kernel_fusion.cpp":
    FloatMatrix transmul(const FloatMatrix& A, const FloatMatrix& B)


def compute_transmul_cpp(FloatMatrix A, FloatMatrix B) -> FloatMatrix:
    cdef FloatMatrix res = transmul(A, B)
    return res


@cython.boundscheck(False)
@cython.wraparound(False)
cdef float[:, :] transmul_cython(float[:, :] A, float[:, :] B):
    cdef int aRows = A.shape[0]
    cdef int aCols = A.shape[1]
    cdef int bCols = B.shape[1]
    cdef float[:, :] res = np.zeros((bCols, aRows), dtype=np.float32)
    
    cdef int i, j, k
    cdef float tmp

    for j in prange(bCols, nogil=True):
        for i in range(aRows):
            for k in range(aCols):
                res[j, i] += A[i, k] * B[k, j]

    return res


def compute_transmul_cython(A, B):
    return transmul_cython(A, B)