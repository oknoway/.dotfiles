# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

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
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_with_package_name"

POWERLEVEL9K_HIDE_BRANCH_ICON=false
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_VCS_SHOW_SUBMODULE_DIRTY=false

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
  POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="⚡️ "

  POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M:%S}"

  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery ram load time)

else

  POWERLEVEL9K_MODE="compatibile"

  POWERLEVEL9K_PROMPT_ON_NEWLINE=false
  POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

  POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"

  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
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

alias usephp56="sudo brew services stop php70; sudo killall php-fpm; brew unlink php70; brew link php56; sudo brew services start php56";
alias usephp70="sudo brew services stop php56; sudo killall php-fpm; brew unlink php56; brew link php70; sudo brew services start php70";

alias usenode6="brew unlink node; brew link node@6 --force";
alias usenode7="brew unlink node@6; brew link node";

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
  autoload -U +X compinit && compinit
  fpath=(/usr/local/share/zsh-completions $fpath)
  source /usr/local/share/zsh/site-functions/*

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(comix iterm-img vmnatdnshost wp certbot4osx autojump aws battery brew brew-cask bower catimg dirhistory frontend-search git git-extras gnu-utils grunt history history-substring-search httpie jump ng node npm osx pass pip python sublime terminalapp textmate vagrant wp-cli yarn z zsh-completions zsh_reload zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh

source ~/.zprofile

if [[ "$OSTYPE" = darwin* ]]; then

  # Mac Constants
  export CODAPATH="/Users/nateb/Applications/Coda\ 2.app:"
  export SVN_EDITOR="atom"
  export GEM_HOME=/usr/local/opt/ruby/bin/
  export GEM_PATH=/usr/local/opt/ruby/bin/:
  export NODE_PATH=/usr/local/lib/node_modules
  export GISTY_DIR="$HOME/Documents/Source/gists"
  export GISTY_ACCESS_TOKEN=103b1666516255e4254b679cc977331fb89717e4
  export HOMEBREW_GITHUB_API_TOKEN=02db06fbbbf9618665195f4ccc50c90bfedeb8fc
  export PYENV_ROOT=/usr/local/var/pyenv


elif [[ "$OSTYPE" = linux* ]]; then

  # Linux constants
  export GISTY_DIR="$HOME/Documents/Source/gists"
  export GISTY_ACCESS_TOKEN=103b1666516255e4254b679cc977331fb89717e4

fi

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/include:/usr/local/opt/mysql55/bin:/usr/local/lib/node_modules:/usr/local/share/npm/bin:/usr/local/opt/ruby/bin:/usr/local/opt/ruby/bin/bin:/Library/Developer/CommandLineTools/usr/bin:$HOME/.composer/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH

export PATH="$HOME/.yarn/bin:$PATH"
