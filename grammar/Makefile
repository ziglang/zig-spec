.PHONY: all clean
all: build/parser build/parser_debug

clean:
	rm -r build

build:
	mkdir build

build/parser.c: grammar.y | build
	peg $^ > $@

build/parser: main.c | build/parser.c
	$(CC) -O3 -o $@ $^

build/parser_debug: main.c
	$(CC) -O3 -o $@ $^ -DYY_DEBUG
