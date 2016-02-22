from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

ext_modules = [
    Extension('example_homework.squaring',
              sources=['example_homework/squaring.pyx'],
              libraries=['squareandcube'],
              include_dirs=['include'],
              library_dirs=['lib'],
    ),
    Extension('example_homework.cubing',
              sources=['example_homework/cubing.pyx'],
              libraries=['squareandcube'],
              include_dirs=['include'],
              library_dirs=['lib'],
    )
]

setup(
    ext_modules = cythonize(ext_modules)
)
