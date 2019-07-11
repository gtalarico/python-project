# Formatter

Black is fairly young project but it's stable and quickly becoming standard across the Python community.

One of its key strengths is that it reduces configurability to a minimum,
avoiding endless discussions on how code should be styled.
_Black_ code always looks the same.

The only configuration available is the line length. Flake8 is configured to use 88 lines.

Black also plays well with Pep8, although some configuration is required to integrate it Flake8 -
Configuration details is covered in the [README.md](#).

#### Installation

If you use this repo as a template Black should already be included as a dependency.

If you need to install it manually run:

```bash
$ pip install black --pre
```

> Note: As of this writing, black is still considered a pre-release, so the `--pre` flag is required.
