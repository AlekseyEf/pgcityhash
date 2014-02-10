CFLAGS=-I`pg_config --includedir-server`
CXXFLAGS=-I`pg_config --includedir-server`
LDFLAGS=-lcityhash
all: pgcityhash.so

pgcityhash.o: pgcityhash.c
	$(CC) $(CFLAGS) -fpic -c pgcityhash.c

pgcityhash.so: pgcityhash.o
	$(CC) $(LDFLAGS) -shared -lpg -o pgcityhash.so pgcityhash.o

install:
	cp pgcityhash.so `pg_config --pkglibdir`
clean:
	rm -f *.o *.so
