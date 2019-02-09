# Grammar

This folder contains the
[Parsing Expression Grammar](https://en.wikipedia.org/wiki/Parsing_expression_grammar)
for the Zig programming language.

## Build

The grammar is validated and tested using the
[`peg` parser generator](http://piumarta.com/software/peg/)
and any C compiler. Known to work C compilers include:

 * GCC >= 7.4.0

Typing `make` in this folder will create a `build` directory containing the
source files generated from `peg` and two executables, which can both parse Zig
source code.

* The `parser` executable will parse content from stdin. It exits with the
  status code `1` if the input is not valid Zig.
* `parser_debug` does the same as `parser` but also prints to stderr which
  rules are taken during parsing.
