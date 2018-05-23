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

hi Normal                                                                 guifg=#444444
hi Identifier                          ctermfg=0
hi Visual                              ctermfg=None ctermbg=254
hi Comment                             ctermfg=247
hi NonText                                                       gui=None
hi MoreMsg                                                       gui=None
hi ModeMsg                                                       gui=None
hi Question                                                      gui=None
hi Title                                                         gui=None
hi VisualNOS                                                     gui=underline
hi StatusLine                                                    gui=reverse
hi Ignore                              ctermfg=254  ctermbg=None
hi DiffAdd                                          ctermbg=194  gui=None                        guibg=#dfd
hi DiffDelete                          ctermfg=NONE ctermbg=224  gui=None                        guibg=#fdd
hi DiffChange                                       ctermbg=230  gui=None                        guibg=#ffa
hi DiffText                                         ctermbg=228  gui=None                        guibg=#ffa
hi TabLineSel                                                    gui=None
hi Statement                                        ctermfg=027  gui=None
hi Type                                             ctermfg=034  gui=None
hi Todo                                ctermfg=0    ctermbg=226           guifg=#000             guibg=#ff0
hi Search                              ctermfg=0    ctermbg=226           guifg=#000             guibg=#ff0
hi Pmenu                                            ctermbg=254                                  guibg=LightMagenta
hi PmenuSel                            ctermfg=226  ctermbg=239           guibg=Grey
hi StatusLine               cterm=None ctermfg=236  ctermbg=252  gui=None guibg=#222 guifg=#aaa
hi StatusLineNC             cterm=None ctermfg=246  ctermbg=254  gui=None guibg=#222 guifg=#ccc
hi StatusLineBufTabsCurrent cterm=None ctermfg=20   ctermbg=252  gui=None guifg=#ff0
hi VertSplit                cterm=None
hi MatchParen                                       ctermbg=253
hi CursorLine               cterm=None              ctermbg=231
hi Folded                              ctermfg=None ctermbg=253
hi LineNr                              ctermfg=169  ctermbg=255
hi SignColumn                          ctermfg=1    ctermbg=255
hi Conceal                             ctermfg=255  ctermbg=None          guifg=#A4E57E
" vim: sw=2
