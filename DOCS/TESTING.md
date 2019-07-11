# Testing

Tests should be written using pytest and pytest-cov, which verifies test coverage.

Pytest settings are already included in `setup.cfg` but can be changed as needed.

## Installation

```bash
$ pipenv install pytest pytest-cov --dev
```

## Tests Structure

This repository includes a basic skelethon for a test suite.
The basic test structure should be something like this:

repo/
├── project/
│ ├── run.py
│ └── something.py
│
└── tests/
├── test_functions.py
└── test_integrations.py

# Runnings Tests

To run tests and coverage check just run `python -m pytest or pytest`

```bash
$ python -m pytest

=====================================================================
test session starts
======================================================================
platform darwin -- Python 3.7.0, pytest-3.10.1, py-1.7.0, pluggy-0.8.0
rootdir: /Users/gtalarico/dev/project, inifile: setup.cfg
plugins: cov-2.6.0
collected 1 item

tests/test_math.py .                                                                                                                                     [100%]

---------- coverage: platform darwin, python 3.7.0-final-0 -----------
Name              Stmts   Miss  Cover
-------------------------------------
app/__init__.py       0      0   100%
app/sample.py         2      0   100%
-------------------------------------
TOTAL                 2      0   100%
```
