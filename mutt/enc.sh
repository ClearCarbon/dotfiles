#!/bin/bash
echo $1 | gpg -r $GPGKEY -e > $2
