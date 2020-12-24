call g:plug#begin('~/.config/nvim/plugins')

" Directory searcher
Plug 'preservim/nerdtree'
" Status line plugin
Plug 'bling/vim-airline'


" linting
Plug 'dense-analysis/ale'
" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Syntax highlighting
Plug 'sirtaj/vim-openscad'

" this plugin does python compleations
Plug 'davidhalter/jedi-vim'

" Old vim plugins are kept for compleation sake
"Plug 'flazz/vim-colorschemes'
"Plug 'freeo/vim-kalisi'
"Plug 'nanotech/jellybeans.vim'
"Plug 'tomasr/molokai'
"Plug 'zyedidia/vim-snake'

"Plug 'tpope/vim-fugitive'
"Plug 'sheerun/vim-polyglot'
"Plug 'benekastah/neomake'
"Plug 'parnmatt/vim-root'

"Plug 'lervag/vimtex'
"Plug 'LaTeX-Box-Team/LaTeX-Box'

" Autocompletion
"Plug 'Shougo/deoplete.nvim'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'honza/vim-snippets'
"Plug 'zchee/deoplete-clang'
"Plug 'zchee/deoplete-jedi'
"Plug 'sebastianmarkow/deoplete-rust'
"Plug 'jistr/vim-nerdtree-tabs'
"Plug 'scrooloose/nerdtree'
"Plug 'ctrlpvim/ctrlp.vim'
""Plug 'rking/ag.vim'
"Plug 'AndrewRadev/splitjoin.vim'

"Plug 'tpope/vim-commentary'
"Plug 'easymotion/vim-easymotion'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'Raimondi/delimitMate'
"Plug 'rsmenon/vim-mathematica'
"
" indentation
"Plug 'nathanaelkane/vim-indent-guides'
" Language syntax support
"Plug 'lepture/vim-jinja'
"Plug 'pangloss/vim-javascript'
"Plug 'vim-python/python-syntax'
call g:plug#end()


" include all the files in the conf.d directory
for fpath in split(globpath('~/.config/nvim/conf.d', '*.vim'), '\n')
  exe 'source' fpath
endfor
