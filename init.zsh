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

# textmate
if [ ! -e ~/.tm_properties ]; then
  ln -s ~/.dotfiles/tm_properties ~/.tm_properties
fi

# multitail
if [ ! -e ~/.multitailrc ]; then
  ln -s ~/.dotfiles/multitailrc ~/.multitailrc
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

if [ ! -e ~/.zprofile ]; then
  ln -s ~/.dotfiles/zprofile ~/.zprofile
fi


cd ~/.dotfiles/zsh_custom_themes
for theme_file in *
do
  mkdir -p ~/.dotfiles/oh-my-zsh/custom/themes
  if [ ! -e ~/.dotfiles/oh-my-zsh/custom/themes/$theme_file ]; then
    ln -s ~/.dotfiles/zsh_custom_themes/$theme_file ~/.dotfiles/oh-my-zsh/custom/themes/$plugin_dir
  fi
done

cd ~/.dotfiles/zsh_custom_plugins
for plugin_dir in *
do
  mkdir -p ~/.dotfiles/oh-my-zsh/custom/plugins
  if [ ! -e ~/.dotfiles/oh-my-zsh/custom/plugins/$plugin_dir ]; then
    ln -s ~/.dotfiles/zsh_custom_plugins/$plugin_dir ~/.dotfiles/oh-my-zsh/custom/plugins/$plugin_dir
  fi
done
