CFLAGS=-I`pg_config --includedir-server`
CXXFLAGS=-I`pg_config --includedir-server`
LDFLAGS=
all: pgcityhash.so

city.o: city.c
	$(CC) $(CFLAGS) -O3 -fpic -c city.c

pgcityhash.o: pgcityhash.c
	$(CC) $(CFLAGS) -O3 -fpic -c pgcityhash.c

pgcityhash.so: pgcityhash.o city.o
	$(CC) $(LDFLAGS) -O3 -shared -o pgcityhash.so pgcityhash.o city.o

install:
	cp pgcityhash.so `pg_config --pkglibdir`
clean:
	rm -f *.o *.so
