#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -d $DIR/tomorrow-theme/vim ]
then
  echo "Found tomorrow theme"
  if [ -a $DIR/vim/bundle/tomorrow ]
  then echo "vim tomorrow theme found, doing nothing"
  else ln -sf $DIR/tomorrow-theme/vim $DIR/vim/bundle/tomorrow && echo "vim tomorrow installed"
  fi
fi

for file in vimrc tmux.conf bash_profile bashrc ackrc muttrc vim bash mutt gitignore tmx offlineimaprc
do
  if [ -a $HOME/.${file} ]
  then echo ".$file found, doing nothing"
  else ln -sf $DIR/$file $HOME/.$file && echo ".$file installed"
  fi
done

# gitconfig
if [ -a $HOME/.gitconfig ]
then echo ".gitconfig found, doing nothing"
else 
  read -p "Name " name
  read -p "Email " email
  read -p "Github username " github

  # escape strings for sed
  name=$(printf "%s\n" "$name" | sed 's/[\&/]/\\&/g')
  email=$(printf "%s\n" "$email" | sed 's/[\&/]/\\&/g')
  github=$(printf "%s\n" "$github" | sed 's/[\&/]/\\&/g')
  home=$(printf "%s\n" "$HOME" | sed 's/[\&/]/\\&/g')

  # replace NAME, EMAIL, GITHUB, HOME
  sed "s/NAME/$name/g" $DIR/gitconfig | sed "s/EMAIL/$email/g" | sed "s/GITHUB/$github/g" | sed "s/HOME/$home/g" > $HOME/.gitconfig
  echo ".gitconfig installed"
fi
