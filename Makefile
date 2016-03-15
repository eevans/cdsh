
PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

all:

install:
	install -d $(BINDIR)
	install -m 755 cdsh $(BINDIR)/cdsh

uninstall:
	rm $(BINDIR)/cdsh
