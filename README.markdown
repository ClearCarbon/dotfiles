My dotfiles, at the moment vim and tmux.  Vimrc using git submodules manage vim
plugins.  Some of the vimrc settings require vim 7.3 or greater.

I use the word 'my' loosely. All files have been patched together from many
different sources and customised to my own tastes.

## Install

1) git clone into home directory
2) cd dotfiles
3) git submodule init
4) git submodule update
5) ./install.sh

The install script is not destructive so if you want to replace the original
file, delete them first.
