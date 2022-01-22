# Use z.lua
eval "$(lua $HOME/.bin/z.lua/z.lua --init zsh)"

# FZF
[ -f "$HOME/.fzf.zsh" ] && source $HOME/.fzf.zsh

# chruby
if [ -d "$(brew --prefix)/opt/chruby/" ]; then
  source "$(brew --prefix)/opt/chruby/share/chruby/chruby.sh"
  source "$(brew --prefix)/opt/chruby/share/chruby/auto.sh"
fi

# ghcup-env
[ -f "$HOME/.ghcup/env" ] && source $HOME/.ghcup/env

# rustup
[ -f "$HOME/.cargo/env" ] && source $HOME/.cargo/env
