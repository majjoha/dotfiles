# 💻 `dotfiles`
This repository contains the configuration files for my development environment.
The setup relies on [GNU Stow](https://www.gnu.org/software/stow/) for file
management.

## Usage
### Install
```bash
git clone https://github.com/majjoha/dotfiles.git ~/.dotfiles && \
  cd ~/.dotfiles && \
  git submodule update --init --recursive && \
  stow .
```

On a new machine, you may also want to run `.bin/initialize-macos-defaults` to
enable a wide range of sensible defaults for macOS.

### Update
```bash
% git pull
% git submodule update --remote --jobs=4
```

## Acknowledgments
Inspiration and code was taken from many sources, including:

* [henrik/dotfiles](https://github.com/henrik/dotfiles)
* [junegunn/dotfiles](https://github.com/junegunn/dotfiles)
* [pbrisbin/dotfiles](https://github.com/pbrisbin/dotfiles)
* [prognostikos/dotfiles](https://github.com/prognostikos/dotfiles)
* [r00k/dotfiles](https://github.com/r00k/dotfiles)
* [sjl/dotfiles](https://hg.stevelosh.com/dotfiles/)
* [wincent/wincent](https://github.com/wincent/wincent)

## License
See [LICENSE](./LICENSE.md).
