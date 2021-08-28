GIT_PROMPT_PREFIX=" %F{blue}(%F{cyan}"
GIT_PROMPT_SUFFIX="%F{blue})%f"
GIT_PROMPT_DIRTY="%F{red}*%f"

function git_dirty {
  test -z "$(command git status --porcelain -unormal 2> /dev/null)"
  (($?)) && printf "%s" "$GIT_PROMPT_DIRTY"
}

function git_branch {
  git branch --no-color 2> /dev/null |\
    tr -d '()' |\
    sed -e '/^[^*]/d' \
      -e "s/* \(.*\)/$GIT_PROMPT_PREFIX\1$(git_dirty)$GIT_PROMPT_SUFFIX/"
}

precmd() {
  PS1="%F{blue}%~$(git_branch) %F{yellow}%# %f"
}
