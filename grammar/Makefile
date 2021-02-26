.PHONY: all clean
all: build/parser build/parser_debug

clean:
	rm -r build

build:
	mkdir build

build/parser.c: grammar.y | build
	peg $^ > $@

build/full.c: main.c build/parser.c
	cat $^ > $@

build/parser: build/full.c
	$(CC) -O3 -o $@ $^

build/parser_debug: build/full.c
	$(CC) -O3 -o $@ $^ -DYY_DEBUG
