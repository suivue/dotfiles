set shiftwidth=4  " indentation level 4 spaces
set tabstop=4  " tab should correspond to 4 spaces
set softtabstop=4  " tab to look like they are 4 spaces
set expandtab  " tab to expand to 4 spaces (noticeable with backspace)
set autoindent
set smartindent
setlocal colorcolumn=79
setlocal path=src/**,tests,bin/**
setlocal wildignore=*/__pycache__/*,*.pyc
set include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)

function! PyInclude(fname)
    let parts = split(a:fname, ' import ')
    let l = parts[0]
    if len(parts) > 1
        let r = parts[1]
        let joined = join([l, r], '.')
        let fp = substitute(joined, '\.', '/', 'g') . '.py'
        let found = glob(fp, 1)
        if len(found)
            return found
        endif
    endif
    return substitute(l, '\.', '/', 'g') . '.py'
endfunction

setlocal includeexpr=PyInclude(v:fname)
setlocal define=^\\s*\\<\\(def\\\|class\\)\\>
