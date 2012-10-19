# rbenv init
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Prepend local path for homebrew
export PATH="/usr/local/bin:$PATH"

# Better history
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
