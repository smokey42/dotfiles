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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle "Bundle manager. Great stuff.
" https://github.com/gmarik/vundle
"
" If there is a slash in the bundle-name
" it automatically installs from GitHub.
"Bundle 'gmarik/vundle'


Bundle 'davidhalter/jedi-vim'

let s:is_enabled = 1

let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0

Bundle 'honza/vim-snippets'

if has("if_lua")

    Bundle 'Shougo/neocomplete'
    Bundle 'Shougo/neosnippet'

    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)"
                \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)"
                \: "\<TAB>"

    " For snippet_complete marker.
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif

    let g:neosnippet#snippets_directory='~/.vim/UltiSnips'

    call neocomplete#init#_variables()
    call neocomplete#init#enable()

    "let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3

    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_overwrite_completefunc = 1
    let g:neocomplete#force_omni_input_patterns.c =
                \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
    let g:neocomplete#force_omni_input_patterns.cpp =
                \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    let g:neocomplete#force_omni_input_patterns.objc =
                \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
    let g:neocomplete#force_omni_input_patterns.objcpp =
                \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

    let g:clang_complete_auto = 0
    let g:clang_auto_select = 0
    let g:clang_use_library = 1

else
    Bundle 'UltiSnips'
    let g:UltiSnips = {}

    Bundle 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "<C-Tab>"
endif

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
Bundle 'editorconfig/editorconfig-vim'

" Version control system helpers.
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'jnwhiteh/vim-golang'

" Other helpers
Bundle 'scrooloose/nerdcommenter'

Bundle 'scrooloose/syntastic'
" Use the |:sign| interface to mark syntax errors
let g:syntastic_enable_signs=1
let g:syntastic_python_checkers=['flake8', 'pylint']
"let g:syntastic_python_checker_args='--max-complexity=10'

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
Bundle 'chase/nginx.vim'
Bundle 'leshill/vim-json'
Bundle 'rantenki/vim-openscad'
Bundle 'groenewege/vim-less'
Bundle 'ap/vim-css-color'
Bundle 'sukima/xmledit'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'php.vim'
Bundle 'rodjek/vim-puppet'

" Completion
"
Bundle 'Rip-Rip/clang_complete'

" Edit helpers.
if has("nocp")
    Bundle 'myusuf3/numbers.vim'
endif

Bundle 'RST-Tables-CJK'

" Colors
" 256 color schemes needs the ncurses-term package under Ubuntu
Bundle 'leo256'

let g:HtmlDjangoUserBodyElements = []

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

" Disable that goddamn 'Entering Ex mode. Type 'visual' to go to Normal mode.'
" that I trigger 40x a day.
map Q <Nop>
let loaded_matchparen = 1
