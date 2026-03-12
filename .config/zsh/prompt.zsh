GIT_PROMPT_PREFIX=" %F{blue}(%F{blue}"
GIT_PROMPT_SUFFIX="%F{blue})%f"
GIT_PROMPT_DIRTY="%F{red}*%f"

function git_prompt_info {
  # Ignore dirty submodule worktrees so prompts stay responsive in repos that
  # vendor dependencies as submodules.
  local status_output
  status_output=$(
    git status \
      --porcelain=v2 \
      --branch \
      --untracked-files=normal \
      --ignore-submodules=dirty \
      2>/dev/null
  ) || return

  local branch
  local oid=""
  local dirty=""
  local line

  while IFS= read -r line; do
    case "$line" in
      "# branch.head "*)
        branch=${line#\# branch.head }
        ;;
      "# branch.oid "*)
        oid=${line#\# branch.oid }
        ;;
      "# "*)
        ;;
      *)
        dirty="$GIT_PROMPT_DIRTY"
        break
        ;;
    esac
  done <<< "$status_output"

  if [[ "$branch" == "(detached)" ]]; then
    branch=${oid[1,7]}
  fi

  printf "%s" "$GIT_PROMPT_PREFIX$branch$dirty$GIT_PROMPT_SUFFIX"
}

precmd() {
  PS1="%F{blue}%~$(git_prompt_info) %F{yellow}%# %f"
}
