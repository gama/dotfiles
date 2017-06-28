
" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "light"

hi Normal     guifg=#444444
hi Identifier ctermfg=0
hi Visual     ctermbg=254 ctermfg=None
hi Comment    ctermfg=247
hi NonText    gui=None
hi MoreMsg    gui=None
hi ModeMsg    gui=None
hi Question   gui=None
hi Title      gui=None
hi VisualNOS  gui=underline
hi StatusLine gui=reverse
hi Ignore     ctermfg=254  ctermbg=None
hi DiffAdd                 ctermbg=194 gui=None guibg=#dfffdf
hi DiffDelete ctermfg=NONE ctermbg=224 gui=None guibg=#ffdfdf
hi DiffChange              ctermbg=230 gui=None guibg=#ffffaf
hi DiffText                ctermbg=228 gui=None guibg=#ffffaf
hi TabLineSel gui=None
hi Statement  gui=None
hi Type       gui=None
hi Todo       ctermfg=0   ctermbg=226 guifg=black guibg=Yellow
hi Search     ctermfg=0   ctermbg=226 guifg=black guibg=Yellow
hi Pmenu      ctermbg=254             guibg=LightMagenta
hi PmenuSel   ctermfg=226 ctermbg=239 guibg=Grey
hi StatusLine   cterm=NONE ctermbg=252 ctermfg=236 gui=NONE guibg=#222 guifg=#aaa
hi StatusLineNC cterm=NONE ctermbg=254 ctermfg=246 gui=NONE guibg=#222 guifg=#ccc
hi StatusLineBufTabsCurrent cterm=NONE ctermfg=20 ctermbg=252 gui=NONE guifg=Yellow
hi VertSplit cterm=NONE
hi MatchParen ctermbg=253
hi CursorLine cterm=NONE ctermbg=231
hi Folded ctermfg=NONE ctermbg=253
hi LineNr ctermbg=255 ctermfg=169
hi SignColumn ctermbg=255 ctermfg=1
" vim: sw=2
