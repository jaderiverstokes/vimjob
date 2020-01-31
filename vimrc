set nocompatible              " be iMproved, required
filetype off                  " required

let $BASH_ENV = "~/.bash_aliases"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
syntax enable

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'JuliaLang/julia-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'othree/html5.vim'
Plugin 'joonty/vim-do'
Plugin 'sbdchd/neoformat'
Plugin 'neomake/neomake'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-rhubarb'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'Valloric/YouCompleteMe'
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
Plugin 'raimondi/delimitmate'
Plugin 'wikitopian/hardmode'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'navicore/vissort.vim'

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
set backspace=2

"colorscheme blackboard
"colorscheme PaperColor
"colorscheme Atelier_ForestDar
colorscheme gruvbox

"colorscheme Tomorrow-Night


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
nnoremap vs :split<CR>
nnoremap <Leader>s :wa<CR>
map <Leader>O zR
map <Leader>C zM
map <Leader>o zA
map <Leader>h :CtrlPCurWD<CR>
nnoremap <Leader>b :Pydocstring<CR>
map <Leader>d :bdelete<CR>

" Replace word under cursor
nnoremap <Leader>R :%s/\<<C-r><C-w>\>/<C-r><C-w>/gc

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
    silent! execute 'wa'. command
    silent! execute 'silent %!'. command
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
    silent! execute '%s/$//g'
    silent! execute 'g/development/0,.d'
    silent! execute '%s///g'
    silent! execute '%s///g'
    silent! execute '%s/\[\d\{-}m//g'
    silent! execute 'resize ' . line('$')
    silent! redraw
    silent! execute "normal! zb"
    echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

set autowriteall
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
nmap <Leader>5 :r~/.vim/templates/tf.txt<CR>
nmap <Leader>6 :r~/.vim/templates/v.txt<CR>
nmap <Leader>7 :r~/.vim/templates/array.txt<CR>
nmap <Leader>8 :r~/.vim/templates/log.txt<CR>

set tags=.tags;/
nnoremap <silent> gt <C-]>
nnoremap <silent> gb <C-T>
nnoremap <Leader>t :Silent ctags -R --exclude=@/home/csloan/.ctagsignore  -o ./.tags `pwd` <CR>
set foldlevel=99

"Silent commands
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.launch set filetype=html
autocmd BufNewFile,BufRead *.ts set filetype=javascript
autocmd BufNewFile,BufRead *.hbs set filetype=html
autocmd BufNewFile,BufRead *.vue set filetype=html
autocmd BufNewFile,BufRead *.py_in set filetype=python
autocmd BufNewFile,BufRead *.ipynb set filetype=python
autocmd BufNewFile,BufRead *.sql_in set filetype=sql
autocmd BufNewFile,BufRead *.cu set filetype=cpp
autocmd BufNewFile,BufRead *.cu.cc set filetype=cpp
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.jl set filetype=julia

nnoremap <Leader>p :CtrlP<CR>;wq
nmap <Leader>n :set nonu norelativenumber<CR>:GitGutterDisable<CR>
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

autocmd TextChanged,TextChangedI <buffer> silent write

nnoremap gs :Gstatus<CR>
nnoremap gc :Gcommit<CR>
nnoremap <Leader>y :TagbarOpenAutoClose<CR>

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
let g:closetag_filenames = "*.html,*.xml,*.hbs,*.js"
"
let g:ack_use_async = 1
let g:ack_use_dispatch = 1
if exists('$TMUX')
    let g:ack_use_dispatch = 0
    let g:ack_use_async = 0
