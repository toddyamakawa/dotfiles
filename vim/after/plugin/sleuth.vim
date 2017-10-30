" Disable softtabstop and use tabstop value
autocmd FileType * setlocal softtabstop=0 shiftwidth=0
autocmd OptionSet expandtab if !&expandtab | set tabstop=4 | endif

