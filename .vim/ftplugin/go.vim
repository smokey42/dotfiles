set tabstop=8
set softtabstop=8
set shiftwidth=8
set nosmarttab
set noexpandtab

set listchars=nbsp:¬,trail:·,tab:\ \ 

nmap <F9> :wa<CR>:!/usr/bin/env go build % && ./%<<CR>

