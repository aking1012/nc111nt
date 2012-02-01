
cc=i586-mingw32msvc-gcc
link=i586-mingw32msvc-gcc

cflags=-O2 -DNDEBUG -DWIN32 -D_CONSOLE -DTELNET -DGAPING_SECURITY_HOLE -FD -c
lflags=-lkernel32 -luser32 -lwsock32 -lwinmm  -mwindows -Wl,--subsystem,windows -incremental:yes -o nc.exe

all: nc.exe

getopt.o: getopt.c
	$(cc) $(cflags) getopt.c

doexec.o: doexec.c
	$(cc) $(cflags) doexec.c

netcat.o: netcat.c
	$(cc) $(cflags) netcat.c


nc.exe: getopt.o doexec.o netcat.o
	$(link) getopt.o doexec.o netcat.o $(lflags)

clean:
	rm *.o
	rm *.exe
