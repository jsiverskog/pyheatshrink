test:
	python3 setup.py test

test-sdist:
	rm -rf dist
	python3 setup.py sdist
	cd dist && \
	mkdir test && \
	cd test && \
	tar xf ../*.tar.gz && \
	cd heatshrink2-* && \
	python3 setup.py test

release-to-pypi:
	python3 setup.py sdist
	twine upload dist/*

FUZZ_TIME ?= 10

fuzz:
	cd heatshrink2 && \
	    pyfuzzer run \
		-l max_total_time=$(FUZZ_TIME) \
		core.c \
		_heatshrink/heatshrink_encoder.c \
		_heatshrink/heatshrink_decoder.c
	cd heatshrink2 && \
	    pyfuzzer print_corpus
