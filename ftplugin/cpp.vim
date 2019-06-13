setlocal shiftwidth=2
setlocal tabstop=2
let g:clang_format_path='clang-format-3.6'
nnoremap <silent> <Leader>r :wa<CR>:terminal bazel run --config cuda /%:p:h:s?\/home??:s?\/driving??:s?\/csloan??:%:t:r<CR>

:function! FormatFile()
:  let l:lines="all"
:  py3f ~/.vim/clang-format.py
:endfunction
" Format entire file when no lines are highlighted.
nnoremap <buffer><silent> <S-F> :call FormatFile()<cr>
" Format only highlighted lines.
vnoremap <buffer><silent> <S-F> :py3f ~/.vim/clang-format.py<cr>

"!echo %:s?\/home??:
