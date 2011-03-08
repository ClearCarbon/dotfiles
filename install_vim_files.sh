#!/bin/bash

DOTVIM="$HOME/.vim"

if [ ! -e `which git` ]
then
  echo "You need git. Try running install_git"
  exit 0
fi

if [ ! -d $DOTVIM ]
then
  mkdir $DOTVIM
fi

get_repo() {
    gh_user=$1
    repo=$2
    echo "Checking $repo"
    if [ -d "$DOTVIM/bundle/$repo/" ]
    then
        echo "Pulling latest from $repo"
        cd $DOTVIM/bundle/$repo
        git pull origin master
        cd ..
    else
        echo "Cloning repo for $repo"
        git clone git://github.com/$gh_user/$repo.git
    fi
}

echo "Creating .vim folders if necessary"
mkdir -p $DOTVIM/{autoload,bundle,colors}
cd $DOTVIM/bundle/

tpope_repos=(rails haml git cucumber fugitive surround unimpaired abolish repeat markdown endwise vividchalk afterimage ragtag)

for r in ${tpope_repos[*]}; do
    repo="vim-$r"
    get_repo "tpope" $repo
done

echo "Installing NERDTree"
get_repo "scrooloose" "nerdtree"

echo "Installing Syntastic"
get_repo "scrooloose" "syntastic"

echo "Installing NERDCommenter"
get_repo "jc00ke" "nerdcommenter"

echo "Installing snipMate"
get_repo "msanders" "snipmate.vim"

echo "Installing vim-ruby"
get_repo "vim-ruby" "vim-ruby"

echo "Installing vim-matchit"
get_repo "mhz" "vim-matchit"

echo "Installing vim-ruby-debugger"
get_repo "astashov" "vim-ruby-debugger"

echo "Installing mustache.vim"
get_repo "jc00ke" "mustache.vim"

echo "Installing taglist.vim"
get_repo "jc00ke" "taglist.vim"

echo "Installing ack.vim"
get_repo "mileszs" "ack.vim"

echo "Installing supertab"
get_repo "tsaleh" "vim-supertab"

echo "Installing sparkup and copying the vim files"
get_repo "rstacruz" "sparkup"
cp -R sparkup/vim/ftplugin sparkup/

echo "Installing vim-yankring"
get_repo "chrismetcalf" "vim-yankring"

echo "Installing vim-rainbow"
get_repo "chrismetcalf" "vim-rainbow"

echo "Installing vim-indent-object"
get_repo "michaeljsmith" "vim-indent-object"

echo "Installing git-vim"
get_repo "motemen" "git-vim"

echo "Installing vimerl"
get_repo "oscarh" "vimerl"

echo "Installing csv"
get_repo "chrisbra" "csv.vim"

echo "Installing rvm.vim"
get_repo "csexton" "rvm.vim"

echo "Installing scss-syntax"
get_repo "cakebaker" "scss-syntax.vim"

echo "Installing vim-javascript"
get_repo "pangloss" "vim-javascript"

echo "Installing vim_format-js"
get_repo "ZeusTheTrueGod" "vim-format-js"

echo "Installing vim-textobj-user"
get_repo "kana" "vim-textobj-user"

echo "Installing vim-textobj-rubyblock"
get_repo "nelstrom" "vim-textobj-rubyblock"

echo "Installing vim-jquery"
get_repo "itspriddle" "vim-jquery"

echo "Installing xoria256"
get_repo "guns" "xoria256.vim"

echo "Installing ir_black"
get_repo "wgibbs" "vim-irblack"

echo "Installing molokai"
get_repo "andyferra" "molokai"

echo "Installing minibufexplorerpp"
get_repo "vim-scripts" "minibufexplorerpp"

echo "Installing vim-ruby-refactoring"
get_repo "ecomba" "vim-ruby-refactoring"

echo "Installing vim-coffee-script"
get_repo "kchmck" "vim-coffee-script"

echo "Installing Command-T"
get_repo "wincent" "Command-T"
cd Command-T
rvm system
rake make
cd ..


#cd $DOTVIM/colors
#echo "Fetching color schemes"
#wget --no-check-certificate https://github.com/tomasr/dotfiles/raw/master/.vim/colors/molokai.vim
#wget --no-check-certificate https://github.com/tomasr/dotfiles/raw/master/.vim/colors/earendel.vim
#wget --no-check-certificate https://github.com/tomasr/dotfiles/raw/master/.vim/colors/gentooish.vim
#wget --no-check-certificate https://github.com/tomasr/dotfiles/raw/master/.vim/colors/inkpot.vim
#wget --no-check-certificate https://github.com/tomasr/dotfiles/raw/master/.vim/colors/jellybeans.vim
#wget --no-check-certificate https://github.com/tomasr/dotfiles/raw/master/.vim/colors/liquidcarbon.vim
#wget --no-check-certificate https://github.com/tomasr/dotfiles/raw/master/.vim/colors/moria.vim
#wget --no-check-certificate https://github.com/tomasr/dotfiles/raw/master/.vim/colors/twilight.vim
#wget --no-check-certificate https://github.com/tomasr/dotfiles/raw/master/.vim/colors/wombat.vim
#wget --no-check-certificate https://github.com/tomasr/dotfiles/raw/master/.vim/colors/zenburn.vim

cd $DOTVIM/autoload
echo "Fetching latest pathogen.vim"
rm pathogen.vim
wget --no-check-certificate https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim


echo "Checking to see if pathogen has already been added to .vimrc"
pathogen_cmd="call pathogen#runtime_append_all_bundles()"
contains=`grep "$pathogen_cmd" ~/.vimrc | wc -l`

if [ $contains == 0 ]
then
	echo "Hasn't been added, adding now."
	echo "$pathogen_cmd" >> ~/.vimrc
else
	echo "It was already added. Good to go"
fi

