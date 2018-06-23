prefix = /usr/local
bindir = $(prefix)/bin
sharedir = $(prefix)/share
mandir = $(sharedir)/man
man1dir = $(mandir)/man1

all: termdiff.sh

clean:
	rm -rf /tmp/termdiff
	
install: all
	install termdiff.sh $(DESTDIR)$(bindir)/termdiff
	install -m 0644 termdiff.1 $(DESTDIR)$(man1dir)

uninstall:
	rm -i $(DESTDIR)$(bindir)/termdiff
	rm -i $(DESTDIR)$(man1dir)/termdiff.1
