# Replaces original ls. This one uses colors and shows folders, executable
# files, etc.
alias ls="ls -LGaF"

alias be="bundle exec"
alias bi="brew install"
alias bci="brew cask install"
alias bs="brew search"
alias dotf="tmx dotfiles"
alias n="node"
alias p="pry"
alias uph="sudo update-hosts"
alias ups="update-software"
alias upsn="update-software --native-apps"
alias rm="trash"
alias alac="alac-conversion . && rm *.flac"
alias es="v ~/Library/Preferences/espanso/default.yml -c ':$' && espanso restart"
alias wk="tmx notes"

# Create a directory and enter it
function mkcd () {
  mkdir $1 && cd $1
}

# Use Neovim for now
alias vim="nvim"
alias v="nvim"

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

# Tab completion for chruby
_chruby() { compadd $(chruby | tr -d '* ') }
compdef _chruby chruby

# Tab completion for opening tmuxinator projects
_tmuxinator() {
  local commands projects
  commands=(${(f)"$(tmuxinator commands zsh)"})
  projects=(${(f)"$(tmuxinator completions start)"})

  if (( CURRENT == 2 )); then
    _describe -t commands "tmuxinator subcommands" commands
    _describe -t projects "tmuxinator projects" projects
  elif (( CURRENT == 3)); then
    case $words[2] in
      copy|debug|delete|open|start)
        _arguments '*:projects:($projects)'
      ;;
    esac
  fi

  return
}
compdef _tmuxinator tmuxinator mux
alias tmx="tmuxinator start"

blog() {
  docker run \
    -p 4000:4000 \
    -v $(pwd):/app \
    -d \
    majjoha/blog
}

# Git-related aliases
alias gi="git init"
alias ga="git add"
alias gaa="git add -A"
alias gap="git add -p"
alias gb="git branch"
alias gbd="git branch -D"
alias gbl="git branch --list"
alias gc="git commit -v"
alias gcl="git clone"
alias gcm="git commit -m"
alias gds="git diff --staged"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log"
alias glw="git last-week"
alias gp="git pull"
alias gs="git status"
alias gsa="git submodule add"
alias gsrm="git rm"
alias gsu="git submodule update --remote --jobs=4"
alias gpr="git pull --rebase"

# Rebuild Spotlight index
alias reindex-spotlight="sudo mdutil -i on /"
