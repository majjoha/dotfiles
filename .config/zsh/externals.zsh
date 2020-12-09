# Use z
source ~/.bin/z/z.sh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# chruby
if [ -d "/usr/local/opt/chruby/" ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi
