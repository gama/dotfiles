let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore = ['\.o$', '\.lo$', '\.class$', '\.pyc$']

autocmd FileType nerdtree nmap <buffer> <Enter> go<Tab>
