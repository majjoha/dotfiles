GIT_PROMPT_PREFIX=" %F{blue}(%F{blue}"
GIT_PROMPT_SUFFIX="%F{blue})%f"
GIT_PROMPT_DIRTY="%F{red}*%f"

function git_prompt_info {
  # Early exit if not in a Git repo
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # Single `git` call to get the branch name
  local branch
  branch=$(
    git symbolic-ref --short HEAD 2>/dev/null ||
    git rev-parse --short HEAD 2>/dev/null
  )

  # Fast dirty check using `git status`
  local dirty=""
  local status_output
  status_output=$(git status --porcelain --untracked-files=normal 2>/dev/null)
  [[ -n "$status_output" ]] && dirty="$GIT_PROMPT_DIRTY"

  printf "%s" "$GIT_PROMPT_PREFIX$branch$dirty$GIT_PROMPT_SUFFIX"
}

precmd() {
  PS1="%F{blue}%~$(git_prompt_info) %F{yellow}%# %f"
}
