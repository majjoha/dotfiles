# Replaces original ls. This one uses colors and shows folders, executable
# files, etc.
alias ls="ls -LGaF"

# Ask for confirmation if a file already exists and show a message about the
# renamed file
alias mv="mv -iv"

# Automatically create nested directories and run in verbose mode
alias mkdir="mkdir -vp"

# Create a directory and enter it
function mkcd () {
  mkdir $1 && cd $1
}

function upload-file () {
  curl -F "file=@$1" https://0x0.st
}

function shorten-url () {
  curl -F "shorten=$1" https://0x0.st
}

alias ....='cd ../../..'
alias ...='cd ../..'
alias alac="alac-conversion . && rm *.flac"
alias bci="brew cask install"
alias be="bundle exec"
alias bi="brew install"
alias bs="brew search"
alias dotf="tmx dotfiles"
alias es="v ~/Library/Preferences/espanso/default.yml -c ':$' && espanso restart"
alias hs="stack ghci"
alias n="node"
alias p="pry"
alias rm="trash"
alias tmn="tmuxinator start new"
alias tmx="tmuxinator start"
alias uph="sudo update-hosts"
alias ups="update-software"
alias upsn="update-software --native-apps"
alias v="nvim"
alias vim="nvim"
alias wk="tmx notes"

# Git-related aliases
alias ga="git add"
alias gaa="git add -A"
alias gap="git add -p"
alias gb="git branch"
alias gbd="git branch -D"
alias gbl="git branch --list"
alias gc="git commit -v"
alias gcl="git clone"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gds="git diff --staged"
alias gi="git init"
alias gl="git log"
alias glw="git last-week"
alias gp="git pull"
alias groot='cd $(git rev-parse --show-toplevel 2> /dev/null || echo -n ".")'
alias gs="git status"
alias gsa="git submodule add"
alias gsrm="git rm"
alias gss="git stash --keep-index && git stash save"
alias gsu="git submodule update --remote --jobs=4"

# Rebuild Spotlight index
alias reindex-spotlight="sudo mdutil -i on /"

# Remove hidden files
alias remove-hidden-files="find . -maxdepth 5 -type f -name '.*' -delete"
