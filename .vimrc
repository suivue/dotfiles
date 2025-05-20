set nocompatible
set number
set relativenumber
set nobackup
set autoindent
set ruler
set laststatus=2
set incsearch
set showmatch
set shiftwidth=4
set tabstop=4
set expandtab
set encoding=utf-8
set clipboard=unnamedplus   "enables clipboard between vim/neovim and others
"modifies the autocomplete menu to behave more like other IDE
"set completeopt=noinsert,menuone,noselect
set mouse=a
set foldmethod=indent
set foldlevel=99
"set cursorline
"set cursorcolumn
"set splitbelow splitright  "change split screen behavior
syntax on
filetype plugin indent on

"Built-in autocomplete for Python
autocmd FileType python3 set omnifunc=pythoncomplete#Complete

"let g:kite_supported_languages = ['python', 'javascript']

"
"Mapleader
"A mapleader is a key (generally unused by VIM) that is set as a <leader> key.
"It is a combination key similar to Ctrl, Shift, Alt, Super. The leader key
"in combination with other key, will let us create new shortcuts.
"Default is backslash (\). To set a custom leader key, 
"let mapleader = ","
"
"Mappings
"map_mode  <what_you_type>  <what_is_executed>
"nnoremap - map keys in normal mode
"inoremap - map keys in insert mode
"vnoremap - map keys in visual mode
"
inoremap jj <esc>

"Mapping for running a Python script. ":" is to get to command mode of Vi.
"nnoremap rp :!clear && python3 %<CR>

"We can even map a key, say F5 to save and run a Python script inside Vim.
nnoremap <F5> :w<CR>:!clear; python3 %<CR>

"One for java (not tested)
"nnoremap rj :!clear; javac -d . % && java -cp $CLASSPATH %<CR>
nnoremap rj :!clear; javac -d . % && java %<CR>

"One for rust (not tested)
nnoremap rr :w<CR>:!clear && rustc %<CR>
nnoremap rc :w<CR>:!clear && cargo run<CR>

"Code folding
nnoremap <space> za

map <C-n> :NERDTreeToggle<CR>

"Settings for Python
au BufNewFile,BufRead *.py
            \set tabstop=4
            \set softtabstop=4
            \set shiftwidth=4
            \set textwidth=79
            \set expandtab
            \set fileformat=unix
            \set autoindent

"let g:ale_linters = {'python': ['flake8']}


"Plugins
call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'rust-lang/rust.vim'
Plug 'davidhalter/jedi-vim'
"Plug 'dense-analysis/ale'
"Plug 'nvie/vim-flake8'
"Colorscheme
Plug 'junegunn/seoul256.vim'

call plug#end()

"silent! colorscheme seoul256
