# Custom LaTeX packages and classes

This folder gathers my custom packages and classes. It should be installed at `TEXMFHOME` for best results and portability.

## Installation

```fish
git clone git@github.com:leo-leesco/LaTeX-custom.git (kpsewhich -var-value TEXMFHOME)
git submodule update --init --recursive
sudo mktexlsr (kpsewhich -var-value TEXMFHOME)
```

This script uses command interpolation in `fish`, try `$(kpsewhich -var-value TEXMFHOME)` for other shells.

The last command updates the database of installed packages.
