CFLAGS=-I`pg_config --includedir-server`
CXXFLAGS=-I`pg_config --includedir-server`
LDFLAGS=
all: pgcityhash.so

cityhash.o: cityhash.cpp
	$(CXX) $(CXXFLAGS) -fpic -c cityhash.cpp

pgcityhash.o: pgcityhash.c
	$(CC) $(CFLAGS) -fpic -c pgcityhash.c

pgcityhash.so: cityhash.o pgcityhash.o
	$(CC) $(LDFLAGS) -shared -o pgcityhash.so cityhash.o pgcityhash.o

install:
	cp pgcityhash.so `pg_config --pkglibdir`
clean:
	rm -f *.o *.so
