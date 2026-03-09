# ghcup-env
[ -f "$HOME/.ghcup/env" ] && source "$HOME"/.ghcup/env

# rustup
[ -f "$HOME/.cargo/env" ] && source "$HOME"/.cargo/env

# Use mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# Use zoxide for fast directory jumping
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Use FZF
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# zsh-autosuggestions
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
