highlight OverLength ctermbg=black ctermfg=darkgray guibg=#592929
match OverLength /\%81v.*/

set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=80
set smarttab
set expandtab

nmap <F9> :wa<CR>:!/usr/bin/env ruby%<CR>
