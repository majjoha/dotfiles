typeset -U path

path=(
  $HOME/.local/bin
  $HOME/.bin
  /opt/homebrew/bin
  $path
)

# Use vim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

export TERM=xterm-kitty

# Save a lot of history
export HISTSIZE=20000
export SAVEHIST=20000
export HISTFILE=$HOME/.zsh_history
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

# Set the TTY for GPG
export GPG_TTY=$(tty)

# Show hidden files when searching
export FZF_DEFAULT_COMMAND="rg --hidden"

# Show the prompt at the top with inline info, place a border around FZF and
# take up only 35 percent of the screen height. Display a preview of the file,
# and set the colors to match the terminal theme
export FZF_DEFAULT_OPTS="
  --reverse \
  --inline-info \
  --height=35% \
  --border \
  --preview='head -$LINES {}'
  --color=bg+:11,bg:0,border:8,spinner:7,hl:8,fg:7,prompt:8,header:8,info:12,pointer:7,marker:7,fg+:7,gutter:0,hl+:12"

# Use `bat` when viewing manual pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
