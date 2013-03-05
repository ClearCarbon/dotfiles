Bundle 'kien/ctrlp.vim'

map <leader>z :ClearCtrlPCache<cr>\|:CtrlP /usr/share/php/libzend-framework-php/<cr>
" Open files with <leader>f
map <leader>f :CtrlP<cr>

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

let g:ctrlp_custom_ignore = {
      \ 'dir':  'tmp\|\.git$\|system$',
      \ 'file': '\.jpg$\|\.png$\|\.gif$',
      \ }
let g:ctrlp_max_height = 20
