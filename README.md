# TLA+ development environment in VSCode

The flake in this repository contains a template for dev environment
which bootstraps a simple repository for TLA+ development in VSCode.

## Usage

Bootstrap the project
```
nix flake init -t github:laaksonel/tlaplus-nix#default
```
Launch VSCode at project root directory
```
code .
```
At startup, VSCode will suggest recommended extensions based on `extensions.json`
in `.vscode`. Install the recommended TLA+ extension.

