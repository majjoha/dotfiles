# 💻 `dotfiles`
This repository holds my configurations for my development environment. The
entire setup is managed by [GNU Stow](https://www.gnu.org/software/stow/).

## Installation
```bash
$ git clone --recursive git@github.com:majjoha/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles && stow .
```

On a new machine, you might also want to run `source ~/.dotfiles/.macos` to
enable a wide range of sensible defaults for macOS.

## Updating
```bash
$ git pull
$ git submodule foreach git pull origin master
```

## Screenshots
### zsh
![image](https://duaw26jehqd4r.cloudfront.net/items/2t2p2z030i2E1r1K1J1T/1.png)

### Neovim
![image](https://duaw26jehqd4r.cloudfront.net/items/2k332c3f0H1k0L0G3P42/2.png)

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
* [wincent/wincent](https://github.com/wincent/wincent)
