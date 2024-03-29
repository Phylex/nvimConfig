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
nnoremap <leader>_ ct_

" prevent an accidental strike of <F1> from opening help
map <F1> <Esc>
imap <F1> <Esc>
" map the opening bracket to do the opposite of the closing
" bracket in the vim help
nnoremap <c-[> <c-o>

" spell checking remap so that control-l jumps to the last typo and inserts
" the first recommendation in it's place
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" be careful the A S D F G are mapped to the Deoplete completion candidate selection

" here we define mappings to open and load a vimrc
nnoremap <leader>ec :vsplit $MYVIMRC<cr>
nnoremap <leader>lc :source $MYVIMRC<cr>

" encase the visually selected area into '<' '>'
vnoremap <leader>< <esc>`<i<<esc>`>la><esc>

" insert a new line in between two lines
nnoremap <leader>lb jxi<enter><esc>$

" switch off highlighting
noremap <leader>h :noh<CR>

" open Tagbar at the right hand side
nmap <F8> :TagbarToggle<CR>
" open nerdtree with a single keystroke
nmap <F2> :NERDTreeToggle<CR>
" open fzf without needing the command
nmap <F3> :FZF<CR>
