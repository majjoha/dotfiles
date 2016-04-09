# Use z
source ~/.env/bin/z/z.sh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
# Fix slow shell: https://github.com/creationix/nvm/issues/539
lazy_source () {
  eval "$1 () { [ -f $2 ] && source $2 && $1 \$@ }"
}
NVM_SOURCE=$HOME/.nvm/nvm.sh
lazy_source nvm $NVM_SOURCE

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-2.3.0

source $HOME/Code/zendesk/docker-images/dockmaster/zdi.sh
