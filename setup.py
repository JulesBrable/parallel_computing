import os
from distutils.extension import Extension
from distutils.core import setup
from Cython.Build import cythonize

include_dir = os.environ.get('CPLUS_INCLUDE_PATH', '/usr/include/c++/11/')

extensions = [
    Extension("libtransmul",
              sources=["interface.pyx"],
              include_dirs=[include_dir],
              # use OpenMP for parallel programming in C++
              extra_compile_args=["-fopenmp"],
              extra_link_args=["-fopenmp"],
              language="c++")
]

setup(
    ext_modules=cythonize(extensions)
)
