# 💻 `dotfiles`
This repository holds my configurations for my development environment. The
entire setup is managed by [GNU Stow](https://www.gnu.org/software/stow/).

## Installation
```bash
$ git clone --recursive https://github.com/majjoha/dotfiles.git ~/.env
$ cd ~/.env && stow .
```

On a new machine, you might also want to run `source ~/.env/.macos` to enable a
wide range of sensible defaults for macOS.

## Updating
```bash
$ git pull
$ git submodule foreach git pull origin master
```

## Screenshots
### zsh
![image](https://d3uepj124s5rcx.cloudfront.net/items/0g1X360Y133c240G2L45/Screen%20Shot%202017-02-24%20at%2023.49.35.png)

### Neovim
![image](https://d3uepj124s5rcx.cloudfront.net/items/3z2I1B023F0H1D0R0J1P/Screen%20Shot%202017-02-24%20at%2023.49.08.png)

## Bugs
If you happen to find any issues or bugs, please let me know by
[opening an issue](https://github.com/majjoha/dotfiles/issues).

## Thanks
I've been heavily inspired by many of the dotfiles repositories available.
These are some of them:

* [henrik/dotfiles](https://github.com/henrik/dotfiles)
* [junegunn/dotfiles](https://github.com/junegunn/dotfiles)
* [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [prognostikos/dotfiles](https://github.com/prognostikos/dotfiles)
* [r00k/dotfiles](https://github.com/r00k/dotfiles)
* [ryanb/dotfiles](https://github.com/ryanb/dotfiles)
* [sjl/dotfiles](https://bitbucket.org/sjl/dotfiles/src)
