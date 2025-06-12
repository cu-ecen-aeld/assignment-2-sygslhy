# Root Makefile

.PHONY: all clean

all:
	$(MAKE) -C finder-app

clean:
	$(MAKE) -C finder-app clean
