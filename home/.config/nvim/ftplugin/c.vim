setlocal tags+=~/.config/nvim/systags
setlocal path=.,,/usr/include
setlocal iskeyword=a-z,A-Z,48-57,_
nnoremap mm :make<CR>:copen<CR><CR>

nnoremap <buffer> <Space>= :<C-u>ClangFormat<CR>
vnoremap <buffer> <Space>= :ClangFormat<CR>
