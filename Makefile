make:
	elm make

test:
	elm-verify-examples
	elm-test

preview:
	elm-doc-preview
