setlocal shiftwidth=2 tabstop=2 expandtab
let b:ale_fixers = ['tslint']
let g:deoplete#enabled_at_startup = 1
let g:nvim_typescript#diagnostics_enable=0
autocmd BufWrite *.ts,*.tsx TSGetDiagnostics

" vim-test support
function! TypeScriptTransform(cmd) abort
  return substitute(a:cmd, '\v/(\S+)\.ts', '/\1.js', '')
endfunction
let g:test#custom_transformations          = {'typescript': function('TypeScriptTransform')}
let g:test#transformation                  = 'typescript'
let g:test#javascript#ava#file_pattern     = '\vtests?/.*\.(js|jsx|coffee|ts|tsx)$'
let g:test#javascript#karma#file_pattern   = '\vtests?/.*\.(js|jsx|coffee|ts|tsx)$'
let g:test#javascript#jasmine#file_pattern = '\vtests?/.*\.(js|jsx|coffee|ts|tsx)$'
let g:test#javascript#jest#file_pattern    = '\vtests?/.*\.(js|jsx|coffee|ts|tsx)$'
let g:test#javascript#mocha#file_pattern   = '\vtests?/.*\.(js|jsx|coffee|ts|tsx)$'

nnoremap <Space>lc :<C-U>TSTypeDef<CR>
nnoremap <Space>ld :<C-U>TSDoc<CR>
nnoremap <Space>le :<C-U>TSRename<CR>
nnoremap <Space>lf :<C-U>TSGetCodeFix<CR>
nnoremap <Space>li :<C-U>TSImport<CR>
nnoremap <Space>lp :<C-U>TSDef<CR>
nnoremap <Space>lP :<C-U>TSDefPreview<CR>
nnoremap <Space>lr :<C-U>TSRefs<CR>
nnoremap <Space>ls :<C-U>TSSearch <C-R><C-W> *<CR><CR>
nnoremap <Space>lt :<C-U>TSType<CR>
nnoremap <Space>lgd :<C-U>JsDoc<CR>
