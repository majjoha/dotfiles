typeset -U path

path=(
  $HOME/.local/bin
  $HOME/.bin
  $HOME/.ghcup/env
  /opt/homebrew/bin
  $path
)

# Use vim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

export TERM=xterm-ghostty

# Save a lot of history
export HISTSIZE=20000
export SAVEHIST=20000
export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
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

# Use check mark instead of beer bottle for install badges
export HOMEBREW_INSTALL_BADGE="✓"

# Forbid redirects from secure HTTPS to insecure HTTP
export HOMEBREW_NO_INSECURE_REDIRECT=1

# Set the TTY for GPG
export GPG_TTY=$(tty)

# Show hidden files when searching
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git/*'"

# Show the prompt at the top with inline info, place a border around FZF and
# take up only 35 percent of the screen height. Display a preview of the file,
# and set the colors to match the terminal theme
export FZF_DEFAULT_OPTS="
  --reverse \
  --height=50% \
  --style minimal \
  --border sharp \
  --preview='bat --style=numbers --color=always --line-range :200 {}' \
  --color=bg+:11,bg:0,border:8,spinner:7,hl:8,fg:7,prompt:8,header:8,info:12,pointer:7,marker:7,fg+:7,gutter:0,hl+:12"

# Use Neovim when viewing manual pages
export MANPAGER="nvim +Man!"

export SAPF_HISTORY="$HOME/sapf-files/sapf-history.txt"
export SAPF_LOG="$HOME/sapf-files/sapf-log.txt"
export SAPF_PRELUDE="$HOME/sapf-files/sapf-prelude.txt"
export SAPF_EXAMPLES="$HOME/sapf-files/sapf-examples.txt"
export SAPF_README="$HOME/sapf-files/README.txt"
export SAPF_RECORDINGS="$HOME/sapf-files/recordings"
export SAPF_SPECTROGRAMS="$HOME/sapf-files/spectrograms"

# Ensure Codex scans configuration files, skills, etc., correctly
export CODEX_HOME="$HOME/.dotfiles/.codex"

# Store z.lua database in `XDG_DATA_HOME`
export _ZL_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/zlua/zlua.txt"
