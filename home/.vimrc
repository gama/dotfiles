""""""""""" Vundle initialization """"""""""""
set nocompatible
set runtimepath+=~/.config/nvim/bundle/Vundle.vim
filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
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
set showmode
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
nnoremap <C-a>k   1<C-U>
nnoremap <C-a>j   1<C-D>
vnoremap <C-a>k   1<C-U>
vnoremap <C-a>j   1<C-D>
nnoremap <C-a>K   <C-U>
nnoremap <C-a>J   <C-D>
vnoremap <C-a>K   <C-U>
vnoremap <C-a>J   <C-D>
inoremap <C-a>K   <C-O><C-U>
inoremap <C-a>J   <C-O><C-D>

" horizontal scrolling
nnoremap <C-a>h   zhh
nnoremap <C-a>l   zll
vnoremap <C-a>h   zhh
vnoremap <C-a>l   zll

" search for visually selected text
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>
vnoremap <Leader>g y:grep! -r "\b<C-R>"\b" .<CR>:copen<CR><CR>/<C-R>"<CR>
nnoremap <Leader>g :grep! -r "\b<C-R><C-W>\b" .<CR>:copen<CR><CR>/<C-R>"<CR>
vnoremap <Leader>G y:Ggrep! "\b<C-R>"\b" .<CR>:copen<CR><CR>/<C-R>"<CR>
" nnoremap <Leader>G :Ggrep! "\b<C-R><C-W>\b" .<CR>:copen<CR><CR>/<C-R>"<CR>
nnoremap <Leader>G :Ggrep! "\b<C-R><C-W>\b" .<CR><CR>:copen<CR>

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
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>z :only<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <C-a>e    :CtrlPBuffer<CR>
nnoremap <silent> <Leader>p :CtrlPCurFile<CR>
nnoremap <silent> <Leader>] :CtrlPTag<CR>
nnoremap <silent> <Leader>o :CtrlP<CR>
nnoremap <silent> QQ        :qa!<CR>

" tab navigation
nnoremap <silent> <Leader>1 1gt
nnoremap <silent> <Leader>2 2gt
nnoremap <silent> <Leader>3 3gt
nnoremap <silent> <Leader>4 4gt
nnoremap <silent> <Leader>5 5gt
nnoremap <silent> <Leader>6 6gt
nnoremap <silent> <Leader>7 7gt
nnoremap <silent> <Leader>8 8gt
nnoremap <silent> <Leader>9 9gt
nnoremap <silent> <Leader>t :tabnew<CR>

" buffer navigation
nnoremap <C-a>n :bnext<CR>
nnoremap <C-a>p :bprev<CR>
nnoremap <C-a>] g<C-]>
nnoremap <C-a>[ <C-T>
vnoremap <C-a>] g<C-]>

" grepping
nnoremap gr :grep <cword> *<CR>
nnoremap Gr :grep <cword> %:p:h/*<CR>
nnoremap gR :grep '\b<cword>\b' *<CR>
nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>

" netrw
let g:netrw_silent=1

" comments
nnoremap <C-a>/ :Commentary<CR>j
vnoremap <C-a>/ :Commentary<CR>

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

" pymode
let g:pymode_python='python'
let g:pymode_options_max_line_length=999
let g:pymode_lint_options_pep8={ 'max_line_length': g:pymode_options_max_line_length }
let g:pymode_folding=0
let g:pymode_lint_on_write=1
let g:pymode_lint_checkers=['pyflakes', 'pep8']
let g:pymode_breakpoint_cmd='import ipdb; ipdb.set_trace()  # noqa; FIXME: remove breakpoing'
let g:pymode_doc_bind='K'
let g:pymode_run_bind=',ru'
let g:pymode_breakpoint_bind=',rb'
let g:pymode_rope=0
let g:pymode_rope_autoimport=0
let g:pymode_rope_autoimport_bind=',ra'
let g:pymode_rope_completion_bind='<C-n>'
let g:pymode_rope_goto_definition_bind='<C-a>b'
let g:pymode_rope_show_doc_bind=',d'
let g:pymode_rope_find_it_bind=',f'
let g:pymode_rope_organize_imports_bind=',ro'
let g:pymode_rope_rename_bind=',rn'
let g:pymode_rope_rename_module_bind=',r1r'
let g:pymode_rope_module_to_package_bind=',r1p'
let g:pymode_rope_extract_method_bind=',rm'
let g:pymode_rope_extract_variable_bind=',rv'
let g:pymode_rope_inline_bind=',ri'
let g:pymode_rope_move_bind=',rl'
let g:pymode_rope_generate_function_bind=',rf'
let g:pymode_rope_generate_class_bind=',rc'
let g:pymode_rope_generate_package_bind=',rp'
let g:pymode_rope_change_signature_bind=',rs'
let g:pymode_rope_use_function_bind=',ru'

" python-syntax
let g:python_highlight_all = 1

nnoremap <C-a><Space> <Space>
inoremap <C-a><Space> <Space>
vnoremap <C-a><Space> <Space>

"""""""""" Abbreviations """"""""""
cabbrev bx silent w\|bunload
cabbrev do diffoff \| set nowrap
cabbrev te <C-R>=getcmdpos() == 1 && getcmdtype()==':' ? "tabedit" : "te"<CR>

"""""""""" Variables """"""""""
" airline plugin
let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = ['branch', 'bufferline']
let g:airline_theme='custom'
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
    call airline#highlighter#add_accent('blue')
    call airline#highlighter#add_accent('white')
    call airline#highlighter#add_accent('blank')
endfunction

" bufferline
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:bufferline_echo = 0
let g:bufferline_rotate = 1
let g:bufferline_inactive_highlight = 'airline_c'
let g:bufferline_active_highlight = 'bufferline_selected'
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_separator = ' '
autocmd VimEnter * call ConfigBufferline()
function ConfigBufferline()
    let &statusline='%{bufferline#refresh_status()}' . bufferline#get_status_string()
    highlight! bufferline_selected_inactive ctermfg=250 ctermbg=236
    highlight link bufferline_selected airline_c_white
    highlight link bufferline_selected_inactive airline_c_blank
    highlight! link StatusLineNC airline_c_blank
endfunction

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
  \ 'PrtSelectMove("j")':   ['<c-a>j', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-a>k', '<up>'],
  \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
  \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
  \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
  \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
  \ 'PrtHistory(-1)':       ['<c-n>'],
  \ 'PrtHistory(1)':        ['<c-p>'],
  \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<M-h>', '<c-cr>'],
  \ 'AcceptSelection("t")': ['<M-t>'],
  \ 'AcceptSelection("v")': ['<M-v>', '<RightMouse>', '<c-a>\|', '<c-a>\\'],
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
    call jobstart('tmux send-keys -t! "l'.a:cmd.' -s -v" Enter')
    call jobstart('tmux select-window -t!')
endfunction
function! TmuxPaneStrategy(cmd)
    call jobstart('tmux send-keys -t.! "l'.a:cmd.' -s -v" Enter')
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
let g:indentLine_char            = '│'
let g:indentLine_color_term      = 254
let g:indentLine_color_gui       = '#A4E57E'
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark      = 1

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
