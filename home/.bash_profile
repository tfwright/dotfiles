if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="/usr/local/bin:$PATH"

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
