" from SpaceVim/config/functions.vim

function! ToggleNumber()
    let s:isThereNumber = &nu
    let s:isThereRelativeNumber = &relativenumber
    if s:isThereNumber && s:isThereRelativeNumber
        set paste!
        set nonumber
        set norelativenumber
    else
        set paste!
        set number
        set relativenumber
    endif
endf

function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg ==# 'dark'
        set background=light
    else
        set background=dark
    endif
    call writefile([&background], expand("~/.cache/termbg"))
endfunction

function! UpdateBG()
    call nvim_set_option("background", readfile(expand("~/.cache/termbg"))[0])
endfunction

function! ToggleWrap()
    setlocal wrap!
    if &wrap
        set linebreak breakindent breakindentopt=sbr,shift:4
        nnoremap j gj
        nnoremap k gk
    else
        set nolinebreak nobreakindent
        nunmap j
        nunmap k
    endif
endfunction

function! ToggleColorColumn(...)
    let l:local = a:0 > 0 ? a:1 : 0
    let l:varname = l:local == 1 ? "&l:colorcolumn" : "&colorcolumn"
    let g:first_color_column = get(g:, 'first_color_column',  81)
    let g:last_color_column  = get(g:, 'last_color_column',  200)
    execute "let l:current_color_column=" . l:varname
    if l:current_color_column == ""
        execute "let ". l:varname . "=\"" . join(range(g:first_color_column, g:last_color_column), ",") . "\""
    else
        execute "let ". l:varname . "=\"\""
    endif
endfunction

function! SmartClose() abort
    let ignorewin = []
    let ignoreft  = []
    let win_count = winnr('$')
    let num = win_count
    for i in range(1,win_count)
        if index(ignorewin , bufname(winbufnr(i))) != -1 || index(ignoreft, getbufvar(bufname(winbufnr(i)),'&filetype')) != -1
            let num = num - 1
        endif
    endfor
    if num == 1
        if exists("*lightline#update")
            call lightline#update()
        endif
    else
        quit
    endif
endf

function! FindGitRoot()
    return system('git rev-parse --show-toplevel 2>/dev/null')[:-2]
endfunction
