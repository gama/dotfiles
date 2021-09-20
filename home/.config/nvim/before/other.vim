filetype plugin indent on
syntax on
" colorscheme is set in the respective plugin config
" colorscheme default

autocmd BufReadPost *        if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
autocmd BufReadPost quickfix nnoremap <buffer> o <CR><C-W><C-W>

" pseudo-detect terminal color
execute "set background=" . readfile(expand("~/.cache/termbg"))[0]
