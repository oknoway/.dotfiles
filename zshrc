# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="oknoway"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias scp="noglob scp"
alias bower="noglob bower"
alias npm="noglob npm"
alias sass="noglob sass"

if [[ $('uname') == 'Darwin' ]]; then

	# colorize ls
	alias ls="ls -AGl"
	
	# Repair LaunchServices
	alias fixopenwith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"
	
	# brew upgrade
	alias bup="brew update && brew upgrade"

	# cd to active Finder window
	cdf() {
		cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
	}

elif [[ $('uname') == 'Linux' ]]; then
	alias update='sudo apt-get update'
	alias upgrade='sudo apt-get upgrade'
	alias aptdate='sudo aptitude update'
	alias aptgrade='sudo aptitude upgrade'

	# colorize ls
	alias ls="ls -Al"
	
	# s/mate/rmate
	alias mate="rmate"

fi


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh-syntax-highlighting autojump bower emoji-clock git github gnu-utils history history-substring-search jira jump npm osx pip python sublime terminalapp vagrant)

source $ZSH/oh-my-zsh.sh

if [[ $('uname') == 'Darwin' ]]; then
	
	# Mac Constants
	export CODAPATH="/Users/nateb/Applications/Coda\ 2.app:"
	export SVN_EDITOR="mate"
	export PYTHONPATH=/usr/local/lib/python2.7/site-packages
	export GEM_HOME=/usr/local/opt/ruby/bin/
	export GEM_PATH=/usr/local/opt/ruby/bin/:
	export NODE_PATH=/usr/local/lib/node_modules
	export GISTY_DIR="$HOME/Documents/Source/gists"
	export GISTY_ACCESS_TOKEN=103b1666516255e4254b679cc977331fb89717e4
	export HOMEBREW_GITHUB_API_TOKEN=d29246442f0097ec4ef24f4af09475cbc324ba4b

elif [[ $('uname') == 'Linux' ]]; then
	# should do some exports here.

fi

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/include:/usr/local/mysql/bin:/usr/local/lib/node_modules:/usr/local/share/npm/bin:/usr/local/opt/ruby/bin:/usr/local/opt/ruby/bin/bin:/Library/Developer/CommandLineTools/usr/bin:$HOME/.composer/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH