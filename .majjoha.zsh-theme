# My zsh theme (partly inspired by the pure theme by @sindresorhus.
#
# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}(%{$reset_color%}%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_colors%}"  

precmd() {
  print -rPn "$fg[blue]${current_dir}${git_info}
  {$reset_color%} ${git_info}"
}

export PROMPT="$fg[yellow]› %{$reset_color%}"
