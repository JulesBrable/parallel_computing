#include <iostream>
#include <vector>
#include <cmath>
#include <omp.h>

using namespace std;

using FloatMatrix = vector<vector<float>>;

// fuse (A * B)^T and compute it in parallel
FloatMatrix transmul(const FloatMatrix& A, const FloatMatrix& B) {
    size_t aRows = A.size();
    size_t aCols = A[0].size();
    size_t bCols = B[0].size();
    FloatMatrix res(bCols, vector<float>(aRows, 0.0f));

    #pragma omp parallel for collapse(2) // parallel instruction
    for (size_t i = 0; i < aRows; ++i) {
        for (size_t k = 0; k < aCols; ++k) {
            for (size_t j = 0; j < bCols; ++j) {
                res[j][i] += A[i][k] * B[k][j];
            }
        }
    }

    return res;
}
