
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ack="ack-grep -i -a"

# some sillyness from the interweb
alias rmatrix='echo -ne "\e[31m" ; while true ; do echo -ne "\e[$(($RANDOM % 2 + 1))m" ; tr -c "[:print:]" " " < /dev/urandom | dd count=1 bs=50 2> /dev/null ; done'
alias gmatrix='echo -ne "\e[32m" ; while true ; do echo -ne "\e[$(($RANDOM % 2 + 1))m" ; tr -c "[:print:]" " " < /dev/urandom | dd count=1 bs=50 2> /dev/null ; done'

alias v='gvim --remote-silent'
alias g='git'
alias be='bundle exec'

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g

export TERM=xterm-256color
export EDITOR='gvim --remote-silent'

export GPGKEY=F6D1428E

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[00m\]\u@\h\[\033[01;34m\] \W \[\033[31m\]\$(parse_git_branch) \[\033[00m\]$\[\033[00m\] "
