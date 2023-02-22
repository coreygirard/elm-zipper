make:
	elm make

test:
	make
	elm-verify-examples
	elm-test

coverage:
	make
	elm-verify-examples
	elm-coverage

preview:
	elm-doc-preview

cloc:
	cloc . --exclude-dir=VerifyExamples,.coverage
