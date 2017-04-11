# Replaces original ls. This one uses colors and shows folders, executable
# files, etc.
alias ls="ls -LGaF"

alias be="bundle exec"

# Create a directory and enter it
function mkcd () {
  mkdir $1 && cd $1
}

# Use Neovim for now
alias vim="nvim"
alias v="nvim"

# Change directory, and open vim
function zv () {
  z $1 && v
}

# Go up one directory
alias ..='cd ..'

# Go up two directories
alias ...='cd ../..'

# Go up three directories
alias ....='cd ../../..'

# Tab completion for tmux sessions
function tm() {
  [[ -z "$1" ]] && { echo "usage: tm <session>" >&2; return 1; }
  tmux has -t $1 && tmux attach -t $1 || tmux new -s $1
}

function __tmux-sessions() {
  local expl
  local -a sessions
  sessions=( ${${(f)"$(command tmux list-sessions)"}/:[ $'\t']##/:} )
  _describe -t sessions 'sessions' sessions "$@"
}
compdef __tmux-sessions tm

# Tab completion for Ag + ctags
# See http://robots.thoughtbot.com/silver-searcher-tab-completion-with-exuberant-ctags
_ag() {
  if (( CURRENT == 2 )); then
    compadd $(cut -f 1 .git/tags tmp/tags 2>/dev/null | grep -v '!_TAG')
  fi
}
compdef _ag ag

# Tab completion for chruby
_chruby() { compadd $(chruby | tr -d '* ') }
compdef _chruby chruby

# Git-related aliases
alias ga="git add"
alias gb="git branch"
alias gbd="git branch -D"
alias gbl="git branch --list"
alias gc="git commit"
alias gcl="git clone"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log"
alias glw="git last-week"
alias gp="git pull"
alias gs="git status"
alias gsa="git submodule add"
alias gsu="git submodule foreach git pull origin master"
