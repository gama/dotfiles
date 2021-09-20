filetype plugin indent on
syntax on
colorscheme gruvboxcustom
" colorscheme gruvbox
" colorscheme gruvbox-material
" colorscheme default
" colorschem dichromatic

autocmd BufReadPost *        if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
autocmd BufReadPost quickfix nnoremap <buffer> o <CR><C-W><C-W>

" pseudo-detect terminal color
execute "set background=" . readfile(expand("~/.cache/termbg"))[0]
