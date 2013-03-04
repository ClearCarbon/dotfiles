Fork of hatoishi's dot files to make them sane for myself
Vimrc using git submodules manage vim
plugins.  Some of the vimrc settings require vim 7.3 or greater.

Uses base16 as a color scheme. Please make sure your terminal settings match.
base16 details can be found at - https://github.com/chriskempson/base16

Uses a modular vim configuration. All configuration is stored in vim/config.
Plugins are in vim/config/plugins, each plugin includes both its bundle 
command and its specific configuration, along with any related plugins
(usually themes)

## Install

1) git clone into home directory
2) cd dotfiles
3) Load Vim and run :BundleInstall
4) sh install.sh

The install script will install vimrc, tmux.conf, bash_profile, bashrc, ackrc
vim folder, bash folder, gitignore, tmx folder. It will not overwrite any
existing files/folders so if you need to install them delete them first
