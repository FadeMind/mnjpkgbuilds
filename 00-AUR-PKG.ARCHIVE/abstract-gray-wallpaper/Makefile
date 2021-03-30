#!/usr/bin/make -f
THEME = "Abstract Gray"
PREFIX = /usr
INSTALLDIR = $(DESTDIR)/$(PREFIX)/share/wallpapers
RM = rm -rf
INSTALL = install -Dm644

install:
	find $(THEME) -type f -exec $(INSTALL) '{}' "$(INSTALLDIR)/{}" \;
uninstall: 	
	$(RM) $(INSTALLDIR)/$(THEME)
