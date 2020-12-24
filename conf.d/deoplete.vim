"set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
"set completeopt-=preview

" deoplete options

"let g:deoplete#enable_at_startup = 1

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets' behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
"smap <expr><TAB>
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
"imap <silent><expr><CR> pumvisible() ? deoplete#close_popup()."\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
"
""" For conceal markers.
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif
"
""inoremap <silent><expr> <Tab>
""            \ pumvisible() ? \<C-n>" : <Tab>"
"
"" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1
"let gneosnippet#snippets_directory='~/.nvim-plugins/vim-snippets/snippets'
"
"
""deoplete-clang opions
"let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
"let g:deoplete#sources#clang#clang_header ="/usr/include/clang/"
