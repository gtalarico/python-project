.PHONY: init ci test lint

init:
	@echo "Usage:"
	@echo "  make ci"
	@echo "  make test"
	@echo "  make lint"

ci:
	circleci local execute

test:
	python -m pytest

lint:
	flake8
