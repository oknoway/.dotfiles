function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '%(!.!.➜)'
}

function parse_hg_dirty {
  if [[ -n $(hg status -mard . 2> /dev/null) ]]; then
    echo "$ZSH_THEME_HG_PROMPT_DIRTY"
  fi
}

function get_nr_jobs() {
  jobs | wc -l
}

function get_load() {
  uptime | awk '{print $11}' | tr ',' ' '
}

PROMPT='%{$fg_bold[green]%}%n@%m %{$fg[cyan]%}%2c %{$fg_bold[blue]%}$(git_prompt_info)$(parse_hg_dirty)%{$fg_bold[blue]%} %{$fg_bold[red]%}$(prompt_char) % %{$reset_color%}'

RPROMPT='%{$fg_bold[red]%}[$(get_nr_jobs), $(get_load)] %{$fg_bold[green]%}%*%{$reset_color%}'

ZSH_THEME_HG_PROMPT_PREFIX="hg:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"