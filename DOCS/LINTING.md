# Linting

While there many options available for linting (pylint, pyflake, autopep8, pycodestyle, etc) Flake8 is the most comprehensive and commonly used linter.

Flake8 enforces style and formatting as specified in [Pep8](https://www.python.org/dev/peps/pep-0008/), but also adds a few critical checks:

- Undefined Names
- Unused variables and imports
- Complexity Checks
- Return statement inside generator
- Duplicate Arguments
- And Many more

Many of these checks can actually be used to catch errors before runtime (eg. Undefined variable names).

#### Installation

```bash
$ pipenv install flake8 --dev
```

#### Exceptions

In the rare instances where you need to ignore linting errors,
you can do so by adding `# no qa` at the end of the line in question.

```python
>>> import something # no qa
```

For more details see the [official docs](http://flake8.pycqa.org/en/latest/)
