filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" more secure
set modelines=0

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" not bothered about vi compatibility
set nocompatible

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on

set smarttab
set autoindent
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

" increase command history
set history=1000

" show the $ at the end of word changes etc
set cpoptions+=$

" search highlights on, and dynamic searching
set hlsearch
set incsearch
nnoremap <leader><space> :noh<cr>

" The following will make tabs and trailing
" spaces visible when requested
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<cr>

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

" auto switch to folder where editing file
"autocmd BufEnter * cd %:p:h

" map F2 to toggle nerd tree
map <F2> :NERDTreeToggle<cr>

map <F3> :TlistToggle<cr>

map <F4> :TMiniBufExplorer<cr>

nnoremap <silent> <F5> :YRShow<cr>
inoremap <silent> <F5> <ESC>:YRShow<cr>

" map leader-W to strip white space
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" map for ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack

" fold html tag
nnoremap <leader>ft Vatzf

" open vimrc in vertically split window
nnoremap <leader>rc <C-w><C-v><C-l>:e $MYVIMRC<cr>

" double j for escape
inoremap jj <ESC>

" reselect the text that was just pasted
nnoremap <leader>v V`]

" Look for the file in the current directory,
" then south until you reach home.
set tags=tags;~/

" Who needs .gvimrc?
if has('gui_running')
  set encoding=utf-8
  "set guifont=Monospace\ Bold\ 9
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
  " Turn off toolbar and menu
  set guioptions-=T
  set guioptions-=m
  colorscheme molokai
  " colorscheme vividchalk
  " colorscheme inkpot
  " coloscheme xoria256
  " colorscheme ir_black
else
  " colorscheme ir_black
end

" Very magic regexes in searches
nnoremap / /\v
vnoremap / /\v

" use tab to move around brackets
"nnoremap <tab> %
"vnoremap <tab> %

" dont use cursor keys!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" makes j and k work the way you expect
nnoremap j gj
nnoremap k gk

" make ; do the same thing as :
nnoremap ; :

" save on losing focus
"au FocusLost * :wa
" turned off to control when to trigger an autotest

" avoid pressing F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" handle long lines
"set wrap
"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=85


" cut/copy/paste
vmap <C-x> "+c
vmap <C-c> "+yi
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" fix a recent bug in commandT
"nmap <unique> <silent> <Leader>r :CommandT<CR>

autocmd BufRead *.phtml set filetype=xml

" defaults
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

set clipboard=unnamed

"autocmd Filetype sh set ts=4 shiftwidth=2 expandtab
"autocmd Filetype ruby,xml,html set ts=8 shiftwidth=2 expandtab
"autocmd Filetype python set ts=4 shiftwidth=4 expandtab
"autocmd Filetype xml,xslt,diff,ruby color desert
"autocmd Filetype xml,xslt,diff,ruby set expandtab

" php extras

" highlights interpolated variables in sql strings
" and does sql-syntax highlighting. yay
"autocmd FileType php let php_sql_query=1
" does exactly that. highlights html inside of php strings
"autocmd FileType php let php_htmlInStrings=1
" discourages use oh short tags. c'mon its deprecated remember
"autocmd FileType php let php_noShortTags=1
" automagically folds functions & methods.
"autocmd FileType php let php_folding=1

" set "make" command when editing php files
set makeprg=php\ -l\ %
"set errorformat=%m\ in\ %f\ on\ line\ %l

" set auto-highlighting of matching brackets for php only
"autocmd FileType php DoMatchParen
"autocmd FileType php hi MatchParen ctermbg=blue guibg=lightblue

" autocomplete funcs and identifiers for languages
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

" Indent XML readably
"function! DoPrettyXML()
"	1,$!xmllint --format --recover -
"endfunction
"command! PrettyXML call DoPrettyXML()

nmap <Leader>f :% ! ~/.vim/phpCB --space-after-if --space-after-switch --space-after-while --one-true-brace-function-declaration --extra-padding-for-case-statement --change-shell-comment-to-double-slashes-comment --force-true-false-null-contant-lowercase --align-equal-statements --comment-rendering-style PHPDoc<CR>

" Minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 1


" show the statusline all the time
set laststatus=2

" save undo history in file
set undofile

" add some stuff to the statusline
" removed this %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\
" because vim-rails didnt like it
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{fugitive#statusline()}
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_fugitive')?fugitive#statusline():''}%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P

if has("autocmd")
  au BufNewFile,BufRead *.mustache set syntax=mustache
endif

