#!/bin/bash

file=.bitlyrc

if [ ! -f $HOME/$file ]
then 
  echo "$HOME/$file not found, doing nothing"
  exit
fi

if [ $# -ne 1 ]
then
  echo "Usage: $0 longurl"
  exit 65
fi

while read -r username; read -r key
do
  # encode every character in the long url
  longurl=`echo -ne $1 | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g'`
  url="https://api-ssl.bitly.com/v3/shorten?format=txt&login=$username&apiKey=$key&longUrl=$longurl"
  curl -s $url
done < $HOME/$file
