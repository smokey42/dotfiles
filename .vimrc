python << EOF
import sys
import vim
import os


ve_dir = vim.eval('$VIRTUAL_ENV') or ''
ve_dir in sys.path or sys.path.insert(0, ve_dir)
activate_this = os.path.join(ve_dir, 'bin', 'activate_this.py')

if os.path.exists(activate_this):
    # A virtual environment is active, we activate our env as well.
    execfile(activate_this, dict(__file__=activate_this))
EOF

set nocompatible
filetype off

" Alternative: https://github.com/junegunn/vim-plug/
set rtp+=~/.vim/bundle/Vundle.Vim/
call vundle#rc()

Plugin 'Valloric/YouCompleteMe'
Plugin 'rust-lang/rust.vim'
Plugin 'rhysd/rust-doc.vim'

if v:version >= 701
    Plugin 'vim-scripts/L9'
    Plugin 'vim-scripts/FuzzyFinder'
endif
"Plugin 'scrooloose/nerdtree'
"Plugin 'bling/vim-airline'
Plugin 'ap/vim-css-color'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'honza/vim-snippets'
Plugin 'leshill/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/UltiSnips'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-syntastic/syntastic'
if has("nocp")
    Plugin 'myusuf3/numbers.vim'
endif
Plugin 'vim-scripts/leo256'    " needs ncurses-term under Ubuntu

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list=0
let g:syntastic_auto_loc_list=0             " don't auto open loc list on errors
let g:syntastic_enable_signs = 1
let g:syntastic_rust_checkers = ['rustc']   " didn't work without?

let g:ycm_auto_trigger = 1
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_rust_src_path = '/home/rauchc/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

function BrightHighlightOn()
    hi CursorLine ctermbg=blue guibg=blue
endfunction

function BrightHighlightOff()
    hi CursorLine ctermbg=none guibg=none
endfunction

let javascript_enable_domhtmlcss=1

let g:pymode_folding = 1
let g:pymode_lint_cwindow = 0

let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = 0

let g:UltiSnipsExpandTrigger="<C-K>"

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

syntax on
colorscheme leo
filetype plugin indent on

set autoread
"set cursorline!
set expandtab
set foldlevel=10
set history=1000
set hlsearch      " Highlight search results
set incsearch     " Makes search act like search in modern browsers
set laststatus=2  " Always display the status ine
set magic         " For regular expressions turn magic on
set matchtime=2   " How many tenths of a second to blink when matching brackets
set more
set noerrorbells  " No annoying sound on errors
set nosmartindent
set novisualbell  " No annoying flashflash  on errors
set ruler
set scrolloff=7   " Set 7 lines to the cursor - when moving vertically using j/k
set shiftwidth=4
set showmatch     " Show matching brackets when text indicator is over them
set smarttab
set softtabstop=4
set tabstop=4
set textwidth=79
set timeoutlen=500
set ttyfast
set viminfo='20,\"90,h,%    " Remember info about open buffers on close

" Visualize tabs, trailing whitespaces and funny characters
" http://www.reddit.com/r/programming/comments/9wlb7/proggitors_do_you_like_the_idea_of_indented/c0esam1
" https://wincent.com/blog/making-vim-highlight-suspicious-characters
set list
set listchars=nbsp:¬,tab:»·,trail:·

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


" Remap VIM 0 to first non-blank character
map 0 ^

" move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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

" Save buffer when hitting ESC twice
" map <Esc><Esc> :w<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Breaking lines with \[enter] without having to go to insert mode.
nmap <leader><cr> i<cr><Esc>

" Will allow you to use :w!! to write to a file using sudo if you forgot to sudo
" vim file (it will prompt for sudo password when writing)
" http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/96492#96492
cmap w!! %!sudo tee > /dev/null %

" Save and run current file
map <silent> <F5> <esc>:w<CR><esc>:!./%<CR>
map <silent> <F6> :Gblame<CR>
map <silent> <F7> :call ToggleErrors()<CR>

" Reload changes to .vimrc automatically
" autocmd BufWritePost  ~/.vimrc source ~/.vimrc

" Stuff taken from
" https://github.com/r00k/dotfiles/blob/master/vimrc
command! Q q
command! W w

" Disable that goddamn 'Entering Ex mode. Type 'visual' to go to Normal mode.'
" that I trigger 40x a day.
map Q <Nop>
