let g:fzf_action = {
  \ 'alt-t': 'tab split',
  \ 'alt-p': 'vsplit',
  \ 'alt-o': 'split' }

" Customize fzf colors to match your color scheme
let g:fzf_colors = {}

let $FZF_DEFAULT_OPTS .= ' --layout=reverse --no-border --no-border'
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--no-border', '--info=inline']}, <bang>0)

let g:fzf_layout = { 'down': '30%' }

autocmd FileType fzf tmapclear <buffer> | tmapclear

" nnoremap <command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <silent> <Space>oo :<C-U>execute "Files " . FindGitRoot()<CR>
nnoremap <silent> <M-o>o    :<C-U>execute "Files " . FindGitRoot()<CR>
nnoremap <silent> <Space>oi :<C-U>Files<CR>
nnoremap <silent> <Space>of :<C-U>execute "Files " . expand("%:h")<CR>
nnoremap <silent> <M-f>     :<C-U>execute "Files " . expand("%:h")<CR>
nnoremap <silent> <Space>oe :<C-U>Buffers<CR>
nnoremap <silent> <M-e>     :<C-U>Buffers<CR>
nnoremap <silent> <Space>oh :<C-U>Helptags<CR>
nnoremap <silent> <M-?>     :<C-U>Helptags<CR>
nnoremap <silent> <Space>g  :<C-U>Rg <C-R><C-W><CR>
vnoremap <silent> <Space>g  y:<C-U>Rg <C-R>"<CR>

command! -bang -nargs=* FzfGitGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--no-border', '--info=inline']}, <bang>0)

" mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
