""""""""""" Vundle initialization """"""""""""
set nocompatible
set runtimepath+=~/.config/nvim/bundle/Vundle.vim
filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" look & feel
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim'
Plugin 'mgee/lightline-bufferline'
Plugin 'Yggdroot/indentLine'

" navigation, buffer and file management
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdTree'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'

" development
Plugin 'janko-m/vim-test'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'zenbro/mirror.vim'
Plugin 'whiteinge/diffconflicts'

" syntax & filetypes
Plugin 'petRUShka/vim-opencl'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'elzr/vim-json'
Plugin 'vim-python/python-syntax'
Plugin 'lambdalisue/vim-cython-syntax'
call vundle#end()
filetype plugin indent on

""" Global Settings
set autoindent
set noautowrite
" set background=dark
set background&
set backspace=2
set nobackup
set nocompatible
set comments=b:#,:%,fb:-,n:>,n:)
set complete=.,w,b,u,t
set completeopt=menuone,menu,longest
set cursorline
set nodigraph
set noerrorbells
set expandtab
set fillchars=stl:\ ,stlnc:\ ,vert:\│,fold:-,diff:-
set formatoptions=tcqn
set formatlistpat=^\\s*[0-9-\\*]\\+[\\.:]\\?\\s\\+
set helpheight=0
set hidden
set history=1000
set hlsearch
set noicon
set noignorecase
set noincsearch
set noinsertmode
set iskeyword=@,48-57,_,192-255,-
set nojoinspaces
set laststatus=2
" set lazyredraw
set magic
"set matchpairs+=<:>
set mouse=""
set nonumber
set nrformats="alpha,hex"
set path=.
set report=1
set ruler
set scrolloff=1
set shell=sh
set shiftwidth=4
set shortmess=atI
set statusline=%=%m%r%w%y\ %8.(%l,%c%)\ %P
set noshowcmd
set showmatch
set noshowmode
set smarttab
set splitright
set softtabstop=4
set suffixes=.bak,.swp,~,CVS,.o,.class,.pyc,.lo,.la
set nostartofline
set tabstop=4
set tags='tags,.tags,.git/tags'
set termguicolors
set textwidth=999999
set t_vb=
set timeout
set timeoutlen=300
set title
set titlestring=%t%m\ -\ VIM
set ttimeout
set ttimeoutlen=-1
if has("nvim")
    set viminfo=f0,'50,\"100,:500,n~/.cache/nvim/viminfo
else
    set esckeys
    set viminfo=f0,'50,\"100,:500,n~/.origviminfo
endif
set visualbell
set whichwrap=<,>
set wildchar=<TAB>
set wildmenu
set wildmode=longest:list,full
set wildignore==*.o,*.obj,*.class
set winminheight=0
set winminwidth=0
set nowrap
set wrapmargin=1
set nowritebackup
set nomore

"""""""""" Mappings """"""""""
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

" window movement and management
noremap <silent> <M-l>   :TmuxNavigateRight<CR>
noremap <silent> <M-h>   :TmuxNavigateLeft<CR>
noremap <silent> <M-k>   :TmuxNavigateUp<CR>
noremap <silent> <M-j>   :TmuxNavigateDown<CR>
noremap <silent> [SPC]w\ <C-W>v<C-W>w
noremap <silent> [SPC]w- <C-W>s<C-W>w

" search for visually selected text
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>
vnoremap <Leader>g y:grep! -r "\b<C-R>"\b" .<CR>:copen<CR><CR>/<C-R>"<CR>
nnoremap <Leader>g :grep! -r "\b<C-R><C-W>\b" .<CR>:copen<CR><CR>/<C-R>"<CR>

" window movements & splits
nnoremap <silent> <M-w>     :<C-U>w<CR>
nnoremap <silent> <Space>qq :q<CR>
nnoremap <silent> <Space>qQ :qa<CR>
nnoremap <silent> <Space>/  :<C-U>nohlsearch<CR>
nnoremap <silent> <Space>bd :<C-U>bd!<CR>
nnoremap <silent> <Space>ff :<C-U>NERDTreeFind<CR>
nnoremap <silent> <Space>oo :<C-U>Files<CR>
nnoremap <silent> <Space>op :<C-U>execute "Files " . expand("%:h")<CR>
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
nnoremap <silent> <M-e>     :<C-U>Buffers<CR>
nnoremap <silent> <M-f>     :<C-U>execute "Files " . expand("%:h")<CR>
nnoremap <silent> <M-]>     :<C-U>Tags<CR>
nnoremap <silent> <M-o>     :<C-U>Files<CR>
nnoremap <silent> <M-?>     :<C-U>Helptags<CR>
nnoremap <silent> <M-q>     :<C-U>qa!<CR>
nnoremap <silent> <M-n>     :<C-U>bnext<CR>
nnoremap <silent> <M-p>     :<C-U>bprev<CR>

nnoremap <silent> [q        :cprev<CR>
nnoremap <silent> ]q        :cnext<CR>
nnoremap <silent> [j        <C-o>
nnoremap <silent> ]j        <C-i>
nnoremap <silent> [a        <C-b>
nnoremap <silent> ]a        <C-f>
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

" ----------- plugin specific configuration ---------

" netrw
let g:netrw_silent=1

