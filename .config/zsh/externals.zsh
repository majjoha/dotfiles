# Use z.lua
if command -v lua >/dev/null 2>&1 && [ -f "$HOME/.bin/z.lua/z.lua" ]; then
  eval "$(lua "$HOME"/.bin/z.lua/z.lua --init zsh)"
fi

# ghcup-env
[ -f "$HOME/.ghcup/env" ] && source "$HOME"/.ghcup/env

# rustup
[ -f "$HOME/.cargo/env" ] && source "$HOME"/.cargo/env

# Use mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# Use FZF
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi
