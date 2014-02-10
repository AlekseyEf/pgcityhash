CFLAGS=-I/usr/include/postgresql/9.3/server
CXXFLAGS=-I/usr/include/postgresql/9.3/server
LDFLAGS=
all: pgcityhash.so

cityhash.o: cityhash.cpp
	$(CXX) $(CXXFLAGS) -fpic -c cityhash.cpp

pgcityhash.o: pgcityhash.c
	$(CC) $(CFLAGS) -fpic -c pgcityhash.c

pgcityhash.so: cityhash.o cityhash.o
	$(CC) $(LDFLAGS) -shared -o pgcityhash.so cityhash.o pgcityhash.o
