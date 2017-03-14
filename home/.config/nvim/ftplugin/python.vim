let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
" let g:loaded_python3_provider = 1
let g:pymode_python = 'python'
let g:pymode_options_max_line_length = 999
let g:pymode_lint_options_pep8 = { 'max_line_length': g:pymode_options_max_line_length }
let g:pymode_run_bind = ',r'
let g:pymode_breakpoint_bind = ',b'
let g:pymode_rope = 0
let g:pymode_folding = 0
let g:test#python#runner = 'pytest'

setlocal formatprg=autopep8\ --max-line-length=9999\ -
setlocal foldlevel=9999
nnoremap mn :lnext<CR>
nnoremap mp :lprev<CR>
