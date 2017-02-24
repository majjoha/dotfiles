# Enable compdef
autoload -Uz compinit && compinit

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

# Enable menu-style completion
zstyle ':completion:*' menu select

# Search with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

zstyle ':completion:*' special-dirs true
