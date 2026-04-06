set tabstop=8
set softtabstop=8
set shiftwidth=8
set textwidth=79
set fileformat=unix
set autoindent
set makeprg=make
set autowrite
set omnifunc=ccomplete#Complete
set tags=~/.vim/system.tags,tags

nnoremap <Leader>cc :set colorcolumn=80<cr>
nnoremap <Leader>ncc :set colorcolumn-=80<cr>
nnoremap <buffer> <Leader>c I// <esc>
