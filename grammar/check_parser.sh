#!/usr/bin/env bash

if [ ! -x ./build/parser ]; then
	echo 'ERROR: ./build/parser: not found.'
	echo 'ERROR: you need to run `make` first.'
	exit 1
fi

ZIG=${ZIG:-zig}

if [ $# -eq 0 ]; then
	FILES=(tests/*.zig)
else
	FILES=("$@")
fi

echo "running ${#FILES[@]} tests..."

ANY_FAILURE=
for FILE in "${FILES[@]}"; do
	$ZIG fmt --stdin < "$FILE" > /dev/null 2>&1
	zigret=$?
	./build/parser < "$FILE" > /dev/null 2>&1
	parserret=$?

	if [ "$zigret" -ne "$parserret" ]; then
		echo "FAIL: ${FILE}: zig: $zigret, grammar: $parserret"
		ANY_FAILURE=1
	fi
done

if [ -z "$ANY_FAILURE" ]; then
	echo 'all tests passed'
else
	exit 1
fi
