
### USER ADDITIONS
function parse_git_branch() {
    git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ \1/"
}

export PS1='\[\033[01;32m\][\u\[\033[01;37m\] \W\[\033[01;33m\]$(parse_git_branch)\[\033[01;32m\]]\$\[\033[00m\] '
export CLICOLOR=1

# shortcuts for ls -l, ls -al, and ls -1
alias l="ls -lh"
alias la="ls -ahl"
alias l1="ls -1"

# cd aliases
alias ..="cd .."
