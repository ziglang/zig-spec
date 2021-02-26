#!/usr/bin/env python3

import sys, os

def main():
	import argparse
	parser = argparse.ArgumentParser()
	parser.add_argument("--push", action="store_true")
	parser.add_argument("langref", metavar="langref.html.in")
	args = parser.parse_args()

	with open(args.langref) as f:
		contents = f.read()

	start_token = "<!-- $$BEGIN GENERATED GRAMMAR$$ -->"
	end_token = "<!-- $$END GENERATED GRAMMAR$$ -->"
	try:
		start_offset = contents.index(start_token) + len(start_token)
		end_offset = contents.index(end_token)
	except ValueError:
		sys.exit("ERROR: can't find start and end tokens")

	with open(os.path.join(os.path.dirname(__file__), "grammar.y")) as f:
		grammar_y = f.read()

	escaped_content = (grammar_y
		.replace("&", "&amp;")
		.replace("<", "&lt;")
		.replace(">", "&gt;")
		.replace('"', "&quot;")
	)

	new_contents = contents[:start_offset] + "<pre><code>" + escaped_content + "</code></pre>" + contents[end_offset:]

	with open(args.langref, "w") as f:
		f.write(new_contents)

if __name__ == "__main__":
	main()
