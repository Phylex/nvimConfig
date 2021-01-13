" set the number of spaces in yaml files to 2
autocmd BufWritePre,BufRead *.yml setlocal tabstop=2
autocmd BufWritePre,BufRead *.yml setlocal shiftwidth=2

" make the line a comment in different language
autocmd FileType c          nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType python     nnoremap <buffer> <localleader>c I#<space><esc>
autocmd FileType vim        nnoremap <buffer> <localleader>c I"<esc>
autocmd FileType mail		setlocal textwidth=80
