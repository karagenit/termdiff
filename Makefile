prefix = /usr/local
bindir = $(prefix)/bin
sharedir = $(prefix)/share
mandir = $(sharedir)/man
man1dir = $(mandir)/man1

all: termdiff.sh

clean:
	rm -rf /tmp/termdiff
	
install: all
	install -D termdiff.sh $(DESTDIR)$(bindir)/termdiff
	install -D -m 0644 termdiff.1 $(DESTDIR)$(man1dir)

uninstall:
	rm $(DESTDIR)$(bindir)/termdiff
	rm $(DESTDIR)$(man1dir)/termdiff.1
