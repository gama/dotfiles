let mapleader = " "

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

" search for visually selected text
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>
vnoremap <Leader>g y:grep! -r "\b<C-R>"\b" .<CR>:copen<CR><CR>/<C-R>"<CR>
nnoremap <Leader>g :grep! -r "\b<C-R><C-W>\b" .<CR>:copen<CR><CR>/<C-R>"<CR>

" window movements & splits
nnoremap <silent> <M-w>     :<C-U>w<CR>
nnoremap <silent> q         :<C-U>call SmartClose()<CR>
nnoremap <silent> Q         q
nnoremap <silent> <Space>qq :q<CR>
nnoremap <silent> <Space>qQ :qa<CR>
nnoremap <silent> <Space>/  :<C-U>nohlsearch<CR>
nnoremap <silent> <Space>bd :<C-U>bd!<CR>
nnoremap <silent> <Space>fv :<C-U>edit ~/.config/nvim/init.vim<CR>
nnoremap <silent> <Space>ff :<C-U>NERDTreeFind<CR>
nnoremap <silent> <Space>ft :<C-U>NERDTreeToggle<CR>
nnoremap <silent> <Space>ot :<C-U>NERDTreeToggle<CR>
nnoremap <silent> <Space>oo :<C-U>Files<CR>
nnoremap <silent> <Space>of :<C-U>execute "Files " . expand("%:h")<CR>
nnoremap <silent> <Space>oe :<C-U>Buffers<CR>
nnoremap <silent> <Space>oh :<C-U>Helptags<CR>
nnoremap <silent> <Space>fa :<C-U>wall<CR>
nnoremap <silent> <Space>fs :<C-U>w<CR>
nnoremap <silent> <Space>fS :<C-U>w !sudo tee "%" > /dev/null
nnoremap <silent> <Space>tn :<C-U>call ToggleNumbers()<CR>
nnoremap <silent> <Space>tb :<C-U>call ToggleBG()<CR>
nnoremap <silent> <Space>tu :<C-U>call UpdateBG()<CR>
nnoremap <silent> <Space>w\ <C-W>v
nnoremap <silent> <Space>w- <C-W>s
nnoremap <silent> <Space>wm <C-W>o
nnoremap <silent> <Space>wd <C-W>q
nnoremap <silent> <Space>wl <C-W>l
nnoremap <silent> <Space>wh <C-W>h
nnoremap <silent> <Space>wj <C-W>j
nnoremap <silent> <Space>wk <C-W>k
nnoremap <silent> <Tab>     <C-W><C-W>
nnoremap <silent> <M-e>     :<C-U>Buffers<CR>
nnoremap <silent> <M-f>     :<C-U>execute "Files " . expand("%:h")<CR>
nnoremap <silent> <M-]>     :<C-U>Tags<CR>
nnoremap <silent> <M-o>     :<C-U>Files<CR>
nnoremap <silent> <M-?>     :<C-U>Helptags<CR>
nnoremap <silent> <M-q>     :<C-U>qa!<CR>
nnoremap <silent> <M-n>     :<C-U>bnext<CR>
nnoremap <silent> <M-p>     :<C-U>bprev<CR>

" nnoremap <silent> [q      :cprev<CR>
" nnoremap <silent> ]q      :cnext<CR>
nnoremap <silent> [j        <C-o>
nnoremap <silent> ]j        <C-i>
nnoremap <silent> <M-[>     <C-b>
nnoremap <silent> <M-]>     <C-f>
nnoremap <silent> <         <<
nnoremap <silent> >         >>
vnoremap <silent> <         <<
vnoremap <silent> >         >>
nnoremap          <Space><Space> :

" buffer navigation
nnoremap <M-n> :bnext<CR>
nnoremap <M-p> :bprev<CR>
nnoremap <M-]> g<C-]>
nnoremap <M-[> <C-T>
vnoremap <M-]> g<C-]>

" grepping
nnoremap gr :grep <cword> *<CR>
nnoremap Gr :grep <cword> %:p:h/*<CR>
nnoremap gR :grep '\b<cword>\b' *<CR>
nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>

" completion
inoremap <expr><M-j> pumvisible() ? "\<C-n>" : "\<M-j>"
inoremap <expr><M-k> pumvisible() ? "\<C-p>" : "\<M-k>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" neovim terminal customizations
if has("nvim")
endif
