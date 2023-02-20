make:
	elm make

test:
	make
	elm-verify-examples
	elm-test

preview:
	elm-doc-preview
