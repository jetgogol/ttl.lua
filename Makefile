# ttl - translate to language

SRC = ttl.lua

all: cttl

cttl: $(SRC)
	luac -o ttl.luac $(SRC)
	chmod +x ttl

clean:
	rm ttl.luac
	rm readme.html
	chmod -x ttl

html:
	md2html readme.md > readme.html

install: cttl
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f ttl.luac $(DESTDIR)$(PREFIX)/bin
	cp -f ttl $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/ttl

uninstall:
	rm $(DESTDIR)$(PREFIX)/bin/ttl
	rm $(DESTDIR)$(PREFIX)/bin/ttl.luac
