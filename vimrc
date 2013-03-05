"settings required to load vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"base config
:so ~/.vim/config/basesetup.vim
:so ~/.vim/config/mappings.vim

"iterate through a named plugins directory (these often call Bundle to 
"include plugins"
for f in split(glob('~/.vim/config/addons/*.vim'), '\n')
  exe 'source' f
endfor

"if there is a machine specific vimrc then load that last
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

