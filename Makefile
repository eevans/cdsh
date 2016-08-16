
VERSION = 1.0.0
NAME    = cdsh

PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

all:

install:
	install -d $(BINDIR)
	install -m 755 cdsh $(BINDIR)/cdsh

uninstall:
	rm $(BINDIR)/cdsh

orig.tar.gz:
	git archive --format=tar.gz --prefix=$(NAME)-$(VERSION)/ \
	    -o ../$(NAME)_$(VERSION).orig.tar.gz HEAD
