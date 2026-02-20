set nocompatible              " be iMproved, required
filetype off                  " required

let $BASH_ENV = "~/.bash_aliases"

syntax enable

call plug#begin('~/.vim/plugged')
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'Chiel92/vim-autoformat'
Plug 'tell-k/vim-autopep8'
Plug 'lfilho/cosco.vim'
Plug 'ervandew/supertab'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc.nvim'
Plug 'neoclide/coc-pairs.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dkprice/vim-easygrep'
Plug 'tpope/vim-abolish'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'prabirshrestha/async.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'JuliaLang/julia-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/SimpylFold'
Plug 'othree/html5.vim'
Plug 'joonty/vim-do'
"Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-rhubarb'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'bpeebles/wells-colorscheme.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
"Plug 'flazz/vim-colorschemes'
Plug 'jaderiverstokes/tagbar'
Plug 'alvan/vim-closetag'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mileszs/ack.vim'
Plug 'mtth/scratch.vim'
Plug 'altercation/vim-colors-solarized'
"Plug 'raimondi/delimitmate'
Plug 'wikitopian/hardmode'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'heavenshell/vim-pydocstring'
Plug 'navicore/vissort.vim'
Plug 'tpope/vim-tbone'
Plug 'leafgarland/typescript-vim'
Plug 'tell-k/vim-autoflake'
Plug 'junegunn/fzf'
Plug 'pantharshit00/vim-prisma'
"Plug 'github/copilot.vim'
call plug#end()

set relativenumber
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

syntax enable
let g:solarized_termcolors=256
set background=light
"set background=dark
"colorscheme monokai
colorscheme solarized
"colorscheme blackboard
"colorscheme PaperColor
"colorscheme Atelier_ForestDar
"colorscheme gruvbox

"colorscheme Tomorrow-Night
"colorscheme solarized


set dictionary="/usr/dict/words"
let g:syntastic_loc_list_height=1
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_open = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_mode_map = { 'mode': 'passive' }
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
nnoremap <Leader>z :NERDTreeFind <CR>
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
"map <Leader>h :FZF<CR>
"map <Leader>h :FZF ~/fin-web-client<CR>
"map <Leader>hs :FZF ~/fin-server<CR>
nnoremap <Leader>b :Pydocstring<CR>
map <Leader>d :bdelete<CR>

" Replace word under cursor
nnoremap <Leader>R :%s/\<<C-r><C-w>\>/<C-r><C-w>/gc
vnoremap <Leader>R :%s/\<<C-r><C-w>\>/<C-r><C-w>/gc

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
    silent! execute '%s/
$//g'
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
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

function! Doc()
    r~/.vim/templates/doc.tex
endfunction


function! Html()
    r~/.vim/templates/doc.html
endfunction

nmap <Leader>1 :r~/.vim/templates/python.txt<CR>
nmap <Leader>2 :r~/.vim/templates/log.txt<CR>
nmap <Leader>3 :r~/.vim/templates/bazel.txt<CR>
nmap <Leader>4 :r~/.vim/templates/debug.txt<CR>
nmap <Leader>5 :r~/.vim/templates/tf.txt<CR>
nmap <Leader>6 :r~/.vim/templates/v.txt<CR>
nmap <Leader>7 :r~/.vim/templates/array.txt<CR>
nmap <Leader>8 :r~/.vim/templates/log.txt<CR>
"nmap <Leader>2 :"r~/.vim/templates/" . (match(&filetype, 'javascript\|typescript\|typescriptreact') != -1 ? 'log2.txt' : 'log.txt')<CR>
autocmd FileType python nnoremap <buffer> <Leader>2 :r~/.vim/templates/log.txt<CR>
autocmd FileType typescriptreact nnoremap <buffer> <Leader>2 :r~/.vim/templates/log2.txt<CR>



set foldlevel=99

