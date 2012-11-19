#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for file in vimrc tmux.conf bash_profile bashrc ackrc vim bash gitignore tmx
do
  if [ -a $HOME/.${file} ]
  then echo ".$file found, doing nothing"
  else ln -sf $DIR/$file $HOME/.$file && echo ".$file installed"
  fi
done

#term config
cp $HOME/.config/Terminal/terminalrc $HOME/.config/Terminal/terminalrc.backup
ln -sf $DIR/xfceterm/terminalrc $HOME/.config/Terminal/terminalrc

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
