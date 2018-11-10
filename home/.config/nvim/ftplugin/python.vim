let g:syntastic_python_checkers=['pylama']

setlocal number
setlocal formatprg=autopep8\ --max-line-length=9999\ -
setlocal regexpengine=1

nnoremap <buffer> mm      :SyntasticCheck<CR>
nnoremap <buffer> mn      :lnext<CR>
nnoremap <buffer> mp      :lprev<CR>
nnoremap <buffer> mc      :lclose<CR>
nnoremap <buffer> mz      :g/raise.*(/normal zf%<CR>
nnoremap <buffer> [SPC]tW :call ToggleWrap()<CR>
nnoremap <buffer> [SPC]ib Ofrom IPython.terminal.debugger import set_trace; set_trace()  # noqa; TODO: remove breakpoint<Esc>
nnoremap <buffer> [SPC]iB ofrom IPython.terminal.debugger import set_trace; set_trace()  # noqa; TODO: remove breakpoint<Esc>

function! ToggleWrap()
    setlocal wrap!
    if &wrap
        set breakindent breakindentopt=sbr,shift:4
        nnoremap j gj
        nnoremap k gk
    else
        set nobreakindent
        nunmap j
        nunmap k
    endif
endfunction
