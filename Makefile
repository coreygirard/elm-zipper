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

format:
	elm-format src/ --yes

gen-table:
	make format
	python3 rosie/run.py

preview:
	make gen-table
	elm-doc-preview

cloc:
	cloc . --exclude-dir=VerifyExamples,.coverage
