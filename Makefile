CFLAGS+=	-W -Wall -O2 -std=c99 -g
CFLAGS+=	`pkg-config --cflags gtk+-3.0` 
#FLAGS+=	-pthread -pipe
LDFLAGS+=	`pkg-config --libs gtk+-3.0`
#LDFLAGS+=	-export-dynamic
#LDFLAGS+=	--export-all-symbols
#LDFLAGS+=	-rdynamic 

all= prowler

prowler: src/main.c
	$(CC) $(CFLAGS) src/main.c $(LDFLAGS) -o $@

testgtk: src/testgtk.c
	$(CC) $(CFLAGS) src/testgtk.c $(LDFLAGS) -o testgtk 

test:
	@echo "CC:$(CC)"
	@echo "CFLAGS:$(CFLAGS)"
	@echo "LDFLAGS:$(LDFLAGS)"

.PHONY: clean test 
    
clean:
	rm -f *.o prowler
	rm -f testgtk
	rm -f *.exe


