" 0"ay0:g/<pattern>/y A

" Speedup settings:
" set lazyredraw
" set noswapfile
" set undolevels=-1
" set eventignore=all
" set nohidden

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" SETINGS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set noautowrite
set background=dark
set backspace=2
set nobackup
set nocompatible
set comments=b:#,:%,fb:-,n:>,n:)
set complete=.,w,b,u,t
set completeopt=menuone,menu,longest,preview
"set cursorline
set nodigraph
set noerrorbells
set esckeys
set fillchars=stl:\ ,stlnc:\ ,vert:\ ,fold:-,diff:-
set formatoptions=tcqn
set formatlistpat=^\\s*[0-9-\\*]\\+[\\.:]\\?\\s\\+
"set formatlistpat=^\\s*[\\d\\-\\*]\\+[:\\.)}\\t\ ]\\s\\+
set helpheight=0
set hidden
"set highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
set history=100
set hlsearch
set noicon
set noignorecase
set noincsearch
set noinsertmode
set iskeyword=@,48-57,_,192-255,-
set nojoinspaces
set laststatus=2
set lazyredraw
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
set statusline=%=%m%r%w%y\ %-10.(%l,%c%V%)\ %P
set noshowcmd
set showmatch
set showmode
set smarttab
set softtabstop=4
set suffixes=".bak,.swp,~,CVS,.o"
set nostartofline
set tabstop=4
set tags=./.tags,./tags
set textwidth=999999
set viminfo=f0,'50,\"100,:500,n~/.viminfo
set visualbell
set t_vb=
set ttimeoutlen=10
set whichwrap=<,>
set wildchar=<TAB>
set wildmenu
set wildmode=longest:list,full
set winminheight=0
set winminwidth=0
set nowrap
set wrapmargin=1
set nowritebackup
set nomore

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" VARIABLES """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the <Leader> char
let mapleader = ","

" spell checking
let spell_root_menu   = '-'
let spell_auto_type   = ''
let spell_insert_mode = 0

" tag list plugin
let g:Tlist_Auto_Open            = 0
let g:Tlist_Inc_Winwidth         = 0
let g:Tlist_WinWidth             = 24
let g:Tlist_Display_Prototype    = 0
let g:Tlist_File_Fold_Auto_Close = 1
let g:Tlist_Enable_Fold_Column   = 0

" java's syntax script
let java_highlight_debug=1

" netrw specific variables 
let g:netrw_list_hide='^CVS$,^\.,\.swp$,.*\.o$,.*\.lo$,^\.deps$,^\.libs$'
let g:netrw_hide=1

" buftab
let g:buftabs_in_statusline=0
let g:buftabs_only_basename=1
let g:buftabs_active_highlight_group="StatusLineBufTabsCurrent"
let g:buftabs_inactive_highlight_group="StatusLine"

" minibufexpl
let g:miniBufExplVSplit          = 24
let g:miniBufExplMinSize         = 24
let g:miniBufExplMaxSize         = 24
let g:miniBufExplorerMoreThanOne = 1
let g:miniBufExplModSelTarget    = 1

" NERD Tree
let g:NERDTreeWinSize            = 24
let g:NERDTreeWinPos             = 'left'
let g:NERDTreeStatusline         = "Files - %{pathshorten(fnamemodify(b:NERDTreeRoot.path.strForOS(0), \":~:p\"))}"
let g:NERDTreeMapJumpNextSibling = "<C-n>"
let g:NERDTreeMapJumpPrevSibling = "<C-p>"

" NERD Commenter
nmap gc <plug>NERDCommenterComment
vmap gc <plug>NERDCommenterComment
let  g:NERDCreateDefaultMappings = 0

" disable a few plugins
" let g:loaded_netrwPlugin       = 1
let g:loaded_getscriptPlugin     = 1
let g:loaded_matchparen          = 1
let g:loaded_tarPlugin           = 1
let g:loaded_vimballPlugin       = 1
let g:loaded_zipPlugin           = 1
let loaded_rrhelper              = 1
let loaded_gzip                  = 1
let loaded_spellfile_plugin      = 1

