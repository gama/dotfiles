" uncomment to disable syntastic
let g:syntastic_python_checkers=['pylama']
nnoremap ,ro ofrom IPython.terminal.debugger import set_trace; set_trace()  # noqa; TODO: remove breakpoint<Esc>
nnoremap ,rO Ofrom IPython.terminal.debugger import set_trace; set_trace()  # noqa; TODO: remove breakpoint<Esc>

setlocal number
setlocal formatprg=autopep8\ --max-line-length=9999\ -
setlocal foldlevel=9999
setlocal regexpengine=1
nnoremap <buffer> mm :SyntasticCheck<CR>
nnoremap <buffer> mn :lnext<CR>
nnoremap <buffer> mp :lprev<CR>
nnoremap <buffer> mc :lclose<CR>
