# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="oknoway_mac"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


case 'uname' in
    Darwin)
        alias stink='say "you stink"'
        ;;
    Linux)
        alias update='sudo aptitude update'
        alias upgrade='sudo aptitude upgrade'
        ;;
esac


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial autojump python pip github gnu-utils history-substring-search osx sublime terminalapp cloudapp)

# http://superuser.com/questions/313650/resume-zsh-terminal-os-x-lion/315029#answer-328148
# Tell the terminal about the working directory whenever it changes.
if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]]; then

    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL, including
        # the host name to disambiguate local vs. remote paths.

        # Percent-encode the pathname.
        local URL_PATH=''
        {
            # Use LANG=C to process text byte-by-byte.
            local i ch hexch LANG=C
            for ((i = 1; i <= ${#PWD}; ++i)); do
                ch="$PWD[i]"
                if [[ "$ch" =~ [/._~A-Za-z0-9-] ]]; then
                    URL_PATH+="$ch"
                else
                    hexch=$(printf "%02X" "'$ch")
                    URL_PATH+="%$hexch"
                fi
            done
        }

        local PWD_URL="file://$HOST$URL_PATH"
        #echo "$PWD_URL"        # testing
        printf '\e]7;%s\a' "$PWD_URL"
    }

    # Register the function so it is called whenever the working
    # directory changes.
    autoload add-zsh-hook
    add-zsh-hook chpwd update_terminal_cwd

    # Tell the terminal about the initial directory.
    update_terminal_cwd
fi

source $ZSH/oh-my-zsh.sh

#source `brew --prefix git`/etc/bash_completion.d/git-completion.bash

export CODAPATH="/Users/nateb/Applications/Coda 2.app:"
export SVN_EDITOR="subl"
export PYTHONPATH=/usr/local/lib/python2.7/site-packages
export GEM_HOME=/usr/local/Cellar/ruby/1.9.3-p327/lib/ruby/gems/1.9.1
export GEM_PATH=/usr/local/Cellar/ruby/1.9.3-p327/lib/ruby/gems/1.9.1
export NODE_PATH=/usr/local/lib/node_modules

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/include:/usr/local/mysql/bin:/usr/local/lib/node_modules:/usr/local/Cellar/ruby/1.9.3-p327/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin
