UNAME:=		`uname`
#CFLAGS+=	-W -Wall -O2 -std=c99 -g
CFLAGS+=	-W -Wall -std=c99 -g -pedantic

.if ${UNAME} == "FreeBSD"
VAR1=	"POP"
.else
VAR1=	"qwe"
.endif
#CFLAGS+=	`pkg-config --cflags gtk+-3.0` 
CFLAGS+=	`pkgconf --cflags gtk+-3.0` 

CFLAGS+=	-rdynamic 
CFLAGS+=	-Iinclude # -I is preprcessor flag

#FLAGS+=	-pthread -pipe

#LDFLAGS+=	`pkg-config --libs gtk+-3.0`
LDFLAGS+=	`pkgconf --libs gtk+-3.0`

#LDFLAGS+=	-export-dynamic
#LDFLAGS+=	--export-all-symbols
#LDFLAGS+=	-rdynamic 

all: test_geom2d gtkplot draw1

utest:
	echo ${UNAME}
	echo $(UNAME)
	echo ${VAR1}

gtkplot: src/main.c
	$(CC) $(CFLAGS) src/main.c $(LDFLAGS) -o $@

draw1: src/$@.c
	$(CC) $(CFLAGS) src/$@.c $(LDFLAGS) -o $@

testgtk: src/${@}.c
	$(CC) $(CFLAGS) src/${@}.c $(LDFLAGS) -o $@

test_geom2d: src/${@}.c include/geom2d.h src/geom2d.c
	$(CC) $(CFLAGS) src/${@}.c src/geom2d.c $(LDFLAGS) -o $@

test:
	@echo "CC:$(CC)"
	@echo "CFLAGS:$(CFLAGS)"
	@echo "LDFLAGS:$(LDFLAGS)"

.PHONY: clean test all utest
    
clean:
	rm -f *.o gtkplot
	rm -f testgtk
	rm -f test_geom2d
	rm -f draw1
	rm -f *.BAK *.core
	rm -f *.exe


