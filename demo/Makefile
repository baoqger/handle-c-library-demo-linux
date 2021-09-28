LIBS = -L../lib/shared -L../lib/static -lmy_shared -lmy_static -I../
GNULIBS = -lmy_shared -lmy_static
CFLAGS =-Wall -Werror

demo: 
	cc -o my_app main.c $(CFLAGS) $(LIBS)

# you can run this make command after you install 
# the libraries into the default system directory: /usr/local/bin
gnudemo: 
	cc -o my_app main.c $(CFLAGS) $(GNULIBS)

clean:
	rm ./my_app