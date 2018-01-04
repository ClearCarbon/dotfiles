#!/bin/bash
# DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=~/dotfiles
echo DIR
for file in vimrc tmux.conf bash_profile bashrc ackrc vim bash gitignore tmx liquidpromptrc ansible.cfg gemrc
do
  if [ -e $HOME/.${file} ]
  then echo ".$file found, doing nothing"
  else ln -sf $DIR/$file $HOME/.$file && echo ".$file installed"
  fi
done

# files we want to overwrite no matter what
for file in zshrc
do
  if [ \( -f "${file}" \) ]
  then mv $HOME/.$file $HOME/.$file.old && echo "existing .$file backed up to .$file.old"
  fi
  ln -sf $DIR/$file $HOME/.$file && echo ".$file installed"
done

# gitconfig
if [ -e $HOME/.gitconfig ]
then echo ".gitconfig found, doing nothing"
else
  echo "Git Details"
  echo "-----------"
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
