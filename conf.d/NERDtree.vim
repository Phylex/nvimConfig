" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let g:NERDTreeWinSize = 20

"tabs
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1
" Start NerdTree automatically on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close nvim if nerdtree is the only buffer left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
