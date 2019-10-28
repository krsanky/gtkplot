CFLAGS+=		-W -Wall -O2 -std=c99 -g
CFLAGS+=	`pkgconf -cflags gtk+-3.0` 
LDFLAGS+=	`pkg-config --libs gtk+-3.0`

all= prowler

#CC=gcc
#DEBUG=-g
#OPT=-O0
#WARN=-Wall
#PTHREAD=-pthread
#CCFLAGS=$(DEBUG) $(OPT) $(WARN) $(PTHREAD) -pipe
#LD=gcc

#GTKLIB=`pkg-config --cflags --libs gtk+-3.0`
#LDFLAGS=$(PTHREAD) $(GTKLIB) -rdynamic


#	$(LD) -o $(TARGET) $(OBJS) $(LDFLAGS)
#	$(CC) -c $(CCFLAGS) src/main.c $(GTKLIB) -o main.o

prowler: src/main.c
	$(CC) `pkgconf -cflags gtk+-3.0` src/main.c -o $@ \
		`pkgconf -libs gtk+-3.0` -rdynamic -Wall
	#$(CC) $(CFLAGS) triangle.c $(LDFLAGS) -o triangle

#CFLAGS+= -I/usr/local/include/gtk-3.0
#CFLAGS+= -I/usr/local/include/glib-2.0
#CFLAGS+= -I/usr/local/lib/glib-2.0/include
testgtk: src/${@}.c
	$(CC) $(CFLAGS) src/${@}.c $(LDFLAGS) -o $@

test:
	@echo "CC:$(CC)"
	@echo "CFLAGS:$(CFLAGS)"
	@echo "LDFLAGS:$(LDFLAGS)"

.PHONY: clean test 
    
clean:
	rm -f *.o prowler
	rm -f testgtk


