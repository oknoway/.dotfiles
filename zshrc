# Force locale for some reason
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.dotfiles/zsh_custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="oknoway"


POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

POWERLEVEL9K_OS_ICON_BACKGROUND="blue"
POWERLEVEL9K_OS_ICON_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_BACKGROUND="207"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="207"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="207"
POWERLEVEL9K_NVM_FOREGROUND="black"
POWERLEVEL9K_NVM_BACKGROUND="045"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_with_package_name"

POWERLEVEL9K_SHOW_CHANGESET=false
POWERLEVEL9K_VCS_SHOW_SUBMODULE_DIRTY=false
POWERLEVEL9K_VCS_HIDE_TAGS=true

POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_BATTERY_LOW_FOREGROUND="black"
POWERLEVEL9K_BATTERY_LOW_BACKGROUND="160"
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="black"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="047"
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="black"
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="047"
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="black"
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="160"
POWERLEVEL9K_BATTERY_ICON=$'\uf240 '
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)

if [ "$TERM_PROGRAM" = "Apple_Terminal" ] || [ "$TERM_PROGRAM" = "iTerm.app" ] || [ "$TERM_PROGRAM" = "Hyper" ] ; then

  POWERLEVEL9K_MODE="awesome-fontconfig"

  POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
  POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
  POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="⚡️"

  POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M:%S}"

  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir nvm vcs)
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery ram load time)

else

  POWERLEVEL9K_MODE="compatibile"

  POWERLEVEL9K_PROMPT_ON_NEWLINE=false
  POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

  POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"

  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir nvm vcs)
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery ram load time)

fi

export DEFAULT_USER="$USER"

ZSH_THEME="powerlevel9k/powerlevel9k"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias scp="noglob scp"
alias bower="noglob bower"
alias npm="noglob npm"
alias sass="noglob sass"

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'";

alias apm="apm-beta"

autoload zmv

function atom-pipe {
  ATOM_TEMP=$(mktemp /tmp/atom.XXXX)
  cat > $ATOM_TEMP
  atom --wait $ATOM_TEMP
  rm $ATOM_TEMP
}

if [[ "$OSTYPE" = darwin* ]]; then

  # colorize ls
  alias ls="ls -AGlh"

  # Repair LaunchServices
  alias fixopenwith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"

  # cd to active Finder window
  cdf() {
    cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
  }

  #android emulator
  alias droid="~/Library/Android/sdk/tools/emulator -netdelay none -netspeed full -avd Nexus_One_API_15_HWKbd"

  # arcgis vm alias
  alias arcgisvm="vmnatdnshost "

  # brew services alias
  alias service="brew services"

  # brew zsh-completion
  # autoload -U +X compinit && compinit
  # fpath=(/usr/local/share/zsh-completions $fpath)
  # source /usr/local/share/zsh/site-functions/*

  #autojump
  [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

elif [[ "$OSTYPE" = linux* ]]; then
  alias update='sudo apt-get update'
  alias upgrade='sudo apt-get upgrade'
  alias aptdate='sudo aptitude update'
  alias aptgrade='sudo aptitude upgrade'

  # colorize ls
  alias ls="ls -Alh"

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

# Add a 10 second wait before RMing with a wildcard
setopt RM_STAR_WAIT

# ZSH History options
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date: * --help";

# NVM Things
export NVM_LAZY_LOAD=false
export NVM_AUTO_USE=true

if [[ "$OSTYPE" = darwin* ]]; then

  # Mac Constants
  export SVN_EDITOR="atom-beta"
  export GEM_HOME=/usr/local/opt/ruby/bin/
  export GEM_PATH=/usr/local/opt/ruby/bin/
  export NODE_PATH=/usr/local/lib/node_modules
  export GOPATH=/usr/local/share/go
  export HOMEBREW_GITHUB_API_TOKEN=02db06fbbbf9618665195f4ccc50c90bfedeb8fc
  export PYENV_ROOT=/usr/local/var/pyenv
  export NVM_DIR="$HOME/.nvm"
fi

# $PATH: How does it work?
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/include"
export PATH="$PATH:/opt/X11/bin"
export PATH="$PATH:/Library/Developer/CommandLineTools/usr/bin"

# Likely installed by a package manager
export PATH="$PATH:/usr/local/opt/mysql/bin"
export PATH="$PATH:/usr/local/lib/node_modules"
export PATH="$PATH:/usr/local/share/npm/bin"
export PATH="$PATH:/usr/local/opt/python/libexec/bin"
export PATH="$PATH:/usr/local/opt/ruby/bin"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
export PATH="$PATH:$GOPATH/bin"

# Project Specific
export PATH="$PATH:./node_modules/.bin"

# $HOME things
export PATH="$HOME:/.composer/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"

# These old so-and-so's
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/sbin"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(certbot4osx comix gif-from-tweet iterm-img vmnatdnshost wp zsh-nvm nvm autojump aws battery brew brew-cask bower catimg dirhistory frontend-search git git-extras gnu-utils grunt history history-substring-search httpie jump ng node npm osx pass pip python sublime terminalapp textmate vagrant wp-cli yarn z zsh-completions zsh_reload zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source ~/.zprofile
