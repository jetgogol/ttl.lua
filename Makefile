# ttl - translate to language

SRC = json.lua translate.lua split.lua ttl.lua

all: cttl

cttl:
	mkdir -p build
	cp $(SRC) build

clean:
	rm -rf build
	rm readme.html

html:
	md2html readme.md > readme.html

install: cttl
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -a build $(DESTDIR)$(PREFIX)/bin/ttl.d
	cp -f ttl $(DESTDIR)$(PREFIX)/bin
	chmod +x $(DESTDIR)$(PREFIX)/bin/ttl

uninstall:
	rm -rf $(DESTDIR)$(PREFIX)/bin/ttl.d
	rm $(DESTDIR)$(PREFIX)/bin/ttl
