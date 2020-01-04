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
