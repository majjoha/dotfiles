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
. ~/.env/bin/z.sh

##################
#     Prompt     #
##################

# Apply OSX settings
if [[ $(uname -s) == "Darwin" ]]; then
  source ~/.env/.osx
fi

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
chruby ruby-2.1.4

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)

export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"

## Docker host
export DOCKER_HOST=tcp://192.168.42.45:2375
export MYSQL_URL="mysql://admin:123456@192.168.42.45:3306/zendesk_development"
export MYSQL_HOST='192.168.42.45'
export MYSQL_USERNAME='admin'
export MYSQL_PASSWORD='123456'
source $HOME/Code/zendesk/docker-images/dockmaster/zdi.sh
