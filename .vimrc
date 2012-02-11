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

" Edit encrypted files
Bundle 'openssl.vim'

" Tree navigator thingie
Bundle 'The-NERD-tree'

if v:version >= 701
    Bundle 'L9'
    Bundle 'FuzzyFinder'
endif

" Graphing your undo tree in style
Bundle 'Gundo'

" Version control system helpers.
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'

" Syntax checking.
Bundle 'scrooloose/syntastic'

" Use the |:sign| interface to mark syntax errors
let g:syntastic_enable_signs=1

" When set to 1 the error window will be automatically
" opened when errors are detected, and closed when none
" are detected.
let g:syntastic_auto_loc_list=0

" Syntax highlighting.
Bundle 'adimit/prolog.vim'
Bundle 'Jinja'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'skammer/vim-css-color'
Bundle 'sukima/xmledit'
Bundle 'smokey42/lighttpd-syntax'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rantenki/vim-openscad'

" Edit helpers.
Bundle 'ervandew/supertab'
Bundle 'pythoncomplete'
Bundle 'UltiSnips'
Bundle 'SQLUtilities'

" Supertab settings
" " supertab + eclim == java win
let g:SuperTabDefaultCompletionTypeDiscovery = [
\ "&completefunc:<c-x><c-u>",
\ "&omnifunc:<c-x><c-o>",
\ ]
let g:SuperTabLongestHighlight = 1

" Colors
" 256 color schemes needs the ncurses-term package under Ubuntu
Bundle 'leo256'
Bundle 'borland.vim'

syntax on

"let g:solarized_termcolors=256
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
"set background=dark
"color solarized

color leo

" Cursorline aus.
set cursorline!

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

" Visualize tabs and trailing whitespaces
" http://www.reddit.com/r/programming/comments/9wlb7/proggitors_do_you_like_the_idea_of_indented/c0esam1
set list
set lcs=tab:»·   "show tabs
set lcs+=trail:· "show trailing spaces

" Starting from vim 7.3 undo can be persisted across sessions
" http://www.reddit.com/r/vim/comments/kz84u/what_are_some_simple_yet_mindblowing_tweaks_to/c2onmqe
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

" Leave insert-mode after 15 seconds of no input.
" http://www.reddit.com/r/vim/comments/kz84u/what_are_some_simple_yet_mindblowing_tweaks_to/c2ol6wd
"
" Muss in die einzelnen Filetypes, da ich so keine Emails schreiben kann. :)
" au CursorHoldI * stopinsert
" au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
" au InsertLeave * let &updatetime=updaterestore

" Breaking lines with \[enter] without having to go to insert mode (myself).
nmap <leader><cr> i<cr><Esc>

" Will allow you to use :w!! to write to a file using sudo if you forgot to sudo
" vim file (it will prompt for sudo password when writing)
" http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/96492#96492
cmap w!! %!sudo tee > /dev/null %

" Save and run current file
map <silent> <F5> <esc>:w<CR><esc>:!./%<CR>

" Toggle copy and pastemode, echoing current status
map <silent> <C-F7> :only<CR>:set invnumber invlist number?<CR>
map <silent> <F7> :set invpaste paste?<CR>i


" vim-fugitive: git commit
map <silent> <F12> :Gcommit<CR>

" Reload changes to .vimrc automatically
autocmd BufWritePost  ~/.vimrc source ~/.vimrc
