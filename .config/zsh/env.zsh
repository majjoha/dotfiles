# Use vim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

export TERM=xterm-256color

# Save a lot of history
export HISTSIZE=20000
export SAVEHIST=20000
export HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY

# Enabling coloring in the command line prompt
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Set text width of `man` entries to 80. 
export MANWIDTH=80

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Disallow tracking in Homebrew
export HOMEBREW_NO_ANALYTICS=1

# Brew coffee instead of beer
export HOMEBREW_INSTALL_BADGE="☕️"

export MYSQL=/usr/local/mysql/bin
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:~/.bin:/usr/local/share/npm/bin:$PATH
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm:$PATH"
export PATH="$HOME/.nvm/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH=$PATH:$MYSQL

# Set the TTY for GPG
export GPG_TTY=$(tty)
