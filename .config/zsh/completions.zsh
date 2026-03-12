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

# Tab completion for opening tmuxinator projects
_tmuxinator() {
  local commands projects
  commands=(${(f)"$(tmuxinator commands zsh)"})
  projects=(${(f)"$(tmuxinator completions start)"})

  if (( CURRENT == 2 )); then
    _describe -t commands "tmuxinator subcommands" commands
    _describe -t projects "tmuxinator projects" projects
  elif (( CURRENT == 3)); then
    case $words[2] in
      copy|debug|delete|open|start)
        _arguments '*:projects:($projects)'
      ;;
    esac
  fi

  return
}
compdef _tmuxinator tmuxinator mux
