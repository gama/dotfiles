" syntastic
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_check_on_open = 0
nnoremap mm :SyntasticCheck<CR>
nnoremap mn :lnext<CR>
nnoremap mp :lprev<CR>
nnoremap mc :lclose<CR>
