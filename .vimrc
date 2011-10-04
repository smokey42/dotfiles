set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle Bundle manager. Great stuff.
" https://github.com/gmarik/vundle
"
" If there is a slash in the bundle-name
" it automatically installs from GitHub.
Bundle 'gmarik/vundle'

" Tree navigator thingie
Bundle 'The-NERD-tree'
Bundle 'L9'

Bundle 'FuzzyFinder'

" Graphing your undo tree in style
Bundle 'Gundo'

" The best git plugin of the world
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'

" Language specific stuff
Bundle 'Jinja'
Bundle 'sukima/xmledit'
Bundle 'ervandew/supertab'

" Supertab settings
" " supertab + eclim == java win
let g:SuperTabDefaultCompletionTypeDiscovery = [
\ "&completefunc:<c-x><c-u>",
\ "&omnifunc:<c-x><c-o>",
\ ]
let g:SuperTabLongestHighlight = 1

" Textmate like snippets. Handy.
Bundle 'UltiSnips'

" 256 color scheme
" => needs the ncurses-term package under Ubuntu
Bundle 'leo256'

syntax on
color leo

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
set ttyfast
set autoread
set more
set cursorline
set magic

" Thank you FunnyMan3595
" Visualize tabs and trailing whitespaces
" http://www.reddit.com/r/programming/comments/9wlb7/proggitors_do_you_like_the_idea_of_indented/c0esam1
set list
set lcs=tab:»·   "show tabs
set lcs+=trail:· "show trailing spaces

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
