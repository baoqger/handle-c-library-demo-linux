CFLAGS =-Wall -Werror 
INSTALL ?= install
PREFIX ?= /usr/local
LIBDIR = $(PREFIX)/lib
INCLUDEDIR = $(PREFIX)/include

library: libmy_static.a libmy_shared.so

libmy_static.a: libmy_static_a.o libmy_static_b.o
	ar -rsv ./lib/static/libmy_static.a libmy_static_a.o libmy_static_b.o

libmy_static_a.o: libmy_static_a.c
	cc -c libmy_static_a.c -o libmy_static_a.o $(CFLAGS)

libmy_static_b.o: libmy_static_b.c
	cc -c libmy_static_b.c -o libmy_static_b.o $(CFLAGS)

libmy_shared.so: libmy_shared.o
	cc -shared -o ./lib/shared/libmy_shared.so libmy_shared.o
libmy_shared.o: libmy_shared.c
	cc -c -fPIC libmy_shared.c -o libmy_shared.o
	
install: library
	$(INSTALL) -D libmy_shared.h $(INCLUDEDIR)/libmy_shared.h
	$(INSTALL) -D libmy_static_a.h $(INCLUDEDIR)/libmy_static_a.h
	$(INSTALL) -D libmy_static_b.h $(INCLUDEDIR)/libmy_static_b.h
	$(INSTALL) -D ./lib/static/libmy_static.a $(LIBDIR)/libmy_static.a
	$(INSTALL) -D ./lib/shared/libmy_shared.so $(LIBDIR)/libmy_shared.so

uninstall:
	rm $(INCLUDEDIR)/libmy_shared.h
	rm $(INCLUDEDIR)/libmy_static_a.h
	rm $(INCLUDEDIR)/libmy_static_b.h
	rm $(LIBDIR)/libmy_static.a
	rm $(LIBDIR)/libmy_shared.so

.PHONY: clean
clean:
	rm *.o

