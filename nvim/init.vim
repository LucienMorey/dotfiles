
"load plugins with vim-plug

call plug#begin('~/.config/nvim/plugged')

Plug 'kaicataldo/material.vim'

call plug#end()

if (has('termguicolors'))
    set termguicolors
endif
colorscheme material
let g:material_theme_style = 'default'

set background=dark



set number "enable line numbers

set tabstop=4 "number of spaces that appear per TAB
set softtabstop=4 "number of spaces in a TAB when editing
set shiftwidth=4 "indent
set expandtab "tabs use spaces
 
set showmatch "match ({[]})

set incsearch "search as characters are entered
set hlsearch "highlight search result

set foldenable "enable code folding
set foldlevelstart=10 "fold after level 10 by default
set foldnestmax=10 "maximum number of folds allowed

:nmap ; :
"use ; instead of : for commands


