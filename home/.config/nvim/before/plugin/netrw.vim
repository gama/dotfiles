let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 2
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1
let g:netrw_silent         = 1
let g:netrw_special_syntax = 1
let g:netrw_list_hide      = netrw_gitignore#Hide().'.*\.swp$'

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    nmap <buffer> o <Enter>
    nmap <buffer> g? :<C-U>he netrw-quickhelp<CR>
endfunction

nnoremap <silent> <Space>ff :<C-U>Vexplore<CR>
nnoremap <silent> <Space>ft :<C-U>Lexplore<CR>
nnoremap <silent> <Space>ot :<C-U>execute "Lexplore " . fnamemodify(finddir('.git/', expand('%:p:h').';'), ":h")<CR>
