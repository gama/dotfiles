""""""""""" Vundle initialization """"""""""""
set nocompatible
set runtimepath+=~/.config/nvim/bundle/Vundle.vim
filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'mgee/lightline-bufferline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdTree'
Plugin 'janko-m/vim-test'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'Yggdroot/indentLine'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'petRUShka/vim-opencl'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'elzr/vim-json'
Plugin 'vim-python/python-syntax'
Plugin 'lambdalisue/vim-cython-syntax'
Plugin 'zenbro/mirror.vim'
call vundle#end()
filetype plugin indent on

""" Global Settings
set autoindent
set noautowrite
set background=light
set backspace=2
set nobackup
set nocompatible
set comments=b:#,:%,fb:-,n:>,n:)
set complete=.,w,b,u,t
set completeopt=menuone,menu,longest
"set cursorline
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
set showcmd
set showmatch
set noshowmode
set smarttab
set splitright
set softtabstop=4
set suffixes=.bak,.swp,~,CVS,.o,.class,.pyc,.lo,.la
set nostartofline
set tabstop=4
set tags='tags,.tags,.git/tags'
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
nnoremap <C-L> :redraw!<CR>
inoremap <C-L> :redraw!<CR>

" fixed window vertical scrolling
nnoremap <M-k>  1<C-U>
nnoremap <M-j>  1<C-D>
vnoremap <M-k>  1<C-U>
vnoremap <M-j>  1<C-D>
nnoremap <M-K>  <C-U>
nnoremap <M-J>  <C-D>
vnoremap <M-K>  <C-U>
vnoremap <M-J>  <C-D>
inoremap <M-K>  <C-O><C-U>
inoremap <M-J>  <C-O><C-D>

" horizontal scrolling
nnoremap <M-h>  zhh
nnoremap <M-l>  zll
vnoremap <M-h>  zhh
vnoremap <M-l>  zll

" search for visually selected text
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>
vnoremap <Leader>g y:grep! -r "\b<C-R>"\b" .<CR>:copen<CR><CR>/<C-R>"<CR>
nnoremap <Leader>g :grep! -r "\b<C-R><C-W>\b" .<CR>:copen<CR><CR>/<C-R>"<CR>

" window movements & splits
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-p> <C-W>p
nnoremap <Leader>h <C-W>h
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l
nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>- :split<CR>

" misc
nnoremap <silent> <Leader>cd :cd %:p:h<CR>
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
nnoremap <silent> <Leader>s :NERDTreeFind<CR>
nnoremap <silent> <Leader>d :bd!<CR>
nnoremap <silent> <Leader>x :w\|bd!<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>Q :bunload!<CR>
nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap <silent> <Leader>w :call WriteToMirror()<CR>
nnoremap <silent> <Leader>z :only<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <C-a>e    :CtrlPBuffer<CR>
nnoremap <silent> <Leader>p :CtrlPCurFile<CR>
nnoremap <silent> <Leader>] :CtrlPTag<CR>
nnoremap <silent> <Leader>o :CtrlP<CR>
nnoremap <silent> QQ        :qa!<CR>

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

" netrw
let g:netrw_silent=1

" comments
nnoremap <M-/> :Commentary<CR>j
vnoremap <M-/> :Commentary<CR>

" fugitive
autocmd User Fugitive vnoremap <Leader>g y:Ggrep! "\b<C-R>"\b" .<CR>:copen<CR><CR>/<C-R>"<CR>
autocmd User Fugitive nnoremap <Leader>g :Ggrep! "\b<C-R><C-W>\b" .<CR><CR>:copen<CR>

" multicursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key='<Leader>m'
let g:multi_cursor_next_key='n'
let g:multi_cursor_prev_key='p'
let g:multi_cursor_skip_key='x'
let g:multi_cursor_quit_key='<Esc>'

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

" mirror
let g:mirror#config_path = "~/.config/mirrors.yaml"

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
    \   'colorscheme':        'custom',
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