endif
"let g:ackprg = 'ack-grep'
let g:ackprg = "ag --ignore '*.js.map' --ignore '*.js' --ignore=\"*node_modules/\" --nogroup --nocolor --column --path-to-agignore ~/.agignore"
nnoremap <Leader>a :Ack! 
nnoremap <Leader>e "zyiw:Ack! <C-R>z<CR>
nnoremap <Leader>i mzgg=G`z
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
set splitbelow
set splitright
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
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
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
if @% == ""
    :silent edit .
endif
let g:ctrlp_working_path_mode = 0
let g:neomake_cpp_enabled_markers = ['clang']
let g:jsx_ext_required = 0

let g:ctrlp_max_depth = 30
let g:ctrlp_max_files = 0
let NERDTreeShowBookmarks = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build\|log_tests\|infra\|experimental'

let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let NERDTreeMinimalUI = 1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
set foldmethod=syntax
let g:github_enterprise_urls = ['https://git.zooxlabs.com']

" Type `gd` to go to the BUILD file for this file.
function! GoToBuild()
python3 << EOF
import vim
import os.path

def look_above(filepath):
 dirpath, _, basename = fn.rpartition('/')
 buildfile = os.path.join(dirpath, 'BUILD')
 return os.path.exists(buildfile), buildfile, dirpath

try:
 fn = vim.current.buffer.name
 _, _, basename = fn.rpartition('/')
 while fn:
   exists, buildfile, fn = look_above(fn)
   if exists:
     print("found!!!",buildfile)
     vim.command('edit ' + buildfile)
     vim.command('call search("\\"' + basename + '\\"")')
     break
except Exception as e:
  print("Something went wrong: " + str(e))
EOF
endfunction
nnoremap gd :call GoToBuild()<cr>

" Create a function to reload vimrc. Checks if it already exists to avoid
" redefining the function during the function call.
:if !exists("*SourceVimrc")
:  function! SourceVimrc()
:    so ~/.vimrc
:  endfunction
:endif
nnoremap ,, :call SourceVimrc()<cr>

function! GotoProtoDef()
:  let l:fname=expand('<cfile>')
:  let l:fname = substitute(l:fname, ".pb.h", ".proto", "")
:  execute 'edit' l:fname
endfunction
nnoremap gp :call GotoProtoDef()<CR>

function! SwitchSourceHeader()
 " Get the current file extension. To see what this command is doing,
 " see :help expand.
 let l:cur_ext=expand("%:e")
 " See if we have a source file (ending in .cpp or .cc).
 if (expand ("%:e") == "cpp" || expand ("%:e") == "cc"|| expand ("%:e") == "cu.cpp")
   " %:t gives the basename with extension, :r trims the extension.
   " Try searching for both .h and .hpp extensions, and open the first file
   " that is found.
   let l:h_path=expand("%:r") . ".h"
   let l:hpp_path=expand("%:r") . ".hpp"
   if filereadable(h_path)
     find %:t:r.h
   elseif filereadable(hpp_path)
     find %:t:r.hpp
   endif
 else
   let l:cpp_path=expand("%:r") . ".cpp"
   let l:cc_path=expand("%:r") . ".cc"
   if filereadable(cpp_path)
     find %:t:r.cpp
   elseif filereadable(cc_path)
     find %:t:r.cc
   endif
 endif
endfunction

nmap ,s :call SwitchSourceHeader()<CR>
vnoremap // y/<C-R>"<CR>

function! UpdateDeps()
  let l:fname=expand('%:p')
  py3f /mnt/flashblade/carden/utils/update_deps_vim.py
  call input('Press any key to continue')
  redraw!
  execute 'edit' l:fname
endfunction
nnoremap ,u :call UpdateDeps()<cr>
let g:ctrlp_working_path_mode = 'ra'
"set shellpipe=>
"set t_ti= t_te=
"
let g:ycm_complete_in_comments = 1
function! GetBazelTargetForFile()
   let query = "bazel query --universe_scope='//...' --order_output=no \"allrdeps($(bazel query " . expand('%') . "), 1)\" | tr '\\n' ' '"
   let target = system(query)
   return target
endfunction

function! BazelCmd(action, ...)
 let target = (a:0 == 0) ? GetBazelTargetForFile() : join(a:000, " ")
 let tmp_file = "/tmp/bazel_vim_stderr.txt"
 let error_regex = "^[^: ]*:[0-9]\\{1,\\}:[0-9]\\{1,\\}:\\s*\\(error\\|required from here$\\)"
 let cmd = "bazel " . a:action . " " . target . " 2>&1 | tee >(grep '" . error_regex . "' >" . tmp_file . ")"
 exec "!" . cmd
 cexpr! system("cat " . tmp_file)
 if (len(getqflist()) > 0)
   copen
 endif
endfunction

command -nargs=* Bazel :call BazelCmd(<f-args>)
set modelines=0
set nomodeline
set autoread
au CursorHold * checktime

" copy to attached terminal using the yank(1) script:
" https://github.com/sunaku/home/blob/master/bin/yank
"function! Yank(text) abort
  "let escape = system('yank', a:text)
  "if v:shell_error
    "echoerr escape
  "else
    "call writefile([escape], '/dev/tty', 'b')
  "endif
"endfunction
"noremap <silent> <Leader>y y:<C-U>call Yank(@0)<CR>


function! NERDTreeYankCurrentNode()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        call setreg('"', n.path.str())
    endif
endfunction

set copyindent
let g:ycm_confirm_extra_conf = 0
let NERDTreeIgnore = ['__pycache__$']
