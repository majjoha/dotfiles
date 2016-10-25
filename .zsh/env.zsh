# Use vim as default editor
export EDITOR="vim"
export VISUAL="vim"

# Enabling coloring in the command line prompt
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:~/.env/bin:/usr/local/share/npm/bin:$PATH
export MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# Install Homebrew Cask applications in /Applications folder.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE="utf-8"

export TERM=xterm-256color

# Disallow tracking in Homebrew
export HOMEBREW_NO_ANALYTICS=1

# Set text width of `man` entries to 80. 
# https://wiki.archlinux.org/index.php/Man_page#Dynamic_page_width
export MANWIDTH=80
man() {
  local width=$(tput cols)
  [ $width -gt $MANWIDTH ] && width=$MANWIDTH
  env MANWIDTH=$width \
  man "$@"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Set path to Rust source code
export RUST_SRC_PATH=/Users/mathias/Dropbox/Kode/Rust/rust/src

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm:$PATH"
export PATH="$HOME/.nvm/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
