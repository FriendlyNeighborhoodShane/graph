.POSIX:

PREFIX       = $(HOME)
ALL_WARNINGS =
ALL_CFLAGS   = $(ALL_WARNINGS) -O3 $(CFLAGS) $(CPPFLAGS)

NO_OPENSSL=YesPlease
NO_CURL=YesPlease
NO_EXPAT=YesPlease
NO_TCLTK=YesPlease
NO_GETTEXT=YesPlease
NO_ICONV=YesPlease

OBJ = graph.o main.o strbuf.o wrapper.o
HDR = graph.h

.c.o:
	$(CC) $(ALL_CFLAGS) -c -o $@ $<

graph: $(OBJ)
	$(CC) $(ALL_CFLAGS) -o $@ $(OBJ) $(LDFLAGS)

$(OBJ): $(HDR)

install: paleta
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp graph  $(DESTDIR)$(PREFIX)/bin/

clean:
	rm -f graph $(OBJ)

.PHONY: install clean
