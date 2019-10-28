CFLAGS+=	-W -Wall -O2 -std=c99 -g
CFLAGS+=	`pkgconf -cflags gtk+-3.0` 
CFLAGS+=	-rdynamic 
#FLAGS+=	-pthread -pipe
LDFLAGS+=	`pkg-config --libs gtk+-3.0`

all= prowler

prowler: src/main.c
	$(CC) $(CFLAGS) src/main.c $(LDFLAGS) -o $@

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


