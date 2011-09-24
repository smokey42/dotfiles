set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle Bundle manager. Great stuff.
" https://github.com/gmarik/vundle
Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'The-NERD-tree'
Bundle 'FuzzyFinder'

Bundle 'tpope/vim-fugitive'
Bundle 'kevinw/pyflakes-vim'
Bundle 'UltiSnips'

syntax on
filetype plugin indent on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab
set novisualbell
set noerrorbells
set smartindent
set ruler
set number
set autoread
set more
set ttyfast
set cursorline
set magic

" Color scheme with 256 colors
" => needs the ncurses-term package under Ubuntu
color leo

" Thank you FunnyMan3595
" Visualize tabs and trailing whitespaces
" http://www.reddit.com/r/programming/comments/9wlb7/proggitors_do_you_like_the_idea_of_indented/c0esam1
set list
set lcs=tab:»·   "show tabs
set lcs+=trail:· "show trailing spaces

set completefunc=VjdeCompleteFun0

" Will allow you to use :w!! to write to a file using sudo if you forgot to sudo
" vim file (it will prompt for sudo password when writing)
" http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/96492#96492
cmap w!! %!sudo tee > /dev/null %

" Save and run current file
map <silent> <F5> <esc>:w<CR><esc>:!./%<CR>

" Toggle copy and pastemode, echoing current status
map <silent> <F7> :set invnumber invpaste invlist paste?<CR>

" vim-fugitive: git commit
map <silent> <F12> :Gcommit<CR>

" Reload changes to .vimrc automatically
autocmd BufWritePost  ~/.vimrc source ~/.vimrc
