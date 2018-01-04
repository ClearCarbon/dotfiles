export ZSH=/home/chris/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(
  git autojump
)

source $ZSH/oh-my-zsh.sh

# User configuration

eval `dircolors /home/chris/.dir_colors/dircolors`
source ~/dotfiles/bashrc

prompt_context() {}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
