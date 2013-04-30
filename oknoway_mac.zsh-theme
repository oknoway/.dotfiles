function prompt_char {
	git branch >/dev/null 2>/dev/null && echo ' ⚡' && return
	echo '⚡ %(! !)'
}

function get_load() {
	uptime | awk '{print $11}' | tr ',' ' '
}

PROMPT='╭─🍔 %{$fg_bold[green]%}%n💻 %m📁 %{$fg[cyan]%}%2c%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}$(prompt_char) %
╰─%B$%b '

RPROMPT='%{$fg_bold[red]%}🚀 $(get_load)⌚ %{$fg_bold[green]%}%*%{$reset_color%}💀'

ZSH_THEME_GIT_PROMPT_PREFIX=" git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%}❌%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"