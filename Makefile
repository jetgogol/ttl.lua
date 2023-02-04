# ttl - translate to language

include config.mk

SRC = json.lua translate.lua split.lua ttl.lua

all: cttl

cttl:
	mkdir -p build
	cp $(SRC) build

clean:
	rm -rf build
	rm -f readme.html

html:
	md2html readme.md > readme.html

install: cttl
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -a build $(DESTDIR)$(PREFIX)/bin/ttl.d
	cp -f ttl $(DESTDIR)$(PREFIX)/bin
	chmod +x $(DESTDIR)$(PREFIX)/bin/ttl
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < ttl.1 > $(DESTDIR)$(MANPREFIX)/man1/ttl.1
	cp ttl.1 $(DESTDIR)$(MANPREFIX)/man1/ttl.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/ttl.1

uninstall:
	rm -rf $(DESTDIR)$(PREFIX)/bin/ttl.d
	rm $(DESTDIR)$(PREFIX)/bin/ttl
	rm -f $(DESTDIR)$(MANPREFIX)/man1/ttl.1