" fzf
let g:fzf_action = {
  \ 'alt-t': 'tab split',
  \ 'alt-p': 'vsplit',
  \ 'alt-o': 'split' }


" comments
nnoremap <M-/> :Commentary<CR>j
vnoremap <M-/> :Commentary<CR>

" fugitive
autocmd User Fugitive vnoremap <Leader>g y:Ggrep! "\b<C-R>"\b" .<CR>:copen<CR><CR>/<C-R>"<CR>
autocmd User Fugitive nnoremap <Leader>g :Ggrep! "\b<C-R><C-W>\b" .<CR><CR>:copen<CR>

" multicursor
let g:multi_cursor_use_default_mapping=0
" let g:multi_cursor_start_key='<Leader>m'
" let g:multi_cursor_next_key='n'
" let g:multi_cursor_prev_key='p'
" let g:multi_cursor_skip_key='x'
" let g:multi_cursor_quit_key='<Esc>'

" syntastic
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_check_on_open = 0
nnoremap mm :SyntasticCheck<CR>
nnoremap mn :lnext<CR>
nnoremap mp :lprev<CR>
nnoremap mc :lclose<CR>

" python-syntax
let g:python_highlight_all = 1

" mirror.vim
let g:mirror#config_path = expand("~/.config/mirrors.yaml")
autocmd BufWritePost * call WriteToMirror()
function! WriteToMirror()
    if  exists('b:project_with_mirror') &&
    \   exists('g:mirror#local_default_environments') &&
    \   has_key(g:mirror#local_default_environments, b:project_with_mirror)
        silent MirrorPush
    endif
endfunction

" complete
inoremap <M-j>  <C-n>
inoremap <M-k>  <C-p>

"""""""""" Abbreviations """"""""""
cabbrev bx silent w\|bunload
cabbrev do diffoff \| set nowrap
cabbrev te <C-R>=getcmdpos() == 1 && getcmdtype()==':' ? "tabedit" : "te"<CR>

"""""""""" Variables """"""""""
" lightlight
let g:lightline = {
    \   'colorscheme':        'gruvbox',
    \   'subseparator':       { 'left': '', 'right': '' },
    \   'component_expand':   { 'buffers': 'lightline#bufferline#buffers' },
    \   'component_type':     { 'buffers': 'tabsel' },
    \   'component_function': { 'gitbranch': 'fugitive#head' },
    \   'active':             {
    \       'left':  [[ 'mode', 'paste' ], ['gitbranch', 'readonly', 'modified'], ['buffers']],
    \       'right': [[ 'lineinfo', 'percent'], ['filetype' ]]
    \   },
    \   'inactive':           {
    \       'left':  [[ 'filename' ]],
    \       'right': [[ 'lineinfo' ], [ 'percent' ]]
    \   }
    \ }
let g:lightline#bufferline#show_number       = 2
let g:lightline#bufferline#shorten_path      = 0
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unicode_symbols   = 1
let g:lightline#bufferline#read_only         = ''
let g:lightline#bufferline#number_map        = { 0:'⁰', 1:'¹', 2:'²', 3:'³', 4:'⁴', 5:'⁵', 6:'⁶', 7:'⁷', 8:'⁸', 9:'⁹'}
" autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
autocmd BufWritePost * call lightline#update()
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

" tmux + vim integrated movement
if !has('gui_running') && $TERM =~# '^\%(screen\|tmux\)' && empty(&t_ts)
    " enable window title
    let &t_ts = "\e]2;"
    let &t_fs = "\007"
endif


" NERDTree
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore = ['\.o$', '\.lo$', '\.class$', '\.pyc$']

" vim-test
function! TmuxWindowStrategy(cmd)
    call jobstart('tmux send-keys -t! Escape "A'.a:cmd.' -s -v" Enter')
    call jobstart('tmux select-window -t!')
endfunction
function! TmuxPaneStrategy(cmd)
    call jobstart('tmux send-keys -t.! Escape "A'.a:cmd.' -s -v" Enter')
endfunction
let g:test#custom_strategies = {'tmux_window': function('TmuxWindowStrategy'), 'tmux_pane': function('TmuxPaneStrategy')}
let g:test#strategy          = 'tmux_pane'
let g:test#python#runner     = 'pytest'
nnoremap mt :TestNearest<CR>
nnoremap md :TestNearest --pdb -x<CR>
nnoremap mT :TestFile<CR>
nnoremap ml :TestLast --pdb -x<CR>

" tabular
" vnoremap t= :Tabularize /=/<CR>
" vnoremap t, :Tabularize /,\zs/<CR>
" vnoremap t: :Tabularize /:\zs/<CR>

" EasyAlign
vmap A <Plug>(EasyAlign)

" IndentLine
let g:indentLine_char      = '│'
let g:indentLine_setColors = 0


" gruvbox
let g:gruvbox_contrast_light='medium'
let g:gruvbox_contrast_dark='medium'


" pseudo-detect terminal color
execute "set background=" . readfile(expand("~/.cache/termbg"))[0]


"""""""""" Autocommands """"""""""
autocmd BufReadPost *        if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
autocmd BufReadPost quickfix nnoremap <buffer> o <CR><C-W><C-W>

"""""""""" Others """"""""""
filetype plugin indent on
syntax on
set t_Co=256
colorscheme gruvboxcustom
