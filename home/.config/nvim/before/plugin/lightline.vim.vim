let g:lightline = {
    \   'colorscheme':        'gruvbox',
    \   'subseparator':       { 'left': '', 'right': '' },
    \   'component_expand':   { 'buffers': 'lightline#bufferline#buffers' },
    \   'component_type':     { 'buffers': 'tabsel' },
    \   'component_function': { 'gitbranch': 'fugitive#head' },
    \   'active':             {
    \       'left':  [[ 'mode', 'paste' ], ['gitbranch', 'readonly', 'modified'], ['buffers']],
    \       'right': [[ 'lineinfo', 'percent'], ['filetype' ]]
    \   },
    \   'inactive':           {
    \       'left':  [[ 'filename' ]],
    \       'right': [[ 'lineinfo' ], [ 'percent' ]]
    \   }
    \ }
let g:lightline#bufferline#show_number       = 2
let g:lightline#bufferline#shorten_path      = 0
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unicode_symbols   = 1
let g:lightline#bufferline#read_only         = ''
let g:lightline#bufferline#number_map        = { 0:'⁰', 1:'¹', 2:'²', 3:'³', 4:'⁴', 5:'⁵', 6:'⁶', 7:'⁷', 8:'⁸', 9:'⁹'}

" autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
autocmd BufWritePost * call lightline#update()

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