" ctrlp
let g:ctrlp_map = ''
" let g:ctrlp_match_window_bottom = 0
" let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|vendor|venv|virtualenv|env)|(\.(swp|ico|git|svn|pyc|class))$'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:30'
let g:ctrlp_root_markers = ['pom.xml']
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<bs>', '<c-]>'],
  \ 'PrtDelete()':          ['<del>'],
  \ 'PrtDeleteWord()':      ['<c-w>'],
  \ 'PrtClear()':           ['<c-u>'],
  \ 'PrtSelectMove("j")':   ['<M-j>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<M-k>', '<up>'],
  \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
  \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
  \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
  \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
  \ 'PrtHistory(-1)':       ['<c-n>'],
  \ 'PrtHistory(1)':        ['<c-p>'],
  \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<M-O>', '<c-cr>'],
  \ 'AcceptSelection("t")': ['<M-t>'],
  \ 'AcceptSelection("v")': ['<M-o>', '<RightMouse>'],
  \ 'ToggleFocus()':        ['<s-tab>'],
  \ 'ToggleRegex()':        ['<c-r>'],
  \ 'ToggleByFname()':      ['<c-d>'],
  \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
  \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
  \ 'PrtExpandDir()':       ['<tab>'],
  \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
  \ 'PrtInsert()':          ['<c-\>'],
  \ 'PrtCurStart()':        ['<c-a>'],
  \ 'PrtCurEnd()':          ['<c-e>'],
  \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
  \ 'PrtCurRight()':        ['<c-l>', '<right>'],
  \ 'PrtClearCache()':      [''],
  \ 'PrtDeleteEnt()':       [''],
  \ 'CreateNewFile()':      ['<c-y>'],
  \ 'MarkToOpen()':         ['<c-z>'],
  \ 'OpenMulti()':          ['<c-o>'],
  \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
  \ }

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
nnoremap mT :TestFile<CR>
nnoremap ml :TestLast<CR>

" tabular
" vnoremap t= :Tabularize /=/<CR>
" vnoremap t, :Tabularize /,\zs/<CR>
" vnoremap t: :Tabularize /:\zs/<CR>

" EasyAlign
vmap A <Plug>(EasyAlign)

" IndentGuide
let g:indentLine_char      = '│'
let g:indentLine_setColors = 0

"""""""""" Autocommands """"""""""
command! -nargs=1 -complete=custom,CompleteLoadPlugins LoadPlugin call LoadPluginFunc("<args>")
autocmd BufNewFile,BufReadPost *.ejs setfiletype ejs
autocmd BufNewFile,BufReadPost /etc/nginx/*,/etc/nginx/conf.d/*,nginx.conf if &ft == '' | setfiletype nginx | endif
autocmd BufNewFile,BufReadPost .git/COMMIT_EDITMSG set tw=72
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
autocmd FileType * if (expand("<amatch>") != 'html') || (getfsize(expand("<afile>")) < 10240) | runtime macros/matchit.vim | end
autocmd GUIEnter * set guifont=Monospace\ 14
autocmd BufReadPost quickfix nnoremap <buffer> o <CR><C-W><C-W>

"""""""""" Others """"""""""
filetype plugin indent on
syntax on

if (&term =~ 'xterm.*') || (&term =~ 'screen.*') || (&term == 'tmux.*') || (&term =~ 'rxvt.*') || (&term == 'nvim')
    set t_Co=256
    colorscheme light
elseif (has('gui'))
    colorscheme light
else
    colorscheme default
endif

function! Bgrep(param)
    silent argdo try
    grepadd! something %
    catch /E480:/
    endtry
endfunction

function! WriteToMirror()
    " if exists("b:project_with_mirror") &&
    " \  exists("g:mirror#local_default_environments") &&
    " \  has_key(g:mirror#local_default_environments, b:project_with_mirror)
    "    echo "pushing to mirror"
    "    execute "MirrorPush"
   " endif
   write
endfunction
