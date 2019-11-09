CFLAGS+=	-W -Wall -std=c99 -g -pedantic
CFLAGS+=	`pkgconf -cflags gtk+-3.0` 
CFLAGS+=	-rdynamic 
CFLAGS+=	-Iinclude # -I is preprcessor flag

#FLAGS+=	-pthread -pipe

LDFLAGS+=	`pkg-config --libs gtk+-3.0`

all= gtkplot

gtkplot: src/main.c
	$(CC) $(CFLAGS) src/main.c $(LDFLAGS) -o $@

testgtk: src/${@}.c
	$(CC) $(CFLAGS) src/${@}.c $(LDFLAGS) -o $@

test_geom2d: src/${@}.c include/geom2d.h src/geom2d.c
	$(CC) $(CFLAGS) src/${@}.c src/geom2d.c $(LDFLAGS) -o $@

test:
	@echo "CC:$(CC)"
	@echo "CFLAGS:$(CFLAGS)"
	@echo "LDFLAGS:$(LDFLAGS)"

.PHONY: clean test all
    
clean:
	rm -f *.o prowler gtkplot
	rm -f testgtk
	rm -f test_geom2d
	rm -f *.BAK *.core


