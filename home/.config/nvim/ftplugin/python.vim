" uncomment to disable syntastic
let g:syntastic_python_checkers=['pylama']
nnoremap ,rb ofrom IPython.terminal.debugger import set_trace; set_trace()  # noqa; TODO: remove breakpoint<Esc>

setlocal number
setlocal formatprg=autopep8\ --max-line-length=9999\ -
setlocal foldlevel=9999
nnoremap mm :SyntasticCheck<CR>
nnoremap mn :lnext<CR>
nnoremap mp :lprev<CR>
nnoremap mc :lclose<CR>
