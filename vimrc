set nocompatible
runtime macros/matchit.vim
set modelines=0
set backspace=indent,eol,start

syntax on
filetype on
filetype plugin on
filetype indent on

set smarttab
set autoindent
set copyindent
set showcmd
set showmode

set foldlevelstart=99
set wildmenu
set wildmode=list:longest
set history=10000
set undolevels=10000
set cpoptions+=$
set number
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set cursorline
set ttyfast
set nobackup
set noswapfile
set nowb
set scrolloff=9
set ruler
set hidden
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set shiftround
set showmatch
set laststatus=2
set undofile
set undodir=~/.vim/undo
set tags+=gems.tags
set tags+=~/zend.tags
set autoread
set background=dark
set encoding=utf-8
set nowrap
set textwidth=80
set colorcolumn=80

let mapleader = ","
let g:mapleader = ","

colorscheme base16-default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't use Ex mode, use Q for formatting
map Q gq

" clear search buffer 
nnoremap <leader><space> :nohlsearch<cr>

" dont use cursor keys!
nnoremap <up> <nop>
nnoremap <down> <nop>

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

map <leader>z :ClearCtrlPCache<cr>\|:CtrlP /usr/share/php/libzend-framework-php/<cr>
" Open files with <leader>f
map <leader>f :CtrlP<cr>

"reverse paste mode
nnoremap <leader>p :set paste!<cr>

"vs and hs splits
nnoremap <leader>vs :vs<cr>:bn<cr>
nnoremap <leader>hs :sp<cr>:bn<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rails
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" map <leader>v :view %%

" reselect the text that was just pasted
nnoremap <leader>v V`]


" Run this file
let g:vroom_map_keys = 0
silent! map <unique> <Leader>t :VroomRunTestFile<CR>
silent! map <unique> <Leader>T :VroomRunNearestTest<CR>

if has("autocmd")

  augroup vimrcEx
    autocmd!

    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

  augroup END

  augroup FTOptions
    autocmd!

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ruby
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    autocmd BufNewFile,BufRead Rakefile,*.rake,*.pill,Capfile,Gemfile,config.ru,Guardfile setfiletype ruby
    autocmd BufNewFile,BufRead *.scss.erb setfiletype scss.eruby
    autocmd BufNewFile,BufRead *.js.erb setfiletype javascript.eruby
    if has("folding")
      autocmd FileType ruby set foldenable
      autocmd FileType ruby set foldmethod=syntax
      " autocmd FileType ruby set nofoldenable
      " autocmd FileType ruby set foldlevel=1
      " autocmd FileType ruby set foldnestmax=2
      autocmd FileType ruby set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
    endif

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " PHP
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    autocmd BufRead *.phtml set filetype=php
    " highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
    autocmd FileType php let php_sql_query=1
    " does exactly that. highlights html inside of php strings
    autocmd FileType php let php_htmlInStrings=1

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Other languages
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    autocmd BufNewFile,BufRead *.mustache set syntax=mustache
    autocmd BufNewFile,BufRead *.ol setfiletype lisp
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd BufNewFile,BufRead *.md,*.markdown,README,*.txt set spell
    autocmd BufNewFile,BufRead *.jst set syntax=eruby
    autocmd BufNewFile,BufRead *.jst.tpl set syntax=jst

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Omnifunc
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    autocmd FileType ruby,eruby silent! setlocal omnifunc=rubycomplete#Complete
    autocmd FileType php silent! setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType javascript silent! setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html silent! setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css,scss silent! setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml silent! setlocal omnifunc=xmlcomplete#CompleteTags

  augroup END

endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"ctrlp config
let g:ctrlp_max_files=99999
let ctrlp_filter_greps = "".
    \ "egrep -iv '\\.(" .
    \ "jar|swp|swo|so|o|pyc|jpe?g|png|gif|mo|po" .
    \ ")$' | " .
    \ "egrep -v '^(\\./)?(" .
    \ "deploy/|lib/|deploy/vendor/|.git/|.hg/|.svn/" .
    \ ")'"
 
let my_ctrlp_git_command = "" .
    \ "cd %s && git ls-files | " .
    \ ctrlp_filter_greps
 
if has("unix")
    let my_ctrlp_user_command = "" .
    \ "find %s '(' -type f -or -type l ')' -maxdepth 15 -not -path '*/\\.*/*' | " .
    \ ctrlp_filter_greps
endif
 
let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command, my_ctrlp_user_command]

" map for ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'active_filetypes': ['ruby', 'php'],
      \ 'passive_filetypes': [] }

let g:ctrlp_custom_ignore = {
      \ 'dir':  'tmp\|\.git$\|system$',
      \ 'file': '\.jpg$\|\.png$\|\.gif$',
      \ }
let g:ctrlp_max_height = 20

let g:buffergator_suppress_keymaps = 1
let g:vroom_detect_spec_helper = 1
let g:slime_target = "tmux"

" add trailing white space indicator to power line
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
let g:Powerline_symbols = 'unicode'

" this is for the switch plugin
nnoremap - :Switch<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additionals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif


"auto writ edirectory
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
