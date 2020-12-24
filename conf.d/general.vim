set clipboard+=unnamedplus
set cursorline                  "Get a cursor line"
set number
set relativenumber
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

filetype plugin on

set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4

"enable mouse support in visual and insert mode
set mouse=vi

" show trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+\%#\@<!$/
set list
"set list chars=tab:>-,extends:>,precedes:<



" more comprehensive Syntax highlighting enabled for Python
let g:python_highlight_all = 1

" wrap the text after 150 chars
set textwidth=150
set wrap

" incorporate spellchecking
setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
