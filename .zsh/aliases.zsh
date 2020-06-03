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
alias wk="tmx wiki"

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

# Git-related aliases
alias gi="git init"
alias ga="git add"
alias gaa="git add -A"
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
alias gsrm="git-submodule-rm"
alias gsu="git submodule foreach git pull origin master"

# Rebuild Spotlight index
alias reindex-spotlight="sudo mdutil -i on /"

# Download m3u8 playlist
function download-m3u8() {
  ffmpeg -user_agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/537.86.7" -i "$1" -c copy "$2"
}
