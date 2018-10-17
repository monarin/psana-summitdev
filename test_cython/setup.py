from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import os

ext_modules = [
        Extension(
            "ex_prange",
            ["ex_prange.pyx"],
            #extra_compile_args=['-fopenmp'],
            #extra_link_args=['-fopenmp'],
            libraries = ['gomp'],
            library_dirs = [os.environ['CONDA_PREFIX']+'/lib'],
            ),
        ]

setup(
        name='example-parallel',
        ext_modules=cythonize(ext_modules),
        )

