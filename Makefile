.POSIX:

PREFIX       = $(HOME)
ALL_WARNINGS = -Wall -Wextra -pedantic -Wmissing-prototypes -Wstrict-prototypes
ALL_CFLAGS   = -std=c99 $(ALL_WARNINGS) -O3 $(CFLAGS) $(CPPFLAGS)

OBJ = graph.o
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