" disable matchparen
let g:loaded_matchparen = 1
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" MAPINGS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" force screen redraw
nnoremap <C-L> :redraw!<CR>
inoremap <C-L> :redraw!<CR>

" fixed window vertical scrolling
nmap ê 1<C-D>
nmap ë 1<C-U>
vmap ê 1<C-D>
vmap ë 1<C-U>

" window navigation
" nmap Ë <C-W>k
" nmap Ê <C-W>j

" horizontal scrolling
noremap è zhh
noremap ì zll
vnoremap è zhh
vnoremap ì zll

" ctrl-backspace => erase a full word
inoremap ÿ <C-W>

" search for visually selected text
vmap * y/<C-R>"<CR>
vmap # y?<C-R>"<CR>

" window movements
" nmap <Leader>w <C-W>w
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-p> <C-W>p

nnoremap <silent> <Leader>cd :cd %:p:h<CR>
"noremap <Leader>e :Explore<CR>
nnoremap <Leader>e :NERDTreeToggle<CR>
nnoremap <Leader>s :Sexplore<CR>
nnoremap <Leader>d :call Kwbd()<CR>
nnoremap <Leader>x :w\|call Kwbd()<CR>
nnoremap <Leader>q :q<CR>
noremap <Leader>Q :bunload!<CR>
nnoremap î :bnext<CR>
nnoremap ð :bprevious<CR>

" preview window
nnoremap Ð :silent! call PreviewWord()<CR>

nnoremap gp mzp`z
nnoremap gP mzP`z
nnoremap <Leader>z :update<CR>
nnoremap <silent> <c-n> :noh<CR> 
cabbrev bx silent w\|bunload
cabbrev do diffoff \| set nowrap
cabbrev te <C-R>=getcmdpos() == 1 && getcmdtype()==':' ? "tabedit" : "te"<CR>
cabbrev form call Uncrustify()<CR>

map [[ :call OpenBracket_OpenBracket()<CR>
map ]] :call CloseBracket_CloseBracket()<CR>

" tab navigation
map <Leader>1 1gt
map <Leader>2 2gt
map <Leader>3 3gt
map <Leader>4 4gt
map <Leader>5 5gt
map <Leader>6 6gt
map <Leader>7 7gt
map <Leader>8 8gt
map <Leader>9 9gt
map <Leader>t :tabnew<CR>

