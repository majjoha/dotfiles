###############
#     Zsh     #
###############

# Don't rename my windows in tmux
DISABLE_AUTO_TITLE=true

stty -ixon

# Path to oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

# Let's source this stuff!
source $ZSH/oh-my-zsh.sh

# Theme
source ~/.env/.majjoha.zsh-theme

# Work with me, git
__git_files () {
  _wanted files expl 'local files' _files
}

# Use z
. ~/.env/bin/z/z.sh

##################
#     Prompt     #
##################

# Use vim as default editor
export EDITOR="vim"
export VISUAL="vim"

####################
#     Coloring     #
####################

# Enabling coloring in the command line prompt
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

###################
#     Aliases     #
###################

if [ -f ~/.env/.aliases ]; then
  source ~/.env/.aliases
fi

#########################
#     Miscellaneous     #
#########################

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:~/.env/bin:/usr/local/share/npm/bin:$PATH
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/Applications/mysql/lib:$DYLD_LIBRARY_PATH

# Install Homebrew Cask applications in /Applications folder.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE="utf-8"
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-2.1.5

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# export JAVA_HOME=$(/usr/libexec/java_home)

export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.npm:$PATH"
export PATH="$HOME/.nvm/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"

## Docker host
export DOCKER_HOST=tcp://192.168.42.45:2375
export MYSQL_URL="mysql://admin:123456@192.168.42.45:3306/zendesk_development"
export MYSQL_HOST='192.168.42.45'
export MYSQL_USERNAME='admin'
export MYSQL_PASSWORD='123456'
export ZENDESK_PORT=""
export ZENDESK_HOST="zd-dev.com"
source $HOME/Code/zendesk/docker-images/dockmaster/zdi.sh
export MYSQL_ACCOUNT_TEST=zendesk_test
export MYSQL_SHARD_1_TEST=zendesk_shard_1_test
export MYSQL_ID_SERVER_TEST=zendesk_test

# OPAM configuration
. /Users/mathias/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export NVM_DIR=~/.nvm
. $NVM_DIR/nvm.sh
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -l -g ""'

# Autocompletion for Rust via Racer
export RUST_SRC_PATH=$HOME/Dropbox/Kode/Rust/rust/src
