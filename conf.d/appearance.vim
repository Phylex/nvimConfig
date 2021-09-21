"set termguicolors
" tell nvim we are running in a full color terminal
set termguicolors

" set show the whitespaces in a file
set list
"set background color
set background=dark

au BufNewFile,BufRead *.madx,*.seq,*.str,*.mask setf madx

" set colorscheme
colorscheme nabla
