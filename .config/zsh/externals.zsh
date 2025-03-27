# Use z.lua
eval "$(lua $HOME/.bin/z.lua/z.lua --init zsh)"

# ghcup-env
[ -f "$HOME/.ghcup/env" ] && source $HOME/.ghcup/env

# rustup
[ -f "$HOME/.cargo/env" ] && source $HOME/.cargo/env

# Use mise
eval "$(mise activate zsh)"

# Use FZF
source <(fzf --zsh)

# Use `chruby`
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
