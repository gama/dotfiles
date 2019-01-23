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

function! SmartClose() abort
    let ignorewin = []  " get(g:,'spacevim_smartcloseignorewin',[])
    let ignoreft  = []  " get(g:, 'spacevim_smartcloseignoreft',[])
    let win_count = winnr('$')
    let num = win_count
    for i in range(1,win_count)
        if index(ignorewin , bufname(winbufnr(i))) != -1 || index(ignoreft, getbufvar(bufname(winbufnr(i)),'&filetype')) != -1
            let num = num - 1
        endif
        if getbufvar(winbufnr(i),'&buftype') ==# 'quickfix'
            let num = num - 1
        endif
    endfor
    if num == 1
    else
        quit
    endif
endf
