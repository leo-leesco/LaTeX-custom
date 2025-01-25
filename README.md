# Custom LaTeX packages and classes

This folder gathers my custom packages and classes. It should be installed at `TEXMFHOME` for best results and portability.

## Installation

1. `git clone git@github.com:leo-leesco/LaTeX-custom.git (kpsewhich -var-value TEXMFHOME)` (command interpolation in `fish`, try `$(kpsewhich -var-value TEXMFHOME)` instead for other shells)
2. `git submodule update --init --recursive`
3. `sudo mktexlsr` updates the database of installed packages
