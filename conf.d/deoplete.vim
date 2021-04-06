" deoplete options

" enable plugin at startup
let g:deoplete#enable_at_startup = 1

" set global deoplete options
call deoplete#custom#option('auto_complete', 1) 
call deoplete#custom#option('auto_complete_delay', 50)

" trigger the completion menu automatically
" when I want the computer to help me
call deoplete#custom#option('auto_complete_popup', 'auto')

" limit the visible items in the list to 10
call deoplete#custom#option('max_list', 10)

" these are the sources that deoplete uses to do the completion
call deoplete#custom#option('sources', { 'python': ['ale'] })

" use more than one process if there is more than one completion source for deoplete
call deoplete#custom#option('num_processes', 7)

" cycle through the entries with tab and shift tab
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
" use <enter> to select an item without adding a newline
inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<CR>"
