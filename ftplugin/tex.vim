nnoremap <silent> <leader>r :w<CR>: !clear;pdflatex --file-line-error --synctex=1 -aux-directory=.tex-aux %<CR>
