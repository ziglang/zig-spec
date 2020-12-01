#!/usr/bin/env bash

ZIG=${ZIG:-zig}

if [ $# -eq 0 ]; then
	FILE_LIST=(./tests/*.zig)
	FILES="${FILE_LIST[@]}"
else
	FILES="$@"
fi

for FILE in $FILES
do
	$ZIG fmt --stdin < $FILE > /dev/null 2>&1
	zigret=$?
	./build/parser < $FILE > /dev/null 2>&1
	parserret=$?

	if [ "$zigret" -ne "$parserret" ]; then
		echo "$FILE"
	fi
done
