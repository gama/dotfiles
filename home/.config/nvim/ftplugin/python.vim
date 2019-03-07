let g:syntastic_python_checkers=['pylama']

setlocal number
setlocal formatprg=autopep8\ --max-line-length=9999\ -
setlocal regexpengine=1

if g:loaded_neomake
    nnoremap <buffer> mm :Neomake<CR>
else
    nnoremap <buffer> mm :SyntasticCheck<CR>
endif
nnoremap <buffer> mn      :<C-u>lnext<CR>
nnoremap <buffer> mp      :<C-u>lprev<CR>
nnoremap <buffer> mc      :<C-u>lclose<CR>
nnoremap <buffer> mz      :<C-u>g/\(log\.\\|logger\.\\|raise \).*(.*[^)]\s*$/normal zf%<CR>
nnoremap <buffer> md      :<C-u>TestNearest --pdb -x<CR>
nnoremap <buffer> ml      :<C-u>TestLast --pdb -x<CR>
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
