local git_info='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}(%{$reset_color%}%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_colors%}"  

precmd() {
  PS1="%{$fg[blue]%}%~${git_info} %{$fg[yellow]%}%#%{%{$reset_color%}%} "
}
