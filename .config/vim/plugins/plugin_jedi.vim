Plug 'davidhalter/jedi-vim'  "Not required if we have CoC
Plug 'dense-analysis/ale'  " pyright check for errors upon save
Plug 'nvie/vim-flake8'

let g:ale_linters = {'python': ['flake8']}
