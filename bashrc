# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/config

if [ -f ~/.bash/liquidprompt/liquidprompt ]; then
  source ~/.bash/liquidprompt/liquidprompt
fi

if [ -f ~/dotfiles/solarized/dircolors-solarized/dircolors.ansi-dark ]; then
  eval `dircolors ~/dotfiles/solarized/dircolors-solarized/dircolors.ansi-dark`
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
