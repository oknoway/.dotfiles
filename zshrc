# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="oknoway"

POWERLEVEL9K_MODE="awesome-fontconfig"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="⚡️ "
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M:%S}"

POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_with_package_name"

POWERLEVEL9K_HIDE_BRANCH_ICON=false
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_VCS_SHOW_SUBMODULE_DIRTY=false

POWERLEVEL9K_RAM_ELEMENTS=(ram_free)

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ram load time)
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

  # brew zsh-completion
  fpath=(/usr/local/share/zsh-completions $fpath)

  # aws autocompletion
  source /usr/local/share/zsh/site-functions/_aws

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
plugins=(zsh-syntax-highlighting autojump aws brew brew-cask bower catimg dirhistory frontend-search git git-extras gnu-utils history history-substring-search httpie jump npm osx pass pip python sublime terminalapp textmate vagrant wp-cli z)

source $ZSH/oh-my-zsh.sh

source ~/.zprofile

if [[ "$OSTYPE" = darwin* ]]; then

  # Mac Constants
  export CODAPATH="/Users/nateb/Applications/Coda\ 2.app:"
  export SVN_EDITOR="atom"
  export PYTHONPATH=/usr/local/lib/python2.7/site-packages
  export GEM_HOME=/usr/local/opt/ruby/bin/
  export GEM_PATH=/usr/local/opt/ruby/bin/:
  export NODE_PATH=/usr/local/lib/node_modules
  export GISTY_DIR="$HOME/Documents/Source/gists"
  export GISTY_ACCESS_TOKEN=103b1666516255e4254b679cc977331fb89717e4
  export HOMEBREW_GITHUB_API_TOKEN=02db06fbbbf9618665195f4ccc50c90bfedeb8fc

elif [[ "$OSTYPE" = linux* ]]; then

  # Linux constants
  export GISTY_DIR="$HOME/Documents/Source/gists"
  export GISTY_ACCESS_TOKEN=103b1666516255e4254b679cc977331fb89717e4

fi

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/include:/usr/local/opt/mysql55/bin:/usr/local/lib/node_modules:/usr/local/share/npm/bin:/usr/local/opt/ruby/bin:/usr/local/opt/ruby/bin/bin:/Library/Developer/CommandLineTools/usr/bin:$HOME/.composer/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH
