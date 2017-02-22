" Vim color file

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

"colorscheme default
let g:colors_name = "dark"

" GUI
highlight Normal     guifg=grey90       guibg=black
highlight Search     guifg=black        guibg=#E4E4AA   gui=NONE
highlight Visual     guifg=black                        gui=bold
highlight Cursor     guifg=black        guibg=white     gui=NONE
highlight Special    guifg=orange
highlight PreProc    guifg=cyan
highlight Comment    guifg=#BFBFFF
highlight StatusLine guifg=black        guibg=white     gui=NONE
highlight StatusLineNC guifg=#555555    guibg=#CCCCCC   gui=NONE
highlight Statement  guifg=yellow                       gui=NONE
highlight Type       guifg=palegreen1                   gui=NONE
highlight Constant   guifg=orangered1                   gui=NONE

highlight Normal                        ctermbg=NONE
highlight Search     ctermfg=1          ctermbg=NONE    cterm=bold,reverse
highlight Visual     ctermfg=7                          cterm=bold,reverse
highlight Cursor                        ctermbg=7       cterm=NONE
highlight Special    ctermfg=5                          cterm=bold
highlight PreProc    ctermfg=6                          cterm=NONE
highlight Comment    ctermfg=3                          cterm=bold
highlight StatusLine ctermfg=7                          cterm=reverse,bold
highlight StatusLineNC ctermfg=0                        cterm=reverse,bold
highlight Statement  ctermfg=2                          cterm=bold
highlight Type       ctermfg=3                          cterm=NONE
highlight Constant   ctermfg=1                          cterm=NONE
highlight Identifier ctermfg=NONE       ctermbg=NONE    cterm=NONE
highlight LineNr     ctermfg=7                          cterm=bold

highlight DiffChange ctermfg=0          ctermbg=4       cterm=NONE
highlight DiffAdd    ctermfg=0          ctermbg=5       cterm=NONE
highlight DiffDelete ctermfg=0          ctermbg=6       cterm=NONE
highlight DiffText   ctermfg=0          ctermbg=1       cterm=NONE

highlight Pmenu      ctermbg=4
highlight PmenuSel   ctermfg=0
