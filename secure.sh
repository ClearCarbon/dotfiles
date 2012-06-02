#!/usr/bin/env sh

# A script to create a bash shell with a
# certain dir decrypted using gpg-zip
# then on exit encrypt again and remove
# at any one time there will be up to
# 3 archives, the current, the bak and the
# bak~ mv backup

# if the archive exists decrypt it
if [ -f wiki.gpg.tar ] 
then
  gpg-zip --decrypt wiki.gpg.tar
fi

# start a shell for working with the decrypted files
bash

# if the archive exists back it up
if [ -f wiki.gpg.tar ] 
then
  mv -b wiki.gpg.tar wiki.gpg.tar.bak
fi

# encrypt the file with no existing archive
gpg-zip --encrypt --gpg-args "-r $GPGKEY" --tar-args "--verbose" --output wiki.gpg.tar wiki

# remove the insecure files
rm -rf wiki
