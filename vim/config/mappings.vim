let mapleader = ","
let g:mapleader = ","

" Don't use Ex mode, use Q for formatting
map Q gq

" clear search buffer 
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <esc><esc> :nohlsearch<cr><esc>

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

"reverse paste mode
nnoremap <leader>p :set paste!<cr>

"vs and hs splits
nnoremap <leader>vs :vs<cr>:bn<cr>
nnoremap <leader>hs :sp<cr>:bn<cr>

" Fast saving
nmap <leader>w :w!<cr>

" map leader-W to strip white space
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Edit or view files in same directory as current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%

" Switch between the last two files
nnoremap <leader><leader> <c-^>

nnoremap <leader>q gqip
