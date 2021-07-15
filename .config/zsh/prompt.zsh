GIT_PROMPT_PREFIX=" %F{blue}(%F{cyan}"
GIT_PROMPT_SUFFIX="%F{blue})%f"
GIT_PROMPT_DIRTY="%F{red}*%f"

function git_dirty {
  test -z "$(command git status --porcelain -unormal 2> /dev/null)"
  (($?)) && printf "%s" "$GIT_PROMPT_DIRTY"
}

function git_branch {
  if command git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    local branchname="$(command git branch --show-current)"
    printf "%s%s%s%s" \
      "$GIT_PROMPT_PREFIX" "$branchname" "$(git_dirty)" "$GIT_PROMPT_SUFFIX"
  fi
}

precmd() {
  PS1="%F{blue}%~$(git_branch) %F{yellow}%# %f"
}
