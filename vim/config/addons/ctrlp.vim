Bundle 'kien/ctrlp.vim'

map <leader>z :ClearCtrlPCache<cr>\|:CtrlP /usr/share/php/libzend-framework-php/<cr>
map <leader>f :CtrlP<cr>
map <leader>r :CtrlPMRU<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>gf :ClearCtrlPCache<cr>\|:CtrlP %%<cr>

let g:ctrlp_max_files=99999
let ctrlp_filter_greps = "".
    \ "egrep -iv '\\.(" .
    \ "jar|swp|swo|so|o|pyc|jpe?g|png|gif|mo|po" .
    \ ")$' | " .
    \ "egrep -v '^(\\./)?(" .
    \ "deploy/|lib/|deploy/vendor/|.git/|.hg/|.svn/" .
    \ ")'"
 
if has("unix")
    let my_ctrlp_user_command = "" .
    \ "find %s '(' -type f -or -type l ')' -maxdepth 15 -not -path '*/\\.*/*' | " .
    \ ctrlp_filter_greps
endif
 
let g:ctrlp_custom_ignore = {
      \ 'dir':  'vendor\|tmp\|\.git$\|system$',
      \ 'file': '\.jpg$\|\.png$\|\.gif$',
      \ }
let g:ctrlp_max_height = 20
