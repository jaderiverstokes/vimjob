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
set dictionary="/usr/dict/words"
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
let g:syntastic_loc_list_height=1
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_open = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_quiet_messages = { "type": "style" }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set viminfo='100,h
set title
set copyindent
function! Tab_Or_Complete()
      if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
              return "\<C-N>"
                else
                        return "\<Tab>"
                          endif
                      endfunction
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

imap <C-s> :w<CR>
" Better tabing
vnoremap < <gv
vnoremap > >gv
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
nnoremap <Leader>s <C-w><C-w>
map <Leader>O zR
map <Leader>C zM
map <Leader>o zA
map <Leader>c zA
