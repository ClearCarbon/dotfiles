Bundle 'skalnik/vim-vroom'

let g:vroom_map_keys = 0
let g:vroom_detect_spec_helper = 1
silent! map <unique> <Leader>t :VroomRunTestFile<CR>
silent! map <unique> <Leader>T :VroomRunNearestTest<CR>
