let s:normalNCCtermBg = ''
let s:normalNCGuiBg   = ''

function! s:goyo_enter()
    let s:normalNCCtermBg = synIDattr(synIDtrans(hlID("NormalNC")), "bg", "cterm")
    let s:normalNCGuiBg = synIDattr(synIDtrans(hlID("NormalNC")), "bg", "gui")
    highlight NormalNC ctermbg=None guibg=None

    " silent !tmux set status off
    " silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    " set noshowmode
    " set noshowcmd
    " set scrolloff=999
    " Limelight
    " ...
endfunction

function! s:goyo_leave()
    execute "highlight NormalNC ctermbg=" . s:normalNCCtermBg . " guibg=" . s:normalNCGuiBg
    let s:normalNCCtermBg = ''
    let s:normalNCGuiBg   = ''

    " silent !tmux set status on
    " silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    " set showmode
    " set showcmd
    " set scrolloff=5
    " Limelight!
    " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
