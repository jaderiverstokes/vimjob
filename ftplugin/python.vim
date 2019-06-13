"nnoremap <silent> <Leader>r :wa<CR>: Shell python %<CR>
nnoremap <silent> <Leader>r :wa<CR>:terminal bazel run --config cuda /%:p:h:s?\/home??:s?\/driving??:s?\/csloan??:%:t:r<CR>
"augroup fmt
  "autocmd!
  "autocmd BufWritePre * Neoformat
"augroup END
"
:function! FormatEntirePythonFile()
:  let l:lines="all"
:  py3f ~/.vim/autoformat_python.py
:endfunction
:function! FormatPythonFileForLines()
:  py3f ~/.vim/autoformat_python.py
:endfunction
" format all lines for python files.
nnoremap <buffer><silent> <S-F> :call FormatEntirePythonFile()<cr>
" Format highlighted lines for python files.
vnoremap <buffer><silent> <S-F> :call FormatPythonFileForLines()<cr>
