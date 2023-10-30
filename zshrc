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

# export DEFAULT_USER="$USER"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias scp="noglob scp"
alias npm="noglob npm"
alias sass="noglob sass"

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '📋Public key copied to pasteboard.\n'";

# autoload zmv

  # colorize ls
  alias ls="ls -AGlh"

  # brew zsh-completion
  # autoload -U +X compinit && compinit
  # fpath=(/usr/local/share/zsh-completions $fpath)
  # source /usr/local/share/zsh/site-functions/*

  #autojump
  # [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh


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

if [[ "$OSTYPE" = darwin* ]]; then

  # Mac Constants
  export SVN_EDITOR="atom"
  export GEM_HOME=/usr/local/opt/ruby/bin/
  export GEM_PATH=/usr/local/opt/ruby/bin/
  export NODE_PATH=/usr/local/lib/node_modules
  export GOPATH=/usr/local/share/go
  export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
  export PYENV_ROOT=/usr/local/var/pyenv
fi

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
ZSH_THEME="spaceship-prompt/spaceship"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(certbot4osx comix gif-from-tweet iterm-img vmnatdnshost zsh-autosuggestions autojump  battery brew catimg dirhistory frontend-search git git-extras gnu-utils history history-substring-search httpie iterm2 jump ng node npm macos pip python yarn z)

else
  ZSH_THEME="agnoster"
  plugins=(certbot4osx comix gif-from-tweet iterm-img vmnatdnshost zsh-autosuggestions autojump  battery brew catimg dirhistory frontend-search git git-extras gnu-utils history history-substring-search httpie iterm2 jump ng node npm macos pip python yarn z)

fi

source $ZSH/oh-my-zsh.sh


source ~/.zprofile
