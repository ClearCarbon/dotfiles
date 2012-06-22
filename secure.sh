#!/usr/bin/env sh

# A script to create a bash shell with a
# certain dir decrypted using gpg-zip
# then on exit encrypt again and remove
# at any one time there will be up to
# 3 archives, the current, the bak and the
# bak~ mv backup

if [ -d wiki ]
then
  echo "The wiki dir already exists, do something manually"
  exit
else
  # if the archive exists decrypt it
  if [ -f wiki.gpg.tar ] 
  then
    echo "Found wiki.gpg.tar"
    gpg-zip --decrypt wiki.gpg.tar
  else
    echo "Can't find wiki.gpg.tar"
  fi
fi

# start a shell for working with the decrypted files
bash

# look for the wiki dir
if [ -d wiki ]
then
  echo "Found wiki dir"
  # if the archive exists back it up
  if [ -f wiki.gpg.tar ] 
  then
    echo "Backing up wiki.gpg.tar"
    mv -b wiki.gpg.tar wiki.gpg.tar.bak
  fi
  gpg-zip --encrypt --gpg-args "-r $GPGKEY" --tar-args "--verbose" --output wiki.gpg.tar wiki
  if [ $? -eq 0  ]
  then
    echo "GPG successful, removing the insecure dir"
    rm -rf wiki
  else
    echo "Problem with gpg-zip"
  fi
else
  echo "Can't find wiki dir"
fi
