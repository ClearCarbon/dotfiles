set nocompatible
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

:so ~/.vim/config/basesetup.vim
:so ~/.vim/config/mappings.vim

for f in split(glob('~/.vim/config/plugins/*.vim'), '\n')
  exe 'source' f
endfor

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
