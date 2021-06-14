# $PATH: How does it work?
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/local/include"
export PATH="$PATH:/opt/X11/bin"
export PATH="$PATH:/Library/Developer/CommandLineTools/usr/bin"

# Likely installed by a package manager
export PATH="$PATH:/usr/local/opt/mysql/bin"
export PATH="$PATH:/usr/local/lib/node_modules"
export PATH="$PATH:/usr/local/share/npm/bin"
export PATH="$PATH:/usr/local/opt/python/libexec/bin"
export PATH="$PATH:/usr/local/opt/ruby/bin"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"

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
