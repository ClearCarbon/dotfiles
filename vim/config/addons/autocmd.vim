" if has("autocmd")

"   augroup vimrcEx
"     autocmd!

"     autocmd BufReadPost *
"       \ if line("'\"") > 0 && line("'\"") <= line("$") |
"       \   exe "normal g`\"" |
"       \ endif

"   augroup END

"   augroup FTOptions
"     autocmd!

"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     " Ruby
"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     autocmd BufNewFile,BufRead Rakefile,*.rake,*.pill,Capfile,Gemfile,config.ru,Guardfile setfiletype ruby
"     autocmd BufNewFile,BufRead *.scss.erb setfiletype scss.eruby
"     autocmd BufNewFile,BufRead *.js.erb setfiletype javascript.eruby
"     if has("folding")
"       autocmd FileType ruby set foldenable
"       autocmd FileType ruby set foldmethod=syntax
"       " autocmd FileType ruby set nofoldenable
"       " autocmd FileType ruby set foldlevel=1
"       " autocmd FileType ruby set foldnestmax=2
"       autocmd FileType ruby set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
"     endif

"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     " PHP
"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"     autocmd BufRead *.phtml set filetype=php
"     " highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
"     autocmd FileType php let php_sql_query=1
"     " does exactly that. highlights html inside of php strings
"     autocmd FileType php let php_htmlInStrings=1

"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     " Other languages
"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"     autocmd BufNewFile,BufRead *.mustache set syntax=mustache
"     autocmd BufNewFile,BufRead *.ol setfiletype lisp
"     autocmd BufReadPost fugitive://* set bufhidden=delete
"     autocmd BufNewFile,BufRead *.md,*.markdown,README,*.txt set spell
"     autocmd BufNewFile,BufRead *.jst set syntax=eruby
"     autocmd BufNewFile,BufRead *.jst.tpl set syntax=jst

"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     " Omnifunc
"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"     autocmd FileType ruby,eruby silent! setlocal omnifunc=rubycomplete#Complete
"     autocmd FileType php silent! setlocal omnifunc=phpcomplete#CompletePHP
"     autocmd FileType javascript silent! setlocal omnifunc=javascriptcomplete#CompleteJS
"     autocmd FileType html silent! setlocal omnifunc=htmlcomplete#CompleteTags
"     autocmd FileType css,scss silent! setlocal omnifunc=csscomplete#CompleteCSS
"     autocmd FileType xml silent! setlocal omnifunc=xmlcomplete#CompleteTags

"   augroup END

" endif
