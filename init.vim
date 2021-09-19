call g:plug#begin('~/.config/nvim/plugins')

" Directory searcher
Plug 'preservim/nerdtree'
" Status line plugin
Plug 'bling/vim-airline'

" linting and language server connection
Plug 'dense-analysis/ale'

" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-clang'

"Syntax highlighting
Plug 'sirtaj/vim-openscad'
Plug 'dag/vim-fish'
Plug 'bfrg/vim-cpp-modern'

Plug 'preservim/tagbar'

Plug 'rust-lang/rust.vim'
Plug 'tikhomirov/vim-glsl'
"Plug 'tpope/vim-commentary'
"Plug 'easymotion/vim-easymotion'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'Raimondi/delimitMate'
"Plug 'rsmenon/vim-mathematica'
"
" indentation
"Plug 'nathanaelkane/vim-indent-guides'
call g:plug#end()

" enable filetype detection
filetype plugin on

" do the general configuration of nvim here
exe 'source' '~/.config/nvim/conf.d/general.vim'
" remember that coc configures itself through the configuration json file

" configure ale
exe 'source' '~/.config/nvim/conf.d/ale.vim'

" configure deoplete
exe 'source' '~/.config/nvim/conf.d/deoplete.vim'

" configure airline
exe 'source' '~/.config/nvim/conf.d/airline.vim'

" map the bindings
exe 'source' '~/.config/nvim/conf.d/mappings.vim'

" map the abbreviations
exe 'source' '~/.config/nvim/conf.d/abbreviations.vim'

" include the autocommands set
exe 'source' '~/.config/nvim/conf.d/autocmds.vim'

" set the colors
exe 'source' '~/.config/nvim/conf.d/appearance.vim'
silent! source .vimlocal
