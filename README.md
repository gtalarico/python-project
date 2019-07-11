# Python Project Bootstrap

[![CircleCI](https://circleci.com/gh/gtalarico/python-project.svg?style=svg&circle-token=c175e352384989af2f140169c734a331cdde0b52)](https://circleci.com/gh/gtalarico/python-project)

My personal template for bootstraping new python projects.

## Contents

- [Project Template](#project-template)
- [Python Version](#python-version)
- [Virtual Environments](#virtual-environments)
- [Editor Setup](#editor-setup)
- [Project Settings](#project-settings)
- [Testing](#testing)
- [CI](#ci)

## Project Template

Includes a script (`start.sh`) to help you quickly bootstrap a new project using standards described here.

Open terminal on the location you keep your projects and run the commands below.

```
~/repos
$ git clone git@github.com:gtalarico/python-project.git my-project

~/repos
$ cd my-project

~/repos/my-project
$ sh start.sh
```

#### Note

The commands above should work on a MacOS Terminal. If you are on Windows it should work with [Cmder](http://cmder.net/) or similar.

## Virtual Environments

Virtual Environments allow you to create sandboxed environments for your application to run in,
in a way that it makes it easier for it to run on other environments consistently (other developers computers, server, etc)

While this won't go into further detail, environments for Applications and Libraries are handled using different strategies.
Applications want to lock dependencies to an exact version for deterministic installations, while libraries need to provide more flexibility in order to avoid dependency conflicts.

### Applications

For the purpose of this document, applications are projects that are executed or deployed, but _not used by other applications or libraries as dependencies_.

#### Venv

After using virtualenv-wrapper and pipenv for a while, I have gone back to good old `venv`.
It's always available and it's fast.

###### Start new venv

Typical setup for a new projects should be something like this:

```bash
~/repos/myproject
$ python3 -m venv .venv

~/repos/myproject
$ source .venv/bin/activate

~/repos/myproject
$ pip install -r requirements.txt
```

If you are using this repo as a template, black and flake8 will already be included in the dependencies file.

### Libraries

Unlike applications, libraries should manage their dependencies using the standard `setup.py` file and a `requirements.txt`.

There are also many other complexities involved in managing dependencies for deployable packages.

For more information see the [Python Packaging User Guide](https://packaging.python.org/)

## Editor Setup

**VSCode** should be the default editor for all Python projects.
Make sure you launch the editor from your project directory with an active virtual environment
so VSCode can detect it:

```bash
~/repos/my-project
$ . .venv/activate/shell

~/repos/my-project
$ code .
```

Note: If `code` is not found, Activate the "Install 'code' command in Path" tool in VS Code.

### Linter

**Flake8** should be setup to lint your code live in VSCode as you type.
Production projects should also include a `flake8` check in its CI/CD pipeline.

For more details on Flake8 see [DOCS/LINTING.md](https://github.com/gtalarico/python-project/blob/master/DOCS/LINTING.md).

### Formatter

[Black](https://github.com/ambv/black)'s tagline is _"The uncompromising Python code formatter"_.

Black is opinionated formatter, and it should be setup to format your code automatically everytime you save
a document.

For more details on Black and formatting see [DOCS/FORMATTER.md](https://github.com/gtalarico/python-project/blob/master/DOCS/FORMATTER.md).

## Project Setting

There are three primary files we will use to store project settings

| File                    | Used for                                                     |
| ----------------------- | ------------------------------------------------------------ |
| `.editorconfig`         | Line endings, indent type and size (py, js, etc).            |
| `.vscode/settings.json` | Editor Linter and Formatter Settings (what to use), Ruler(?) |
| `setup.cfg`             | Linter Config, Testing Config, other Project Configuratiosn. |

### .editorconfig

**.editorconfig** is a standard format and is used to define how the editor should handle line endings, indent type and size. While this could be configured using VSCode settings, this format is widely used and ensure these critical settings are carried over if a developer opens the project in another editor.

[`.editorconfig`](https://github.com/gtalarico/python-project/blob/master/.editorconfig)

### .vscode/settings.json

This file sets up your **VSCode Workspace Settings**

This file is detected by VSCode and specifies what linter and formatter VSCode should use,
as well as a few other editor specific settings not covered by `.editorconfig`.

All projects should include at least these settings:

[`settings.json`](https://github.com/gtalarico/python-project/blob/master/.vscode/settings.json)

### setup.cfg

**setup.cfg** is a widely used config format to specify python specific project settings.
Several python utilities (Flake8, Pytest, etc) will look into `setup.cfg` to find any relevant settings.

We will use `setup.cfg` to establish linter and testing configuration,
but other settings can be added as needed.

[`setup.cfg`](https://github.com/gtalarico/python-project/blob/master/setup.cfg)

## Testing

Applications and Libraries should include tests and aim for comprehensive coverage.

For more details on Testing see [DOCS/TESTING.md](https://github.com/gtalarico/python-project/blob/master/DOCS/TESTING.md).

## CI

Continues Integration Frameworks(CI) allows developers to ensure code is properly integrated) (tested and formatted)
frequently and merged into a shared branch. This encourages frequent contributions and more stable branches.

This repo contains default config for using CircleCI with a python project, and this repo itself
is integrated with Circle CI as an example.

See [this PR](https://github.com/gtalarico/python-project/pull/3) as an example of a failed Integration.

The CI setup in this repo ensure the following:

- Able to install dependencies on a clean Python Container
- Able to run test suit (`python -m pytest`)
- Passes flake8 check (`flake8 .`)

If all those "steps" are successful, the CI results will allow the code to be merged.

#### Test CI Locally

```
$ circleci local execute
```

Note: You will need to have [CircleCI CLI Installed](https://circleci.com/docs/2.0/local-cli/).
