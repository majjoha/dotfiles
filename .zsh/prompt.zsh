GIT_PROMPT_PREFIX=" %{$fg[blue]%}(%{$reset_color%}%{$fg[cyan]%}"
GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%}"
GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_colors%}"

function git_dirty {
  test -z "$(command git status --porcelain -unormal 2> /dev/null)"
  (($?)) && echo $GIT_PROMPT_DIRTY
}

function git_branch {
  git branch --no-color 2> /dev/null |\
    sed -e '/^[^*]/d' \
      -e "s/* \(.*\)/$GIT_PROMPT_PREFIX\1$(git_dirty)$GIT_PROMPT_SUFFIX/"
}

precmd() {
  PS1="%{$fg[blue]%}%~$(git_branch) %{$fg[yellow]%}%#%{%{$reset_color%}%} "
}
