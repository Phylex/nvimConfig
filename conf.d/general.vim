set nocompatible

set clipboard+=unnamedplus
set cursorline                  "Get a cursor line"
" enable the numbers beside the text
set number
set relativenumber

set history=1000                "Store lots of :cmdline history

set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom

" options that change the appearance and behaviour in the text window
set gcr=a:blinkon1              "cursor blink
set visualbell                  "No sounds
set tabstop=4
set shiftwidth=4

set filetype=on
set autoread                    "Reload files changed outside vim

" ignore the case of chars when they appear in patterns
set ignorecase
set smartcase

"enable mouse support in visual and insert mode
set mouse=vi

" show trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+\%#\@<!$/
set list
"set list chars=tab:>-,extends:>,precedes:<

" wrap the text after 150 chars
set textwidth=150
set wrap

" incorporate spellchecking
setlocal spell
set spelllang=en_gb