" automatically input matching char
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap { {}<Esc>i
" inoremap < <><Esc>i

runtime macros/matchit.vim

" vim 7.3 specific
if v:version >= 703
    set path=,,**2/*,.,./**1/*
end
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" (AUTO)COMMANDS AND EXTRAS """""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! FormatXML let $XMLLINT_INDENT="\t" | silent %!xmllint --format --recover --html --htmlout --nowarning 2>/dev/null -
command! Mymake silent! make | redraw!
command! Mymakeinstall silent! make install | redraw!
command! -nargs=1 -complete=custom,CompleteLoadPlugins LoadPlugin call LoadPluginFunc("<args>")
command! IDE call IDE()

autocmd BufNewFile,BufReadPost *.tpl setfiletype html
autocmd BufNewFile,BufReadPost *.cxxtest setfiletype cpp
autocmd BufNewFile,BufReadPost *.vala setfiletype vala | set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufNewFile,BufReadPost *.vapi setfiletype vala | set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufNewFile,BufReadPost *.mxml set filetype=mxml
autocmd BufNewFile,BufReadPost *.as set filetype=actionscript
autocmd BufNewFile,BufReadPost *.nfo set filetype=nfo
autocmd BufNewFile,BufReadPost vimperator-* set tw=72
autocmd BufNewFile,BufReadPost .git/COMMIT_EDITMSG set tw=72
autocmd GUIEnter * call Gui()
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

filetype plugin indent on
syntax on

if (&term =~ 'xterm.*') || (&term == 'screen') || (&term =~ 'rxvt.*')
    set t_Co=256
    colorscheme dark2
elseif (has('gui'))
    colorscheme dark2
else
    colorscheme default
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" GUI STUFF """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Gui()
    set guioptions=aguit
    set guifont=Lucida\ Console\ Semi-Condensed\ 13.5
    set ch=1
endfunction

let g:I=0
function! INC(increment) 
    let g:I = g:I + a:increment 
    return g:I 
endfunction

function! LoadPluginFunc(name)
    let dirs = ["~/.vim/plugin/", "~/.vim/ftplugin/" . &filetype, "~/.vim/after/plugin/", "~/.vim/after/ftplugin/" . &filetype]
    for dir in dirs
        let path = expand(dir . a:name . ".vim.ondemand")
        if (filereadable(path))
            execute "source " . path
        endif
    endfor
endfunction

function! CompleteLoadPlugins(A,L,P)
    let paths = "~/.vim/plugin,~/.vim/ftplugin/".&filetype
    echo paths
    let all_paths = globpath(paths, "*.vim.ondemand")."\n"
    let result = ""
    while (strlen(all_paths) > 0)
        let filename = strpart(all_paths, 0, stridx(all_paths, "\n"))
        let result = result.fnamemodify(filename, ":t:r:r")."\n"
        let all_paths = strpart(all_paths, stridx(all_paths, "\n")+1)
    endwhile
    return result
endfunction

function! LoadRCSPlugin()
    let g:rvSaveDirectoryType = 1
    let g:rvSaveIfPreviousRCSFileExists = 0
    let g:rvSaveIfRCSExists = 0
    let g:rvSaveDirectoryName = $HOME."/.vim/rcs/"
    runtime! plugin/rcsvers.vim.ondemand
endfunction

"here is a more exotic version of my original Kwbd script
"delete the buffer; keep windows; create a scratch buffer if no buffers left
function! Kwbd()
    let l:bufNr = bufnr("%")
    let l:lastBuff = bufnr("$")
    let l:bufToLoad = -1

    let l:i = 1
    while (l:i <= l:lastBuff)
        if (bufloaded(l:i)) && (bufwinnr(l:i) == -1)
            let l:bufToLoad = l:i
            break
        endif
        let l:i = l:i + 1
    endwhile

    if (l:bufToLoad == -1)
        normal :q<CR>
    else
        execute "buffer " . l:bufToLoad
    endif
    execute "silent bwipeout " . l:bufNr
    if exists("*Buftabs_show")
        call Buftabs_show()
    endif
endfunction

" Find file in current directory and edit it
"function! Find(name)
"       let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
"       let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
"       if l:num < 1
"               echo "'".a:name."' not found"
"               return
"       endif
"       
"       if l:num != 1
"               echo l:list
"               let l:input=input("Which ? (CR=nothing)\n")
"               
"               if strlen(l:input)==0
"                       return
"               endif
"               
"               if strlen(substitute(l:input, "[0-9]", "", "g"))>0
"                       echo "Not a number"
"                       return
"               endif
"               
"               if l:input<1 || l:input>l:num
"                       echo "Out of range"
"                       return
"               endif
"               
"               let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
"       else
"               let l:line=l:list
"       endif
"       
"       let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
"       execute ":e ".l:line
"endfunction
"command! -nargs=1 Find :call Find("<args>")

function! OpenBracket_OpenBracket()
    "map [[ ?{<CR>w99[{zz:noh<CR>
    let __hls=&hlsearch
    set nohlsearch
    silent execute "normal ?{\<CR>"
    normal w99[{
    normal! zz0
    let @/=""
    let &hlsearch=__hls
endfunction
function! CloseBracket_CloseBracket()
    "map ]] :set nohls<CR>j0[[%/{<CR>zz:let @/=""<CR>:set hls<CR>
    let __hls=&hlsearch
    normal j0[[f{%
    silent execute "normal /{\<CR>"
    normal zz0
    let @/=""
    let &hlsearch=__hls
endfunction

function! Opencog(param)
    if (exists("b:opencog_done"))
        return
    endif
    let b:opencog_done = 1

    let basedir = a:param
    let parentdir = fnamemodify(basedir, ':h')
    while match(parentdir, "/opencog$") < 0 && parentdir != basedir
        let basedir   = parentdir
        let parentdir = fnamemodify(basedir, ':h')
    endwhile
    let g:opencog_basedir = basedir
    execute "setlocal path=.,/usr/include,".basedir."/src/**1,".basedir."/tests/**1"
    execute "setlocal tags=".basedir."/.tags"
    setlocal ts=4 tw=80 et
    set suffixesadd=.h
    map <Leader>C :pclose<CR>
    map g} <C-W>g}
    if (expand("%:e") == "cxxtest")
        map <buffer> <Leader>m :execute "silent make ".expand("%:t:r")." \| redraw!"<CR>
    elseif ((expand("%:e") == "h") || (expand("%:e") == "cc"))
        map <buffer> <Leader>m :execute "silent make ".expand("%:t:r").".o \| redraw!"<CR>
    end

    "command -nargs=1 -bang -complete=custom,OpenCogFileComplete Find edit<bang> <args>
    command! -nargs=1 -bang -complete=customlist,OpencogFileComplete Find find<bang> <args> " LoadOpencogFile("<args>")
    cabbr mf Find
endfunction

function! OpencogFileComplete(A,L,P)
    let paths  = split(globpath(g:opencog_basedir."/src/**", a:A."*.{h,cc}"), "\n")
    let paths += split(globpath(g:opencog_basedir."/tests/**", a:A."*.cxxtest"), "\n")
    let result = []
    for path in paths
        "call add(result, substitute(path, g:opencog_basedir."/", "", ""))
        call add(result, fnamemodify(path, ":t"))
    endfor
    return result
endfunction

function! FindInParentDirs(param)
    let dir = expand('%:p:h')
    while (!filereadable(dir."/".a:param)) && (!isdirectory(dir."/".a:param)) && (dir != "/")
        let dir = fnamemodify(dir, ':h')
    endwhile
    return dir."/".a:param
endfunction

function! IDE()
    LoadPlugin taglist
    Tlist
    NERDTree
endfunction

function! PreviewWord()
    if &previewwindow                   " don't do this in the preview window
        return
    endif

    " try to close opened preview window
    silent! wincmd P                " jump to preview window
    if &previewwindow               " if get there, it means it's open
        wincmd p                    " back to old window
        pclose                      " close the preview window
        return
    endif

    if pumvisible() == 1
        pclose
        return
    endif

    let w = expand("<cword>")           " get the word under cursor
    if w =~ '\a'                        " if the word contains a letter

        " Delete any existing highlight before showing another tag
        silent! wincmd P                " jump to preview window
        if &previewwindow               " if we really get there...
            match none                  " delete existing highlight
            wincmd p                    " back to old window
        endif

        " Try displaying a matching definition for the word under the cursor
        try
            execute "psearch " . w
        catch
            return
        endtry

        silent! wincmd P                        " jump to preview window
        if &previewwindow                       " if we really get there...
            if has("folding")
                silent! .foldopen               " don't want a closed fold
            endif
            call search("$", "b")               " to end of previous line
            let w = substitute(w, '\\', '\\\\', "")
            call search('\<\V' . w . '\>')      " position cursor on match

            " Add a match highlight to the word at this position
            highlight link previewWord Todo
            execute 'match previewWord "\%' . line(".") . 'l\%' . col(".") . 'c\k*"'

            normal zt
            wincmd p                            " back to old window
        endif
    endif
endfun

function! Uncrustify()
    let current_file      = expand("%:p")
    let uncrustify_config = $HOME . "/.uncrustifyrc"
    let formatted_file    = tempname()
    let command           = "uncrustify -c " . uncrustify_config . " -f " . current_file . " -o " . formatted_file
    execute "silent !" . command
    execute "botright vertical diffsplit " . formatted_file
endfunction
