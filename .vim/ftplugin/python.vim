" Python: Settings for python.vim
let python_highlight_all = 1

"set makeprg=/usr/bin/env\ python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
"set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"autocmd BufWritePost,FileWritePost *.py make

highlight OverLength ctermbg=black ctermfg=darkgray guibg=#592929
match OverLength /\%81v.*/

nmap <F5> :SyntasticToggleMode<CR>:wa<CR>:SyntasticToggleMode<CR>:!/usr/bin/env py.test -v -s --doctest-modules --capture=no %<CR>
nmap <F9> :SyntasticToggleMode<CR>:wa<CR>:SyntasticToggleMode<CR>:!/usr/bin/env python %<CR>
nmap <f8> :SyntasticToggleMode<CR>:wa<CR>:SyntasticToggleMode<CR>:!flake8 %<CR>

set wildignore+=*.pyc
