
" This vimrc uses vundle, so install it first

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Not bothered about vi compatibility
" This must be first, because it changes other options as side effect
set nocompatible

filetype off " required!
set rtp+=~/.vim/vundle.git/
call vundle#rc()
filetype plugin indent on " required!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" more secure
set modelines=0

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on

set smarttab
set autoindent
" copy the previous indentation on autoindenting
set copyindent
set showcmd
set showmode

" By default, pressing <TAB> in command mode will
" choose the first possible completion with no
" indication of how many others there might be.
" The following configuration lets you see what
" your other options are
set wildmenu

" To have the completion behave similarly to a
" shell, i.e. complete only up to the point of
" ambiguity (while still showing you what your
" options are), also add the following
set wildmode=list:longest

set history=1000 " increase command history

set undolevels=1000

" show the $ at the end of word changes etc
set cpoptions+=$

" search highlights on, and dynamic searching
set hlsearch
set incsearch

" These two options, when set together, will
" make /-style searches case-sensitive only
" if there is a capital letter in the search
" expression. *-style searches continue to
" be consistently case-sensitive.
set ignorecase
set smartcase
set gdefault

" Vim is a little surly, beeping at you at
" every chance. You can either find a way to turn
" off the bell completely, or more usefully,
" make the bell visual:
" set visualbell

set cursorline
set ttyfast

" no old messy files
set nobackup
set noswapfile
set nowb

" A running gvim will always have a window
" title, but when vim is run within an xterm,
" by default it inherits the terminal’s current title.
set title

" When the cursor is moved outside the viewport of
" the current window, the buffer is scrolled by a
" single line. Setting the option below will start
" the scrolling three lines before the border,
" keeping more context around where you’re working.
set scrolloff=3

set ruler

" line numbers are relative to the current line (instead of set nu)
set relativenumber

" allow hiding buffers with pending changes
set hidden

" defaults
set tabstop=2
set expandtab
set shiftwidth=2

" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" set show matching parenthesis
set showmatch

set softtabstop=2

set clipboard=unnamed

" show the statusline all the time
set laststatus=2

" save undo history in file
set undofile
set undodir=~/.vim/undo

