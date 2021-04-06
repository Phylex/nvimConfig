augroup filetype_c
	autocmd!
	autocmd FileType c          nnoremap <buffer> <localleader>c I//<esc>
	autocmd FileType c          call deoplete#enable()
augroup END

augroup filetype_viml
	autocmd!
	autocmd FileType vim        nnoremap <buffer> <localleader>c I"<esc>
augroup END

augroup filetype_python
	autocmd!
	autocmd FileType python     nnoremap <buffer> <localleader>c I#<space><esc>
	autocmd FileType python     call deoplete#enable()
	autocmd FileType python     setlocal tabstop=4
	autocmd FileType python     setlocal shiftwidth=4
augroup END

augroup filetype_email
	autocmd!
	autocmd FileType mail
	autocmd FileType mail       setlocal textwidth=80
	autocmd FileType mail       setlocal spelllang=de
	autocmd FileType mail       call deoplete#disable()
augroup END

augroup filetype_yaml
	autocmd!
	autocmd FileType yaml       setlocal tabstop=2
	autocmd FileType yaml       setlocal shiftwidth=2
augroup END

augroup filetype_markdown
	autocmd!
	autocmd FileType markdown   iabbrev <buffer> (( \\(
	autocmd FileType markdown   iabbrev <buffer> )) \\)
	autocmd FileType markdown   call deoplete#disable()
augroup END
