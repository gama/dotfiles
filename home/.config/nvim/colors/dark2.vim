" Vim color file

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

"colorscheme default
let g:colors_name = "dark2"

" GUI
highlight Normal     guifg=grey80       guibg=black
highlight Search     guifg=black        guibg=#E4E4AA   gui=NONE
highlight Visual     guifg=black        guibg=Grey      gui=NONE
highlight Cursor     guifg=black        guibg=white     gui=NONE
highlight Special    guifg=orange
highlight PreProc    guifg=cyan
highlight Comment    guifg=#BFBFFF
highlight StatusLine guifg=black        guibg=white     gui=NONE
highlight StatusLineNC guifg=black      guibg=grey50    gui=NONE
highlight VertSplit  guifg=black        guibg=grey50    gui=NONE
highlight Statement  guifg=yellow                       gui=NONE
highlight Type       guifg=palegreen1                   gui=NONE
highlight Constant   guifg=orangered1                   gui=NONE
highlight Identifier guifg=white        guibg=NONE      gui=NONE
highlight LineNr     guifg=white                        gui=NONE

highlight Pmenu                         guibg=grey20
highlight PmenuSel   guifg=yellow       guibg=grey20
highlight TabLine    guifg=black        guibg=grey50    gui=NONE
highlight TabLineSel guifg=black        guibg=white     gui=NONE
highlight TabLineFill guifg=black       guibg=grey50    gui=NONE
highlight CursorLine                    guibg=grey20    gui=NONE

highlight SpellBad   guibg=red                          gui=NONE
highlight SpellCap   guibg=blue                         gui=NONE
highlight SpellRare  guibg=blue                         gui=NONE
highlight SpellLocal guibg=magenta                      gui=NONE

" CTERM
highlight Normal                        ctermbg=NONE    cterm=NONE
highlight Search     ctermfg=10         ctermbg=NONE    cterm=reverse
highlight Visual     ctermfg=15                         cterm=reverse
highlight Special    ctermfg=13                         cterm=NONE
highlight PreProc    ctermfg=14                         cterm=NONE
highlight Comment    ctermfg=12                         cterm=NONE
highlight Statement  ctermfg=11                         cterm=NONE
highlight Type       ctermfg=3                          cterm=NONE
highlight Constant   ctermfg=1                          cterm=NONE
highlight Identifier ctermfg=15         ctermbg=NONE    cterm=NONE
highlight LineNr     ctermfg=15                         cterm=NONE
highlight Title      ctermfg=225									    gui=NONE guifg=Magenta
highlight Ignore     ctermfg=15         ctermbg=NONE    cterm=NONE

highlight VertSplit    ctermfg=233 ctermbg=237 cterm=NONE guifg=#0f0f0f guibg=#3f3f3f
highlight StatusLine   ctermfg=233 ctermbg=252 cterm=NONE guifg=#0f0f0f guibg=#efefef
highlight StatusLineNC ctermfg=233 ctermbg=237 cterm=NONE guifg=#0f0f0f guibg=#3f3f3f
highlight StatusLineBufTabsCurrent ctermfg=55 ctermbg=252 cterm=NONE guifg=#4f1faf guibg=#efefef

highlight Pmenu                         ctermbg=8
highlight PmenuSel   ctermfg=11         ctermbg=8
highlight TabLine    ctermfg=0          ctermbg=237     cterm=NONE
highlight TabLineSel ctermfg=0          ctermbg=15      cterm=NONE
highlight TabLineFill ctermfg=0         ctermbg=237     cterm=NONE
highlight CursorLine                    ctermbg=234     cterm=NONE
highlight Folded     ctermfg=7          ctermbg=235     cterm=NONE

highlight SpellBad   ctermbg=1
highlight SpellCap   ctermbg=4
highlight SpellRare  ctermbg=4
highlight SpellLocal ctermbg=5

highlight DiffChange ctermfg=0          ctermbg=12      cterm=NONE
highlight DiffAdd    ctermfg=0          ctermbg=9       cterm=NONE
highlight DiffDelete ctermfg=0          ctermbg=14      cterm=NONE
highlight DiffText   ctermfg=0          ctermbg=11      cterm=NONE

highlight diffAdded   ctermfg=11                        cterm=NONE
highlight diffRemoved ctermfg=1                         cterm=NONE
highlight diffFile    ctermfg=15                        cterm=NONE
highlight diffNewFile ctermfg=15                        cterm=NONE
highlight diffLine    ctermfg=13                        cterm=NONE
highlight link diffNewFile diffAdded
highlight link diffOldFile diffRemoved
highlight link diffSubname diffLine


highlight link helpBar Subtitle
highlight link helpStar String

highlight MyTagListFileName ctermfg=3 ctermbg=NONE guifg=green guibg=NONE
"highlight StatusLineBufTabsCurrent ctermfg=55 ctermbg=15
