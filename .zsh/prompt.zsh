ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}(%{$reset_color%}%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_colors%}"  

export PS1="%{$fg[blue]%}%~$(git_prompt_info) %{$fg[yellow]%}%#%{%{$reset_color%}%} "
