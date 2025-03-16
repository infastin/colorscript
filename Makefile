PREFIX ?= /usr/local

BINDIR = $(PREFIX)/bin
DATADIR = $(PREFIX)/share

COLORSCRIPTS := $(notdir $(wildcard scripts/*))

all:
	$(NOECHO) $(NOOP)

install:
	install -m 0755 -d $(DESTDIR)$(BINDIR)
	install -m 0755 colorscript $(DESTDIR)$(BINDIR)/colorscript

	install -m 0755	-d $(DESTDIR)$(DATADIR)
	install -m 0755	-d $(DESTDIR)$(DATADIR)/colorscript

	for script in $(COLORSCRIPTS); do \
		install -m 0755 scripts/$$script $(DESTDIR)$(DATADIR)/colorscript/$$script; \
	done

uninstall:
	rm $(DESTDIR)$(BINDIR)/colorscript
	rm -rf $(DESTDIR)$(DATADIR)/colorscript
