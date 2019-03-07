autocmd User Fugitive vnoremap <Leader>g y:Ggrep! "\b<C-R>"\b" .<CR>:copen<CR><CR>/<C-R>"<CR>
autocmd User Fugitive nnoremap <Leader>g :Ggrep! "\b<C-R><C-W>\b" .<CR><CR>:copen<CR>
