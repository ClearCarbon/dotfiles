call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Not bothered about vi compatibility
" This must be first, because it changes other options as side effect
set nocompatible
" set term=ansi

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

set number

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
" nmap <silent> <leader>e <C-w><C-v><C-l>:e $MYVIMRC<CR>
" nmap <silent> <leader>v :so $MYVIMRC<CR>

" Very magic regexes in searches
" nnoremap / /\v
" vnoremap / /\v

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
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" makes j and k work the way you expect
nnoremap j gj
nnoremap k gk

" make ; do the same thing as :
nnoremap ; :

" handle long lines
set nowrap
"set wrap
set textwidth=80
"set formatoptions=qrn1
" set colorcolumn=80
" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"   autocmd BufEnter * match OverLength /\%80v.*/
" augroup END

" cut/copy/paste
vmap <C-c> "+c
vmap <C-y> "+yi
vmap <C-p> c<ESC>"+p
imap <C-p> <ESC>"+pa

"map leader-W to strip white space
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
" https://destroyallsoftware.com/file-navigation-in-vim.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open files with <leader>f
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
" Open files, limited to the directory of the current file, with <leader>gf
" This requires the %% mapping found below.
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>

" Rails specific
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>
map <leader>gj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

" Show the current routes in the split
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! bundle exec rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

" Edit or view files in same directory as current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Switch between the last two files
nnoremap <leader><leader> <c-^>

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!bundle exec rspec " . a:filename
endfunction

" Run only the tests you want while moving around
function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_spec_file = match(expand("%"), '_spec.rb$') != -1
  if in_spec_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
" map <leader>T :call RunNearestTest()<cr>
" Run all test files
map <leader>T :call RunTests('spec')<cr>

set winwidth=100
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will fail.
set winheight=5
set winminheight=5
set winheight=999

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unused mappings ATM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The following will make tabs and trailing
" spaces visible when requested
"set listchars=tab:>-,trail:·,eol:$
"nmap <silent> <leader>s :set nolist!<cr>

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
" Ruby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
  autocmd BufNewFile,BufRead Rakefile,*.rake,*.pill,Capfile,Gemfile,config.ru,Guardfile setfiletype ruby
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
  autocmd BufRead *.phtml set filetype=xml
  " highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
  autocmd FileType php let php_sql_query=1
  " does exactly that. highlights html inside of php strings
  autocmd FileType php let php_htmlInStrings=1
  " discourages use oh short tags. c'mon its deprecated remember
  "autocmd FileType php let php_noShortTags=1
  " automagically folds functions & methods.
  "autocmd FileType php let php_folding=1

  " auto switch to folder where editing file
  "autocmd BufEnter * cd %:p:h

  " set auto-highlighting of matching brackets for php only
  "autocmd FileType php DoMatchParen
  "autocmd FileType php hi MatchParen ctermbg=blue guibg=lightblue
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
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
  autocmd BufNewFile,BufRead *.jst set syntax=eruby
  autocmd BufReadPost fugitive://* set bufhidden=delete
  autocmd BufNewFile,BufRead *.md,*.markdown,README,*.txt set spell
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
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"colorscheme solarized
colorscheme peaksea
" If need be use this
if has('gui_running')
else
end

