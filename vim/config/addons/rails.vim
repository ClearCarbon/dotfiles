Bundle 'tpope/vim-rails'

" insert a hash rocket with <c-l>
imap <C-r> <space>=><space>

map <leader>ga :ClearCtrlPCache<cr>\|:CtrlP app<cr>
map <leader>gv :ClearCtrlPCache<cr>\|:CtrlP app/views<cr>
map <leader>gc :ClearCtrlPCache<cr>\|:CtrlP app/controllers<cr>
map <leader>gm :ClearCtrlPCache<cr>\|:CtrlP app/models<cr>
map <leader>gh :ClearCtrlPCache<cr>\|:CtrlP app/helpers<cr>
map <leader>gl :ClearCtrlPCache<cr>\|:CtrlP lib<cr>
map <leader>gp :ClearCtrlPCache<cr>\|:CtrlP public<cr>
map <leader>gs :ClearCtrlPCache<cr>\|:CtrlP app/assets/stylesheets<cr>
map <leader>gj :ClearCtrlPCache<cr>\|:CtrlP app/assets/javascripts<cr>
map <leader>gr :e config/routes.rb<cr>
map <leader>gg :e Gemfile<cr>

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
  :exec ":normal " . line("$") . _ "
" Move cursor to bottom
  :normal 1GG
" Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

