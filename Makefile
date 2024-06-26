.PHONY: quality style test

# Check that source code meets quality standards

quality:
	black --check --line-length 119 --target-version py36 tests src metrics comparisons measurements intelai_hub
	isort --check-only tests src metrics measurements intelai_hub
	flake8 tests src metrics intelai_hub

# Format source code automatically

style:
	black --line-length 119 --target-version py36 tests src metrics comparisons measurements intelai_hub
	isort tests src metrics measurements intelai_hub

# Run tests for the library

test:
	python -m pytest -n auto --dist=loadfile -s -v ./tests/
