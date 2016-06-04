syntax enable

set clipboard=unnamed
execute pathogen#infect()
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
filetype plugin on
filetype indent on
imap jk <Esc>
set backspace=2
colorscheme molokai
set dictionary="/usr/dict/words"
let g:syntastic_loc_list_height=1
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_open = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_quiet_messages = { "type": "style" }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set copyindent
set viminfo='100,h
set title
" Ignore case when searching
set ignorecase
"
" When searching try to be smart about cases 
set smartcase
" Better tabing
vnoremap < <gv
vnoremap > >gv
" For regular expressions turn magic on
nnoremap > >>
nnoremap < <<
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

nnoremap <Leader>x :NERDTreeToggle <CR>
nmap s <Plug>(easymotion-overwin-f2)
nnoremap <Leader>f :set hidden<CR> :bnext<CR>
nnoremap <Leader>w <C-w>c
nnoremap <Leader>l :set hidden<CR> :b#<CR>
nnoremap vv :vsplit<CR>
nnoremap <Leader>s <C-w><C-w>
map <Leader>O zR
map <Leader>C zM
map <Leader>o zA
map <Leader>c zA
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> S :<C-u>Update<CR>
set completeopt-=preview
nmap <-Enter> o<Esc>
set fillchars+=vert:\ 
set hlsearch
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  "call setline(1, 'You entered:  ' . a:cmdline)
  call setline(1, expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction

set autowriteall
map <Leader>d :bdelete<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

function! Doc()
    " ~/vim/cpp/new-class.txt is the path to the template file
    r~/.vim/templates/doc.tex
endfunction

nmap <Leader>1 :call Doc()<CR>
nnoremap ; :
set tags=.tags;/
nnoremap <silent> gt <C-]>
nnoremap <silent> gb <C-T>
nnoremap <Leader>t :Silent ctags -R  -o ./.tags `pwd` <CR>
set foldlevel=99
"Silent commands
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
nnoremap <Leader>p :CtrlP<CR>;wq
