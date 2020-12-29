" deoplete options

" enable plugin at startup
let g:deoplete#enable_at_startup = 1

" set global deoplete options
call deoplete#custom#option('auto_complete', 1) 
call deoplete#custom#option('auto_complete_delay', 200)
" trigger the completion menu by a keypress -> only complete
" when I want the computer to help me
call deoplete#custom#option('auto_complete_popup', 'auto')
" when the completion menu is active the top completion results can be
" selected by typing one of the markers
call deoplete#custom#option('candidate_marks', ['A', 'S', 'D', 'F', 'G'])
" bind the Keys to the insertion
inoremap <expr>A pumvisible() ? deoplete#insert_candidate(0) : 'A'
inoremap <expr>S pumvisible() ? deoplete#insert_candidate(1) : 'S'
inoremap <expr>D pumvisible() ? deoplete#insert_candidate(2) : 'D'
inoremap <expr>F pumvisible() ? deoplete#insert_candidate(3) : 'F'
inoremap <expr>G pumvisible() ? deoplete#insert_candidate(4) : 'G'

" limit the visible items in the list to 10
call deoplete#custom#option('max_list', 10)

" these are the sources that deoplete uses to do the completion
call deoplete#custom#option('sources', { 'python': ['ale'] })

" use more than one process if there is more than one completion source for deoplete
call deoplete#custom#option('num_processes', 7)
