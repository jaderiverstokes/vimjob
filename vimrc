syntax enable
execute pathogen#infect()
let mapleader = ","
let g:mapleader = ","
filetype plugin on
filetype indent on
imap jj <Esc>
imap jk <Esc>
set backspace=2
colorscheme molokai
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase


" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Show line numbers
set number

set visualbell
set t_vb=

nnoremap <Leader>x :NERDTree <CR>
nmap s <Plug>(easymotion-overwin-f2)
nnoremap <Leader>f :bnext<CR>
nnoremap <Leader>w :bdelete<CR>
nnoremap <Leader>l :b#<CR>
nnoremap vv :vsplit<CR>
nnoremap <Leader>s :wincmd l<CR>
