" uncomment to disable syntastic
" let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_python_checkers=['pylama']
nnoremap ,rb Oimport ipdb; ipdb.set_trace()  # noqa; TODO: remove breakpoint<Esc>

setlocal number
setlocal formatprg=autopep8\ --max-line-length=9999\ -
setlocal foldlevel=9999
nnoremap mm :SyntasticCheck<CR>\|:Errors<CR><CR>
nnoremap mn :lnext<CR>
nnoremap mp :lprev<CR>
nnoremap mc :lclose<CR>
