# Tab completion for tmux sessions
function tm() {
  [[ -z "$1" ]] && { echo "usage: tm <session>" >&2; return 1; }

  if tmux has-session -t "$1" 2>/dev/null; then
    if [[ -n "$TMUX" ]]; then
      tmux switch-client -t "$1"
    else
      tmux attach-session -t "$1"
    fi
  else
    tmux new-session -s "$1"
  fi
}

function __tmux-sessions() {
  local expl
  local -a sessions
  sessions=( ${${(f)"$(command tmux list-sessions 2>/dev/null)"}/:[ $'\t']##/:} )
  _describe -t sessions 'sessions' sessions "$@"
}
compdef __tmux-sessions tm

# Create a tmux session with an editor and shell window, or attach if it already
# exists.
function start-tmux-session() {
  local name="${1:-$(basename "$PWD")}"
  name="${name//[.:]/-}"
  local root="${2:-$PWD}"

  if tmux has-session -t "$name" 2>/dev/null; then
    if [[ -n "$TMUX" ]]; then
      tmux switch-client -t "$name"
    else
      tmux attach-session -t "$name"
    fi
    return
  fi

  tmux new-session -d -s "$name" -c "$root"
  tmux send-keys -t "$name" \
    'nvim -c ":FzfLua files"' Enter
  tmux new-window -t "$name" -c "$root"
  tmux select-window -t "$name":1
  if [[ -n "$TMUX" ]]; then
    tmux switch-client -t "$name"
  else
    tmux attach-session -t "$name"
  fi
}
