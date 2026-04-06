setlocal iskeyword=@,48-57,_,192-255,#,-
syntax match ssh_knownhost_pubkey "AAAA[0-9a-zA-Z+/]\+[=]\{0,2}
highlight def link ssh_knownhost_pubkey Special

syn keyword sshalg ssh-rsa
hi def link sshalg Identifier

syn match ssh_knownhost_ip "\<\(\d{1,3}\.\)\{3}\d\{1,3}\>
hi def link ssh_knownhost_ip Constant

