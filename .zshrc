###############
#     Zsh     #
###############

# Keep colors with tmux
alias tmux="TERM=screen-256color-bce tmux"

# Don't rename my windows in tmux
DISABLE_AUTO_TITLE=true

stty -ixon

# Plugins
plugins=(git sublime rvm ruby osx heroku git-extras gem brew bundler)

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

# Add Git auto-completion
if [ -f ~/.env/.git-completion.zsh ]; then
    . ~/.env/.git-completion.zsh
fi

#########################
#     Miscellaneous     #
#########################
	
# "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# MacPorts Installer addition on 2012-12-20_at_23:49:58: adding an appropriate PATH variable for use with MacPorts.
export PATH=/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH:/Users/Mathias/Documents/Tekstdokumenter/ITU/2.\ semester/Algoritmer\ og\ datastrukturer/Opgaver/algs4:/Users/Mathias/Documents/Kode/BNSub/bin:/Applications/MacVim.app:~/.env/bin
# Finished adapting your PATH environment variable for use with MacPorts.

export CLASSPATH="/etc/java/jdbc/mysql-connector-java-5.1.24-bin.jar:/etc/java/junit/junit-4.11.jar:/etc/java/gson/gson-2.2.2.jar:/etc/java/apache-commons-lang3/commons-lang3-3.1.jar:$CLASSPATH"

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
