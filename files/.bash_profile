# import local configs if present
if [ -f ~/.bash_local ]; then
   source ~/.bash_local
fi

if [ -f ~/.bashrc ]; then 
    source ~/.bashrc 
fi

# Better history
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

function parse_git_deleted {
  [[ $(git status --ignore-submodules 2> /dev/null | grep deleted:) != "" ]] && echo "-"
}
function parse_git_added {
  [[ $(git status --ignore-submodules 2> /dev/null | grep "Untracked files:") != "" ]] && echo '+'
}
function parse_git_modified {
  [[ $(git status --ignore-submodules 2> /dev/null | grep modified:) != "" ]] && echo "*"
}
function parse_git_dirty {
  echo "$(parse_git_added)$(parse_git_modified)$(parse_git_deleted)"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\(\1$(parse_git_dirty)\)/"
}
function parse_ruby_version {
  echo $RUBY_VERSION | sed -e "s/^ruby\-//"
}

PS1='[\u@\H]\[\033[01;34m\]\w\[\033[00m\]$(parse_git_branch)$ '