"Silent commands
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.launch set filetype=html
autocmd BufNewFile,BufRead *.ts set filetype=typescript
"autocmd BufNewFile,BufRead *.tsx set filetype=typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.jsx set filetype=javascript
autocmd BufNewFile,BufRead *.hbs set filetype=html
autocmd BufNewFile,BufRead *.vue set filetype=html
autocmd BufNewFile,BufRead *.py_in set filetype=python
autocmd BufNewFile,BufRead *.ipynb set filetype=python
autocmd BufNewFile,BufRead *.sql_in set filetype=sql
autocmd BufNewFile,BufRead *.cu set filetype=cpp
autocmd BufNewFile,BufRead *.cu.cc set filetype=cpp
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.jl set filetype=julia

nnoremap <Leader>p :FZF<CR>
nmap <Leader>n :set nonu norelativenumber<CR>:GitGutterDisable<CR>
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType typescript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType typescriptreact setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

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
let g:ackprg = "ag --ignore '*.css' --ignore=\"*node_modules/\" --nogroup --nocolor --column --path-to-ignore ~/.agignore"
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
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build\|log_tests\|infra\|experimental'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|log_tests\|infra\|experimental'

let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let NERDTreeMinimalUI = 1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
set foldmethod=syntax
let g:github_enterprise_urls = ['https://git.zooxlabs.com']


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


function! DoInsertHeader(filename) abort
  let search_flags = "bnW" " backwards, don't move cursor, no wrap
  let include_line = "#include \"" . a:filename . "\""
  if search("^" . include_line, search_flags) != 0
    return
  endif

  let last_include_line = search("^#include ", search_flags)
  " We want to include only after angle bracket includes. To
  " guarantee this, we replace "<" with "!" which lets the
  " ascii sorting order take care of the include sorting
  while (substitute(getline(last_include_line), "<", "!", "") > include_line)
    let last_include_line = last_include_line - 1
  endwhile
  call append(last_include_line, [include_line])
endfunction
function! DoInsertHeader(filename) abort
  let search_flags = "bnW" " backwards, don't move cursor, no wrap
  let include_line = "#include \"" . a:filename . "\""
  if search("^" . include_line, search_flags) != 0
    return
  endif

  let last_include_line = search("^#include ", search_flags)
  " We want to include only after angle bracket includes. To
  " guarantee this, we replace "<" with "!" which lets the
  " ascii sorting order take care of the include sorting
  while (substitute(getline(last_include_line), "<", "!", "") > include_line)
    let last_include_line = last_include_line - 1
  endwhile
  call append(last_include_line, [include_line])
endfunction


" Get header options for tag under the cursor. This
" function has a strange signature because it is not
" meant to be called directly and should be used as
" a completion function instead
function! GetIncludeFiles(arglead, line, pos) abort
  " Using match-case enables binary searching for tags
  " and also provides more accurate results for headers.
  let tagcase_tmp = &l:tagcase
  let &l:tagcase = "match"
  let tag_regex = "^" . expand("<cword>") . "$"
  let filename = expand("%")

  let tags = taglist(tag_regex, filename)
  let files1 = filter(tags, {idx, val -> val.filename =~ '.h$'})
  let files2 = map(files1, {idx, val -> val.filename})

  let &l:tagcase = tagcase_tmp
  return uniq(files2)
endfunction


" Insert include file for tag under the cursor
"set wildcharm=<C-x>
command! -nargs=1 -complete=customlist,GetIncludeFiles InsertHeader
      \ :call DoInsertHeader(<f-args>)
let g:autoflake_remove_all_unused_imports=1
let g:autoflake_disable_show_diff=1

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
"let g:neoformat_only_msg_on_error = 1
autocmd BufWritePre *.js PrettierAsync
autocmd BufWritePre *.ts PrettierAsync
autocmd BufWritePre *.tsx PrettierAsync
autocmd BufWritePre *.jsx PrettierAsync
autocmd BufWritePre *.py Autopep8

"command  
"function! s:SomeFunc(command)
"endfunction
    "Gdiffsplit(command)
"command! -nargs=* Gdiff :call SomeFunc(<q-args>)


set diffopt+=vertical

tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" auto enter paste mode when pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
      set pastetoggle=<Esc>[201~
        set paste
          return ""
endfunction
let g:autopep8_disable_show_diff=1

