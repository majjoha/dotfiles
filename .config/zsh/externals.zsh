# Use z.lua
eval "$(lua ~/.bin/z.lua/z.lua --init zsh)"

# FZF
[ -f "$HOME/.fzf.zsh" ] && source ~/.fzf.zsh

# chruby
if [ -d "/usr/local/opt/chruby/" ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi

# ghcup-env
[ -f "$HOME/.ghcup/env" ] && source ~/.ghcup/env

# rustup
[ -f "$HOME/.cargo/env" ] && source ~/.cargo/env
