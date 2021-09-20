let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore = ['\.o$', '\.lo$', '\.class$', '\.pyc$']

nnoremap <silent> <Space>ff :<C-U>NERDTreeFind<CR>
nnoremap <silent> <Space>ft :<C-U>NERDTreeToggle<CR>
nnoremap <silent> <Space>ot :<C-U>NERDTreeToggle<CR>

autocmd FileType nerdtree nmap <buffer> <Enter> go<Tab>
