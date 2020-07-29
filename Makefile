tpp: test
	rm -rf dist/*
	python3 setup.py sdist bdist_wheel
	python3 -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*

pp: test
	rm -rf dist/*
	python3 setup.py sdist bdist_wheel
	python3 -m twine upload dist/*


test:
	python3 -m unittest -v tests/*.py

clean-pyc:
	find . -name '*.pyc' -exec rm --force {} +
	find . -name '*.pyo' -exec rm --force {} +

clean-build:
	rm --force --recursive build/

clean: clean-pyc clean-build

.PHONY: tpp pp test clean-pyc clean-build clean