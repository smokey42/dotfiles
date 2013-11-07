" Python: Settings for python.vim
let python_highlight_all = 1

"set makeprg=/usr/bin/env\ python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
"set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"autocmd BufWritePost,FileWritePost *.py make

highlight OverLength ctermbg=black ctermfg=darkgray guibg=#592929
match OverLength /\%81v.*/

nmap <F5> :wa<CR>:!/usr/bin/env python %<CR>
nmap <F9> :wa<CR>:!/usr/bin/env python %<CR>
nmap <f8> :wa<CR>:!flake8 %<CR>

set wildignore+=*.pyc
