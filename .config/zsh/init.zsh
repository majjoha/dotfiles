# Enable compdef
autoload -Uz compinit && compinit -d "$ZSH_COMPDUMP"

# Add support for Bash completion definitions
autoload -U +X bashcompinit && bashcompinit

# Enable colors
autoload -U colors && colors

# Remove beep sound
setopt no_beep

# Change directory with `cd`
setopt auto_cd

# Ignore duplicate history entries
setopt hist_ignore_all_dups

# # Case-insensitive (all), partial-word, and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Move cursor to the end of word after completing
setopt always_to_end

# Allow completion from within a word/phrase
setopt complete_in_word

# Enable menu-style completion
zstyle ':completion:*' menu select

# Search with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Edit command in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^x^x" edit-command-line

zstyle ':completion:*' special-dirs true

# Use Emacs-style key bindings for zsh
bindkey -e

# Click ^Z to bring a background job to the foreground if any is running
ctrl-z() {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

zle -N ctrl-z
bindkey '^Z' ctrl-z

# Execute auto-suggestions using Shift-Tab
bindkey '^[[Z' autosuggest-accept