" add some stuff to the statusline
" removed this %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\
" because vim-rails didnt like it
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{fugitive#statusline()}
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_fugitive')?fugitive#statusline():''}%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Look for the file in the current directory,
" then south until you reach home.
"set tags=tags;~/

" save on losing focus
"au FocusLost * :wa
" turned off to control when to trigger an autotest

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source $MYVIMRC


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fast saving
nmap <leader>w :w!<cr>

nnoremap <leader><space> :noh<cr>

" Quickly edit/reload the vimrc file
" open vimrc in vertically split window
nmap <silent> <leader>e <C-w><C-v><C-l>:e $MYVIMRC<CR>
nmap <silent> <leader>v :so $MYVIMRC<CR>

" Very magic regexes in searches
nnoremap / /\v
vnoremap / /\v

" dont use cursor keys!
nnoremap <up> <nop>
nnoremap <down> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
nnoremap <right> :bn<cr>
nnoremap <left> :bp<cr>
nnoremap <C-down> <C-W>j
nnoremap <C-up> <C-W>k
nnoremap <C-left> <C-W>h
nnoremap <C-right> <C-W>l

" makes j and k work the way you expect
nnoremap j gj
nnoremap k gk

" make ; do the same thing as :
nnoremap ; :

" handle long lines
set nowrap
"set wrap
"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=85

" cut/copy/paste
vmap <C-x> "+c
vmap <C-c> "+yi
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unused mappings ATM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The following will make tabs and trailing
" spaces visible when requested
"set listchars=tab:>-,trail:·,eol:$
"nmap <silent> <leader>s :set nolist!<cr>

"map leader-W to strip white space
"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" fold html tag
"nnoremap <leader>ft Vatzf

" double j for escape
"inoremap jj <ESC>

" reselect the text that was just pasted
"nnoremap <leader>v V`]

" w!! lets you write with sudo, even after loading the file
"cmap w!! w !sudo tee % >/dev/null

" use tab to move around brackets
"nnoremap <tab> %
"vnoremap <tab> %

" Close the current buffer
"map <leader>bd :bd<cr>

" avoid pressing F1
"inoremap <F1> <ESC>
"nnoremap <F1> <ESC>
"vnoremap <F1> <ESC>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
  autocmd BufRead *.phtml set filetype=xml
  " highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
  "autocmd FileType php let php_sql_query=1
  " does exactly that. highlights html inside of php strings
  "autocmd FileType php let php_htmlInStrings=1
  " discourages use oh short tags. c'mon its deprecated remember
  "autocmd FileType php let php_noShortTags=1
  " automagically folds functions & methods.
  "autocmd FileType php let php_folding=1

  " auto switch to folder where editing file
  "autocmd BufEnter * cd %:p:h

  " set auto-highlighting of matching brackets for php only
  "autocmd FileType php DoMatchParen
  "autocmd FileType php hi MatchParen ctermbg=blue guibg=lightblue
endif


" set "make" command when editing php files
set makeprg=php\ -l\ %
"set errorformat=%m\ in\ %f\ on\ line\ %l

"nmap <Leader>f :% ! ~/.vim/phpCB --space-after-if --space-after-switch --space-after-while --one-true-brace-function-declaration
"--extra-padding-for-case-statement --change-shell-comment-to-double-slashes-comment --force-true-false-null-contant-lowercase
"--align-equal-statements --comment-rendering-style PHPDoc<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XML
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indent XML readably
"function! DoPrettyXML()
"	1,$!xmllint --format --recover -
"endfunction
"command! PrettyXML call DoPrettyXML()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other languages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
  autocmd BufNewFile,BufRead *.mustache set syntax=mustache
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
set encoding=utf-8
set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
" Turn off toolbar and menu
set guioptions-=T
set guioptions-=m
set t_Co=256

" If need be use this
if has('gui_running')
else
end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" original repos on github
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-vividchalk'
Bundle 'tpope/vim-afterimage'
Bundle 'tpope/vim-ragtag'

Bundle 'lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'csexton/rvm.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'kchmck/vim-coffee-script'

Bundle 'scrooloose/nerdcommenter'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'

" on debian/ubuntu sudo ln -s /usr/bin/ack-grep /usr/local/bin/ack
Bundle "ack.vim"
Bundle "jQuery"
Bundle "bufkill.vim"

" Colour schemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'peaksea'
"get_repo "guns" "xoria256.vim"
"get_repo "wgibbs" "vim-irblack"
"get_repo "andyferra" "molokai"

" possible future bundles
"scrooloose" "nerdtree"
"scrooloose" "syntastic"
"vim-ruby" "vim-ruby"
"mhz" "vim-matchit"
"astashov" "vim-ruby-debugger"
"jc00ke" "mustache.vim"
"jc00ke" "taglist.vim"
"tsaleh" "vim-supertab"
"chrismetcalf" "vim-yankring"
"chrismetcalf" "vim-rainbow"
"michaeljsmith" "vim-indent-object"
"chrisbra" "csv.vim"
"cakebaker" "scss-syntax.vim"
"pangloss" "vim-javascript"
"ZeusTheTrueGod" "vim-format-js"
"kana" "vim-textobj-user"
"nelstrom" "vim-textobj-rubyblock"
"sjbach" "lusty"
"ecomba" "vim-ruby-refactoring"
"vim-scripts" "bufkill.vim"
"cschlueter" "vim-mustang"
"vim-scripts" "L9"
"vim-scripts" "FuzzyFinder"
"int3" "vim-extradite"
"sjl" "gundo.vim"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map for ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unused atm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>b :LustyJuggler<CR>
" map F2 to toggle nerd tree
"map <F2> :NERDTreeToggle<cr>
"map <F3> :TlistToggle<cr>
"map <F4> :TMiniBufExplorer<cr>
"nnoremap <silent> <F5> :YRShow<cr>
"inoremap <silent> <F5> <ESC>:YRShow<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display after bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme solarized
" If need be use this
if has('gui_running')
else
end

