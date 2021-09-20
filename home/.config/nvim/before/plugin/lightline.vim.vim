function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! GitBranch()
    return fugitive#Head(0, FugitiveExtractGitDir(getcwd()))
endfunction

function! s:lightline_update_colorscheme()
    if !exists('g:loaded_lightline')
        return
    endif
    try
        if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|seoul256\|Tomorrow'
            let g:lightline.colorscheme =
                        \ substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '')
        endif
        if g:colors_name =~# 'gruvboxcustom\|gruvbox-material' 
            runtime autoload/lightline/colorscheme/gruvbox_material.vim
        endif

        call lightline#init()
        call lightline#colorscheme()
        call lightline#update()
    catch
    endtry
endfunction

let g:lightline = {
    \   'colorscheme':        'gruvbox_material',
    \   'enable':             { 'statusline': 0, 'tabline': 1 },
    \   'tabline':            { 'left':  [['mode', 'paste'], ['gitbranch', 'readonly', 'modified'], ['buffers']],
    \                           'right': [['lineinfo', 'percent'], ['cocstatus']] },
    \   'subseparator':       { 'left': '', 'right': '' },
    \   'component_expand':   { 'buffers': 'lightline#bufferline#buffers' },
    \   'component_type':     { 'buffers': 'tabsel' },
    \   'component_function': { 'gitbranch': 'GitBranch', 'cocstatus': 'coc#status', 'currfunc': 'CocCurrentFunction' },
    \   'active':             {
    \       'left':  [[ 'mode', 'paste' ], ['gitbranch', 'readonly', 'modified', 'currfunc'], ['buffers']],
    \       'right': [[ 'lineinfo', 'percent'], ['filetype', 'cocstatus']]
    \   },
    \   'inactive':           {
    \       'left':  [[ 'filename' ]],
    \       'right': [[ 'lineinfo' ], [ 'percent' ]]
    \   }
    \ }

" let g:lightline = {
"     \   'colorscheme':        'gruvbox',
"     \   'tabline':            {'left': [['buffers']], 'right': [['close']]},
"     \   'subseparator':       { 'left': '', 'right': '' },
"     \   'component_expand':   { 'buffers': 'lightline#bufferline#buffers' },
"     \   'component_type':     { 'buffers': 'tabsel' },
"     \   'component_function': { 'gitbranch': 'fugitive#head', 'cocstatus': 'coc#status', 'currfunc': 'CocCurrentFunction' },
"     \   'active':             {
"     \       'left':  [[ 'mode', 'paste' ], ['gitbranch', 'readonly', 'modified', 'currfunc'], ['buffers']],
"     \       'right': [[ 'lineinfo', 'percent'], ['filetype', 'cocstatus']]
"     \   },
"     \   'inactive':           {
"     \       'left':  [[ 'filename' ]],
"     \       'right': [[ 'lineinfo' ], [ 'percent' ]]
"     \   }
"     \ }

let g:lightline#bufferline#show_number       = 2
let g:lightline#bufferline#shorten_path      = 0
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unicode_symbols   = 1
let g:lightline#bufferline#read_only         = ''
let g:lightline#bufferline#number_map        = { 0:'⁰', 1:'¹', 2:'²', 3:'³', 4:'⁴', 5:'⁵', 6:'⁶', 7:'⁷', 8:'⁸', 9:'⁹'}

" autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
augroup LightlineAuGroup
    autocmd!
    autocmd BufAdd,BufDelete,BufWritePost * call lightline#update()
    autocmd CursorMoved * redrawtabline
    autocmd ColorScheme * call s:lightline_update_colorscheme()
augroup END

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
