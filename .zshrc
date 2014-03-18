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

# Add aliases.
if [ -f ~/.env/.aliases ]; then
    source ~/.env/.aliases
fi

#########################
#     Miscellaneous     #
#########################
	
export PATH=/usr/local/bin:~/.env/bin:$PATH

# Install Homebrew Cask applications in /Applications folder.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE="utf-8"
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
export ZENDESK_PORT=4000
chruby ruby-2.1.0

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
