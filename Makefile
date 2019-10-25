TARGET=prowler
#CC=gcc
DEBUG=-g
OPT=-O0
WARN=-Wall
#PTHREAD=-pthread
CCFLAGS=$(DEBUG) $(OPT) $(WARN) $(PTHREAD) -pipe
GTKLIB=`pkg-config --cflags --libs gtk+-3.0`
#LD=gcc
LDFLAGS=$(PTHREAD) $(GTKLIB) -rdynamic

OBJS=    main.o

all=	${TARGET}
Xall: $(OBJS)
	$(LD) -o $(TARGET) $(OBJS) $(LDFLAGS)
    
Xmain.o: src/main.c
	$(CC) -c $(CCFLAGS) src/main.c $(GTKLIB) -o main.o

${TARGET}:
	$(CC) `pkgconf -cflags gtk+-3.0` src/main.c -o $(TARGET) \
		`pkgconf -libs gtk+-3.0` -rdynamic -Wall
    
clean:
	rm -f *.o $(TARGET)


