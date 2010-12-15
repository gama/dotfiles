setlocal modifiable filetype=railslog
silent! %s/\%(\e\[[0-9;]*m\|\r$\)//g
setlocal readonly nomodifiable noswapfile autoread foldmethod=syntax
nnoremap <buffer> <silent> R :checktime<CR>
nnoremap <buffer> <silent> G :checktime<Bar>$<CR>
nnoremap <buffer> <silent> q :bwipe<CR>
$
