set nocompatible              " be iMproved, required
filetype off                  " required

let $BASH_ENV = "~/.bash_aliases"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
syntax enable
"Plugin 'python-mode/python-mode'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'skywind3000/asyncrun.vim'
"Plugin 'Chiel92/vim-autoformat'
"Plugin 'w0rp/ale'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'JuliaLang/julia-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'othree/html5.vim'
Plugin 'ervandew/supertab'
Plugin 'joonty/vim-do'
"Plugin 'scrooloose/syntastic'
Plugin 'sbdchd/neoformat'
Plugin 'neomake/neomake'
Plugin 'tomtom/tlib_vim'
Plugin 'joonty/vdebug'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'garbas/vim-snipmate'
Plugin 'bpeebles/wells-colorscheme.vim'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'cooper-sloan/tagbar'
Plugin 'alvan/vim-closetag'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'mileszs/ack.vim'
Plugin 'mtth/scratch.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'raimondi/delimitmate'
Plugin 'wikitopian/hardmode'
" Always show powerline
set relativenumber
call vundle#end()            " required
filetype plugin indent on    " required
set laststatus=2
set clipboard=unnamed
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
filetype plugin on
filetype indent on
set smartindent
imap jk <Esc>
imap JK <Esc>
imap jK <Esc>
imap Jk <Esc>
imap kj <Esc>
imap KJ <Esc>
imap Kj <Esc>
imap kJ <Esc>
"vmap jk <Esc>
set backspace=2

"colorscheme blackboard
"colorscheme PaperColor
"colorscheme gruvbox

colorscheme Tomorrow-Night


set dictionary="/usr/dict/words"
let g:syntastic_loc_list_height=1
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_open = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_quiet_messages = { "type": "style" }
set copyindent
set viminfo='100,h
set title
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Better tabing
vnoremap < <gv
vnoremap > >gv
nnoremap > >>
nnoremap < <<
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

nnoremap <Leader>x :NERDTreeFocus <CR>
nmap s <Plug>(easymotion-overwin-f2)
nnoremap <Leader>f :bnext<CR>
nnoremap <Leader>w <C-w>c
nnoremap <Leader>l :set hidden<CR> :b#<CR>
nnoremap vv :vsplit<CR>
nnoremap <Leader>s <C-w><C-w>
map <Leader>O zR
map <Leader>C zM
map <Leader>o zA
map <Leader>c zA

set completeopt-=preview
set fillchars+=vert:\
set hlsearch
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
function! s:ExecuteInShell(command)
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! execute 'resize ' . line('$')
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
    echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

set autowriteall
map <Leader>d :bdelete<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

function! Doc()
    r~/.vim/templates/doc.tex
endfunction


function! Html()
    r~/.vim/templates/doc.html
endfunction

nmap <Leader>1 :call Doc()<CR>
nmap <Leader>2 :call Html()<CR>
nmap <Leader>3 :r~/.vim/templates/template.tex<CR>
nmap <Leader>4 :r~/.vim/templates/debug.txt<CR>
set tags=.tags;/
nnoremap <silent> gt <C-]>
nnoremap <silent> gb <C-T>
nnoremap <Leader>t :Silent ctags -R --exclude=@/Users/csloan/.ctagsignore  -o ./.tags `pwd` <CR>
set foldlevel=99

"Silent commands
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'

set clipboard=unnamed
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.hbs set filetype=html
autocmd BufNewFile,BufRead *.py_in set filetype=python
autocmd BufNewFile,BufRead *.ipynb set filetype=python
autocmd BufNewFile,BufRead *.sql_in set filetype=sql
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.jl set filetype=julia

nnoremap <Leader>p :CtrlP<CR>;wq
nmap <Leader>n :set nu! relativenumber!<CR>
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

autocmd TextChanged,TextChangedI <buffer> silent write

nnoremap gs :Gstatus<CR>
nnoremap gc :Gcommit<CR>
nnoremap <Leader>y :TagbarToggle<CR>
function! NERDTreeQuit()
    redir => buffersoutput
    silent buffers
    redir END
    "1BufNo  2Mods.     3File           4LineNo
    let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
    let windowfound = 0

    for bline in split(buffersoutput, "\n")
        let m = matchlist(bline, pattern)

        if (len(m) > 0)
            if (m[2] =~ '..a..')
                let windowfound = 1
            endif
        endif
    endfor

    if (!windowfound)
        quitall
    endif
endfunction
autocmd WinEnter * call NERDTreeQuit()
let g:closetag_filenames = "*.html,*.xml,*.hbs"
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>a :Ack! 
nnoremap <Leader>i mzgg=G`z
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

let g:jsx_ext_required = 0
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
set statusline-=ffenc
let g:airline_section_y=''
let g:airline_section_z=''
let g:airline_section_c='%t'
let g:airline_detect_modified=0
let g:airline_section_error=''
let g:airline_section_warning=''

set noshowmode
vnoremap . :normal .<CR>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build'
nnoremap <Leader>mlm :Shell mlm<CR>
nnoremap <Leader>mlt :execute system('source ~/test.sh')<CR>
nnoremap <Leader>mlr :Shell mlr<CR>
nnoremap <Leader>mli :Shell mli<CR>
"autocmd! BufWritePost * Neomake
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
if @% == ""
    :silent edit ~/a.txt
endif
let g:ctrlp_working_path_mode=0
let g:neomake_cpp_enabled_markers=['clang']
