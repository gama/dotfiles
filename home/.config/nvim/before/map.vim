let g:mapleader = " "
if !exists("g:maplocalleader")
    let g:maplocalleader = " "
endif

" force screen redraw
nnoremap <M-b> :redraw!<CR>
inoremap <M-b> :redraw!<CR>

" fixed window vertical scrolling
nnoremap K  1<C-U>
nnoremap J  1<C-D>
vnoremap K  1<C-U>
vnoremap J  1<C-D>

" horizontal scrolling
nnoremap H  5zh
nnoremap L  5zl
vnoremap H  5zh
vnoremap L  5zl
nnoremap gj J

" buffer navigation
nnoremap <silent> <M-n>     :<C-U>bnext<CR>
nnoremap <silent> <M-p>     :<C-U>bprev<CR>

" jumps
nnoremap <silent> <M-]>     g<C-]>
nnoremap <silent> <M-[>     <C-T>
vnoremap <silent> <M-]>     g<C-]>
nnoremap <silent> [q        :<C-U>cprev<CR>
nnoremap <silent> ]q        :<C-U>cnext<CR>
nnoremap <silent> [j        <C-o>
nnoremap <silent> ]j        <C-i>
nnoremap <silent> <M-[>     <PageUp>
nnoremap <silent> <M-]>     <PageDown>

" search for visually selected text
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>
vnoremap <Leader>g y:grep! -r "\b<C-R>"\b" .<CR>:copen<CR><CR>/<C-R>"<CR>
nnoremap <Leader>g :grep! -r "\b<C-R><C-W>\b" .<CR>:copen<CR><CR>/<C-R>"<CR>

" grepping
nnoremap gr :grep <cword> *<CR>
nnoremap Gr :grep <cword> %:p:h/*<CR>
nnoremap gR :grep '\b<cword>\b' *<CR>
nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>

" window movements & splits
nnoremap <silent> <M-w>     :<C-U>w<CR>
nnoremap <silent> q         :<C-U>call SmartClose()<CR>
nnoremap <silent> Q         q
nnoremap <silent> <Space>bd :<C-U>bd!<CR>
nnoremap <silent> <Space>qq :q<CR>
nnoremap <silent> <Space>w\ <C-W>v
nnoremap <silent> <Space>w- <C-W>s
nnoremap <silent> <Space>wm <C-W>o
nnoremap <silent> <Space>wd <C-W>q
nnoremap <silent> <Space>wl <C-W>l
nnoremap <silent> <Space>wh <C-W>h
nnoremap <silent> <Space>wj <C-W>j
nnoremap <silent> <Space>wk <C-W>k
nnoremap <silent> <Tab>     <C-W><C-W>

" toggles
nnoremap <silent> <Space>tn :<C-U>call ToggleNumbers()<CR>
nnoremap <silent> <Space>tb :<C-U>call ToggleBG()<CR>
nnoremap <silent> <Space>tc :<C-U>call ToggleColorColumn()<CR>
nnoremap <silent> <Space>tu :<C-U>call UpdateBG()<CR>
nnoremap <silent> <Space>tW :<C-U>call ToggleWrap()<CR>

" copy & paste
nnoremap <silent> <Space>yy "+y
vnoremap <silent> <Space>yy "+y
nnoremap <silent> <Space>yp "+p
vnoremap <silent> <Space>yp "+p
nnoremap <silent> <Space>yP "+P

" misc
nnoremap <silent> <Space>/  :<C-U>nohlsearch<CR>
nnoremap <silent> <Space>cd :lcd %:p:h<CR>
nnoremap <silent> <Space>fv :<C-U>edit ~/.config/nvim/init.vim<CR>:vsplit ~/.config/nvim<CR>
nnoremap <silent> <Space>os :<C-U>Startify<CR>
nnoremap <silent> <Space>fa :<C-U>wall<CR>
nnoremap <silent> <Space>fs :<C-U>w<CR>
nnoremap <silent> <Space>fS :<C-U>w !sudo tee "%" > /dev/null
nnoremap <silent> <M-q>     :<C-U>qa!<CR>
nnoremap <silent> <         <<
nnoremap <silent> >         >>
vnoremap <silent> <         <<
vnoremap <silent> >         >>

" completion
inoremap <expr><M-j> pumvisible() ? "\<C-n>" : "\<M-j>"
inoremap <expr><M-k> pumvisible() ? "\<C-p>" : "\<M-k>"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mhinz https://github.com/mhinz/vim-galore

" Saner behavior of n and N
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]

" Saner command-line history
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

" Saner CTRL-L
nnoremap <Space-/> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" Quickly move current line
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" Quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Quickly jump to header or source file
autocmd BufLeave *.{c,cpp} mark C
autocmd BufLeave *.h       mark H

" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv
