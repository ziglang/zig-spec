.PHONY: all clean

CFLAGS = -O3 -march=native -pipe

all: build/parser build/parser_debug

clean:
	rm -r build

build:
	mkdir build

build/parser.c: grammar.peg | build
	peg $^ > $@

build/parser: main.c | build/parser.c
	$(CC) $(CFLAGS) -o $@ $^

build/parser_debug: main.c
	$(CC) $(CFLAGS) -o $@ $^ -DYY_DEBUG
