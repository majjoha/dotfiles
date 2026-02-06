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
  mkdir "$1" && cd "$1"
}

alias ....='cd ../../..'
alias ...='cd ../..'
alias alac="alac-conversion . && rm *.flac"
alias be="bundle exec"
alias bi="brew install"
alias dotf="tmuxinator start dotfiles"
alias n="node"
alias p="pry"
alias rm="trash"
alias tmn="tmuxinator start new"
alias ups="update-software"
alias v="nvim --listen $(pwd)/nvim-context.sock"
alias vim="nvim"
alias wk="tmuxinator start notes"

# Git-related aliases
alias ga="git add"
alias gaa="git add -A"
alias gap="git add -p"
alias gas="git add -A && git stash"
alias gb="git branch"
alias gbd="git branch -D"
alias gbl="git branch --list"
alias gc="git commit -v"
alias gcl="git clone"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gds="git diff --staged"
function gdu () {
  git ls-files --others --exclude-standard -z |
    xargs -0 -r -n1 git diff --no-index -- /dev/null
}
alias gi="git init"
alias gl="git log"
alias glw="git last-week"
alias gp="git pull"
alias groot='cd $(git rev-parse --show-toplevel 2> /dev/null || echo -n ".")'
alias gs="git status"
alias gsa="git submodule add"
alias gsp="git stash pop"
alias gsrm="git rm"
alias gss="git stash --keep-index && git stash save"
alias gsu="git submodule update --remote --jobs=4"
alias gri="git rebase -i"
alias grc="git rebase --continue"
alias git-cleanup='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'
alias gprc="checkout-pr"

# Rebuild Spotlight index
alias reindex-spotlight="sudo mdutil -i on /"

# Remove hidden files
alias remove-hidden-files="find . -maxdepth 5 -type f -name '.*' -delete"

function ffsilent { ffmpeg -i "$1" -c copy -an "${1%.*}-nosound.${1#*.}" }

# Rename tmux window for Amp/Claude/Codex/Gemini when available
function amp () {
  if [[ -n "$TMUX" ]]; then
    tmux rename-window amp
  fi
  command amp "$@"
}

function claude () {
  if [[ -n "$TMUX" ]]; then
    tmux rename-window claude
  fi
  command claude "$@"
}

function codex () {
  if [[ -n "$TMUX" ]]; then
    tmux rename-window codex
  fi
  command codex "$@"
}

function gemini () {
  if [[ -n "$TMUX" ]]; then
    tmux rename-window gemini
  fi
  command gemini "$@"
}

alias mx="mise x"
