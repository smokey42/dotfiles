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

Bundle 'VimClojure'
Bundle 'tslime.vim'
Bundle 'franks42/lein-repls'
Bundle 'bling/vim-airline'

" Graphing your undo tree in style
Bundle 'Gundo'

" Version control system helpers.
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'jnwhiteh/vim-golang'

" Completion
Bundle 'davidhalter/jedi-vim'
let g:jedi#popup_select_first = 1
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0

Bundle 'ervandew/supertab'
let g:SuperTabLongestHighlight = 1

" Other helpers
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'

" Use the |:sign| interface to mark syntax errors
let g:syntastic_enable_signs=1
let g:syntastic_python_checker='flake8'
let g:syntastic_python_checker_args='--max-complexity=10'

" When set to 1 the error window will be automatically
" opened when errors are detected, and closed when none
" are detected.
let g:syntastic_auto_loc_list=0

" Syntax highlighting.
Bundle 'adimit/prolog.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Jinja'
Bundle 'scala.vim'
Bundle 'Superior-Haskell-Interaction-Mode-SHIM'
Bundle "Smart-Tabs"
Bundle 'chase/nginx.vim'
Bundle 'leshill/vim-json'
Bundle 'rantenki/vim-openscad'
Bundle 'ap/vim-css-color'
Bundle 'smokey42/lighttpd-syntax'
Bundle 'sukima/xmledit'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'

" Edit helpers.
if has("nocp")
    Bundle 'myusuf3/numbers.vim'
endif
Bundle 'RST-Tables-CJK'

Bundle 'UltiSnips'
Bundle 'SQLUtilities'

let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]

" Ack search plugin
Bundle 'mileszs/ack.vim'
Bundle 'jordansissel/vim-ackmore'
let g:ackprg="ack-grep -H --nocolor --nogroup --column"


" Colors
" 256 color schemes needs the ncurses-term package under Ubuntu
Bundle 'leo256'
Bundle 'borland.vim'

syntax on

try
    color leo
catch
endtry

filetype plugin indent on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab
set smartindent
set ruler
set ttyfast
set autoread
set more
set cursorline!

if has("relativenumber")
    set relativenumber
endif

" Visualize tabs, trailing whitespaces and funny characters
" http://www.reddit.com/r/programming/comments/9wlb7/proggitors_do_you_like_the_idea_of_indented/c0esam1
" https://wincent.com/blog/making-vim-highlight-suspicious-characters
set list
set listchars=nbsp:¬,tab:»·,trail:·

hi User1 ctermfg=196 guifg=#eea040 guibg=#222222
hi User2 ctermfg=75 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 ctermfg=239 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222

" Statusline
" https://github.com/pengwynn/dotfiles/blob/master/vim/vimrc.symlink#L160
set statusline=                                     " Override default
set statusline+=%1*%{fugitive#statusline()[4:-2]}%* " Show fugitive git info
set statusline+=%2*\ %f\ %m\ %r%*                   " Show filename/path
set statusline+=%3*%=%*                             " Set right-side status info after this line
set statusline+=%4*%l/%L:%v%*                       " Set <line number>/<total lines>:<column>
set statusline+=%5*\ %*                             " Set ending space

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" No annoying sound on errors
set noerrorbells
set novisualbell
set timeoutlen=500

" visual bell color

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2


set laststatus=2

" Starting from vim 7.3 undo can be persisted across sessions
" http://www.reddit.com/r/vim/comments/kz84u/what_are_some_simple_yet_mindblowing_tweaks_to/c2onmqe
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Remap VIM 0 to first non-blank character
map 0 ^

" Automatically re-indent on paste
" http://www.reddit.com/r/vim/comments/pkwkm/awesome_little_tweak_automatically_reindent_on/
"nnoremap <leader>p p
"nnoremap <leader>P P
"nnoremap p p'[v']=
"nnoremap P P'[v']=

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

" Stuff taken from
" https://github.com/r00k/dotfiles/blob/master/vimrc
command! Q q
command! W w

let g:HtmlDjangoUserBodyElements = [ ['block', 'end'] ]

" Disable that goddamn 'Entering Ex mode. Type 'visual' to go to Normal mode.'
" that I trigger 40x a day.
map Q <Nop>
let loaded_matchparen = 1
