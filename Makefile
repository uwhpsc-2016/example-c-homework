# compiler settings
CC=gcc
CFLAGS=-c -Wall -fPIC
LDFLAGS=--shared

# target
LIBTARGET=libsquareandcube.so

# directories
SRC=src
LIB=lib
INCLUDE=include

# sources
LIBSOURCES=$(SRC)/squaring.c $(SRC)/cubing.c
LIBOBJECTS=$(LIBSOURCES:.c=.o)

# cythonoutput
CYTHONLIB=example_homework
CYTHONOUTPUTC=$(CYTHONLIB)/squaring.c $(CYTHONLIB)/cubing.c
CYTHONOUTPUT=$(CYTHONOUTPUTC) $(CYTHONOUTPUTC:.c=.so)

.PHONY: all lib cython clean

default: all

all: lib cython

lib: $(LIBTARGET)

cython:
	python setup.py build_ext --inplace

$(LIBTARGET): $(LIBOBJECTS)
	$(CC) $(LDFLAGS) $(LIBOBJECTS) -o $(LIB)/$(LIBTARGET)

%.o : %.c
	$(CC) -I$(INCLUDE) $(CFLAGS) $< -o $@


clean:
	@rm -fr $(SRC)/*.o $(LIB)/*.so $(CYTHONOUTPUT)
