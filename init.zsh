#!/bin/zsh

# gemrc
if [ ! -e ~/.gemrc ]; then
  ln -s ~/.dotfiles/gemrc ~/.gemrc
fi

# screenrc
if [ ! -e ~/.screenrc ]; then
  ln -s ~/.dotfiles/screenrc ~/.screenrc
fi

# tmux
if [ ! -e ~/.tmux.conf ]; then
  ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
fi
if [ ! -e ~/.tmux ]; then
  ln -s ~/.dotfiles/tmux ~/.tmux
fi

# atom
if [ ! -e ~/.atom/config.cson ]; then
  ln -s ~/.dotfiles/atom/config.cson ~/.atom/config.cson
fi
if [ ! -e ~/.atom/init.coffee ]; then
  ln -s ~/.dotfiles/atom/init.coffee ~/.atom/init.coffee
fi
if [ ! -e ~/.atom/keymap.cson ]; then
  ln -s ~/.dotfiles/atom/keymap.cson ~/.atom/keymap.cson
fi
if [ ! -e ~/.atom/styles.less ]; then
  ln -s ~/.dotfiles/atom/styles.less ~/.atom/styles.less
fi

# ackrc
if [ ! -e ~/.ackrc ]; then
  ln -s ~/.dotfiles/ackrc ~/.ackrc
fi

# git
if [ ! -e ~/.gitconfig ]; then
  ln -s ~/.dotfiles/gitconfig ~/.gitconfig
fi

if [ ! -e ~/.gitignore ]; then
  ln -s ~/.dotfiles/gitignore ~/.gitignore
fi

# iTerm
if [ ! -e ~/.iterm ]; then
  ln -s ~/.dotfiles/iterm ~/.iterm
fi

# Hyper
if [ ! -e ~/.hyper.js ]; then
  ln -s ~/.dotfiles/hyper.js ~/.hyper.js
fi

# textmate
if [ ! -e ~/.tm_properties ]; then
  ln -s ~/.dotfiles/tm_properties ~/.tm_properties
fi

# multitail
if [ ! -e ~/.multitailrc ]; then
  ln -s ~/.dotfiles/multitailrc ~/.multitailrc
fi

# curl
if [ ! -e ~/.curlrc ]; then
  ln -s ~/.dotfiles/curlrc ~/.curlrc
fi

# wp-cli
if [ ! -e ~/.wp-cli/config.yml ]; then
  ln -s ~/.dotfiles/wp-cli.config.yml ~/.wp-cli/config.yml
fi

# Submodules
git submodule status | grep '^\-.*'
if [ "$?" = "0" ]; then
  git submodule init
  git submodule update
fi

# oh-my-zsh
if [ ! -e ~/.oh-my-zsh ]; then
  ln -s ~/.dotfiles/oh-my-zsh ~/.oh-my-zsh
fi

if [ ! -e ~/.zshrc ]; then
  ln -s ~/.dotfiles/zshrc ~/.zshrc
fi

if [ ! -e ~/.zshenv ]; then
  ln -s ~/.dotfiles/zshenv ~/.zshenv
fi
