#!/usr/bin/env sh

# A script to create a bash shell with a
# certain dir decrypted using gpg-zip
# then on exit encrypt again and remove
# at any one time there will be up to
# 3 archives, the current, the bak and the
# bak~ mv backup

if [ -d wiki/secure ]
then
  echo "The wiki/secure dir already exists, do something manually"
  exit
else
  # if the archive exists decrypt it
  if [ -f wiki/secure.gpg.tar ] 
  then
    echo "Found wiki/secure.gpg.tar"
    gpg-zip --decrypt wiki/secure.gpg.tar
  else
    echo "Can't find wiki/secure.gpg.tar"
  fi
fi

# start a shell for working with the decrypted files
bash

# look for the wiki/secure dir
if [ -d wiki/secure ]
then
  echo "Found wiki/secure dir"
  # if the archive exists back it up
  if [ -f wiki/secure.gpg.tar ] 
  then
    echo "Backing up wiki/secure.gpg.tar"
    mv -b wiki/secure.gpg.tar wiki/secure.gpg.tar.bak
  fi
  gpg-zip --encrypt --gpg-args "-r $GPGKEY" --tar-args "--verbose" --output wiki/secure.gpg.tar wiki/secure
  if [ $? -eq 0  ]
  then
    echo "GPG successful, removing the insecure dir"
    rm -rf wiki/secure
  else
    echo "Problem with gpg-zip"
  fi
else
  echo "Can't find wiki/secure dir"
fi
