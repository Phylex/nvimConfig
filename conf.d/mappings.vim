"============ info and reference ================
" :map -> command is mapped everywhere
" :nmap -> command is mapped only in normal mode
" :vmap -> command is mapped only in visual mode
" :imap -> command is mapped only in insert mode
" :[ivn]noremap -> forbid the remapping of the target
"   expression to avoid nested and recursive mappings

" set the shell to the bash

" map the leader to the space bar in normal mode
let mapleader = "\<Space>"
let maplocalleader = ";"

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
" map the opening bracket to do the opposite of the closing
" bracket
nnoremap <c-[> <c-o>

" the capslock is remapped in sway as it can't be remapped in
" nvim because it is a system wide thing
nnoremap <leader><leader> dd

" spell checking remap so that control-l jumps to the last typo and inserts
" the first recommendation in it's place
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" be careful the A S D F G are mapped to the Deoplete completion candidate selection

" here we define mappings to open and load a vimrc
nnoremap <leader>ec :vsplit $MYVIMRC<cr>
nnoremap <leader>lc :source $MYVIMRC<cr>

" encase the visually selected area into '<' '>'
vnoremap <leader>< <esc>`<i<<esc>`>la><esc>

nnoremap <leader>lb jxi<enter><esc>$
nmap <F8> :TagbarToggle<CR>
