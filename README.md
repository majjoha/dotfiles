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
![image](https://d3uepj124s5rcx.cloudfront.net/items/1j463O3q1L113B1J2T2n/Screen%20Shot%202017-03-29%20at%2008.40.48.png)

### Neovim
![image](https://d3uepj124s5rcx.cloudfront.net/items/0y0V0j0r342O2d0E1N2M/Screen%20Shot%202017-03-29%20at%2008.41.50.png)

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
