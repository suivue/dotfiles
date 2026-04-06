" VIm settings (built-in options)
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set number
set relativenumber
set ruler
set laststatus=2
set incsearch
set hlsearch
set showmatch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
" set ts=2 sts=2 sw=2 et ai si  " Same as above; single line with shorthand form
set encoding=utf-8
set wildmenu
set clipboard=unnamedplus   " Enable clipboard between vim/neovim and others
set completeopt=menuone,preview  " Autocomplete menu. Other options noinsert, noselect
set backspace=indent,eol,start
set mouse=a
set foldmethod=indent
set foldlevel=99
set termguicolors
set cursorline
"set cursorcolumn
"set splitbelow splitright  "change split screen behavior
" hi is short for highlight
hi Normal guibg=NONE ctermbg=NONE
syntax on
filetype plugin indent on

" Automatic reloading of .vimrc upon saving (:w)
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
" $MYVIMRC is an environment variable set by Vim (and Neovim). It points to
" the absolute path to the active `vimrc` file which is typically $HOME/.vimrc.
" We could also use '%' after 'source'

" Set $RTP and $C - Leeren Chang
"let $RTP=split(&runtimepath, ',')[0]
" runtimepath: a list of directories which will be searched for runtime files.
" order: user home .vim/, sysadmin folder, $VIMRUNTIME, sysadmin 'after', user
" home 'after'. after means append to (not override) System settings.
"let $RC="$HOME/.vimrc"

" Show whitespace - Leeren Chang
" This MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Set path - Leeren Chang
set path=.,**  " ** means current directory and all subdirectories inside it.

" Mapleader
" A mapleader is a key (generally unused by VIM) that is set as a <leader> key.
" It is a combination key similar to Ctrl, Shift, Alt, Super. The leader key,
" in combination with other key(s), will let us create new shortcuts. The
" default is backslash (\). To set a custom leader key,
"let mapleader = ","

" Key-mappings
" map_mode  <what_you_type>  <what_is_executed>
"  nnoremap - map keys in normal, non-recursive mode
"  inoremap - map keys in insert, non-recursive mode
"  vnoremap - map keys in visual, non-recursive mode

" Escape insert mode with a home-row key combination
inoremap jj <esc>

" Move to beginning of line in insert mode
inoremap <C-a> <Esc>I

" Move to end of line in insert mode
inoremap <C-e> <Esc>A

" Automatically reload/source config
nnoremap <leader>sv :source $MYVIMRC<CR>

" Split-screen navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Code folding
nnoremap <space> za

" Easier moving between tabs
map <leader>< <esc>:tabprevious<cr>
map <leader>> <esc>:tabnext<cr>

noremap <leader>e :q<CR>
noremap <leader>E :qa!<CR>

" Mapping for running a Python script. ":" is to get to command mode of Vi.
"nnoremap <leader>rp :!clear && python3 %<CR>

" Go a step further ;) and map the F5 key to run a Python script inside Vim.
nnoremap <F5> :w<CR>:!clear; python3 %<CR>

" One for java
"nnoremap <leader>rj :!clear; javac -d . % && java -cp $CLASSPATH %<CR>
"nnoremap <leader>rj :!clear; javac -d . % && java %<CR>

" One for rust
"nnoremap <leader>rr :w<CR>:!clear && rustc %<CR>
"nnoremap <leader>rc :w<CR>:!clear && cargo run<CR>

" Method 1
"augroup dev_settings
"    autocmd!
"    " Settings for Python
"    au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
"    au BufNewFile,BufRead *.py setlocal textwidth=79 expandtab autoindent
"    au BufNewFile,BufRead *.py setlocal fileformat=unix omnifunc=python3complete#Complete
"   " Set indentations for full-stack development
"    au BufNewFile,BufRead *.js,*.html,*.css,*.md setlocal tabstop=2 softtabstop=2 shiftwidth=2
"augroup END

" Method 2 - no whitespace between file types but mandatory white-space
" around '|' and after '\'.
"au BufNewFile,BufRead *.js,*.html,*.css,*.md
"            \ set tabstop=2 |
"            \ set softtabstop=2 |
"            \ set shiftwidth=2
"
" Method-3 with a function and augroup
" 'setlocal' is preferred over global-scoped 'set'
function! WebDevSettings()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal wrap
endfunction

augroup web_dev
    au!
    au BufNewFile,BufRead *.js,*.html,*.css,*.md call WebDevSettings()
augroup END

" Alternatively, for better performance and organization, use ~/.vim/ftplugin/<filetype>.vim

" Source files instead of dumping everything in one file
":source %:p:h/otherfile.vim
" - % refers to the current file(name)
" - :p expands to full path of current file
" - :h takes the 'head' of the path, which is the directory name
":source ~/.vim/svim-essential-plugins.vim

" Plugins Section
" Automatically install 'vim-plug' if it is not already installed.
"let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
"if empty(glob(data_dir . '/autoload/plug.vim'))
"  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
"
"" Plugins
"call plug#begin()
"" --- Source the global plugins file ---
"if filereadable($HOME . "/.vim/plugins_global.vim")
"  source $HOME/.vim/plugins_global.vim
"endif
"
"" --- Source any other plugin file(s) ---
""if filereadable($HOME . "/.vim/plugins_jedi.vim")
""  source $HOME/.vim/plugins_jedi.vim
""endif
"
"call plug#end()

" Settings that use plugins or are specific to plugins

" Nerdtree keymaps
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <leader>t :NERDTree<CR>
"nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

