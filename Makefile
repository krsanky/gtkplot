UNAME:=		`uname`
CFLAGS+=	-W -Wall -std=c99 -g -pedantic
CFLAGS+=	`pkgconf --cflags gtk+-3.0` 

CFLAGS+=	-rdynamic 
#https://developer.gnome.org/gtk3/stable/GtkBuilder.html#gtk-builder-connect-signals
# -Wl,--export-dynamic

CFLAGS+=	-Iinclude # -I is preprcessor flag

#FLAGS+=	-pthread -pipe

LDFLAGS+=	`pkgconf --libs gtk+-3.0`

BINS=		test_geom2d gtkplot draw1 textview text1
all: ${BINS}

VAR1=		`echo 'var1...'`
utest:
	echo ${UNAME}
	echo $(UNAME)
	echo ${VAR1}

gtkplot: src/main.c
	$(CC) $(CFLAGS) src/main.c $(LDFLAGS) -o $@

textview: src/$@.c
	$(CC) $(CFLAGS) src/$@.c $(LDFLAGS) -o $@

text1: src/$@.c
	$(CC) $(CFLAGS) src/$@.c $(LDFLAGS) -o $@

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
	rm -f *.o 
	rm -f *.BAK *.core
	rm -f *.exe
	rm -f ${BINS}


