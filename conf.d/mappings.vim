"============ info and reference ================
" :map -> command is mapped everywhere
" :nmap -> command is mapped only in normal mode
" :vmap -> command is mapped only in visual mode
" :imap -> command is mapped only in insert mode
" :[ivn]noremap -> forbid the remapping of the target
"   expression to avoid nested and recursive mappings

" map the leader to the space bar in normal mode
let mapleader = "\<Space>"

" disallow the use of the arrow keys
nnoremap <up> <nop>
inoremap <up> <nop>
nnoremap <down> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" switch buffers with arrow keys
nnoremap <right> :bp<CR>
nnoremap <left> :bn<CR>

" Map WQ and W, Q so they are actually useful
:command WQ wq
:command Wq wq
:command W w
:command Q q

" jump to the previous open buffer
nnoremap <leader><leader> <c-^>

" replace all of the name until next '_'
nnoremap <leader>r ct_

" prevent an accidental strike of <F1> from opening help
map <F1> <Esc>
imap <F1> <Esc>

" the capslock is remapped in sway as it can't be remapped in
" nvim because it is a system wide thing
