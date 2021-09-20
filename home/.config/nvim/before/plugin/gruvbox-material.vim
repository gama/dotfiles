let g:gruvbox_material_palette = 'original'           " ['material', 'mix', 'original']
" let g:gruvbox_material_background = 'hard'          " ['soft', 'medium', 'hard']
let g:gruvbox_material_statusline_style = 'original'  " ['default', 'original']
let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_disable_italic_comment = 1

function! s:gruvbox_material_custom() abort
    if (&background == "light")
        highlight Conceal      guifg=#ebdbb2 ctermfg=223  guibg=NONE    ctermbg=NONE
        highlight WildMenu     guifg=#4585a8 ctermfg=66   guibg=#d5c4a1 ctermbg=250
        highlight Normal       guifg=NONE    ctermfg=NONE guibg=NONE    ctermbg=NONE
        highlight NormalNC     guifg=NONE    ctermfg=NONE guibg=#f0eae0 ctermbg=223
        highlight ColorColumn  guifg=NONE    ctermfg=NONE guibg=#f2eee2 ctermbg=237
        highlight VertSplit    guifg=#f0eae0 ctermfg=223  guibg=#f0eae0 ctermbg=223
        highlight CursorLine   guifg=NONE    ctermfg=NONE guibg=#fcf9ef ctermbg=223
        highlight StatusLineNC guifg=NONE   ctermfg=NONE guibg=#f0eae0 ctermbg=223
        highlight IndentBlanklineChar guifg=#e5e2d5
        highlight! link EndOfBuffer Normal
        highlight! link StatusLine Normal
    else
        highlight Conceal      guifg=#3c3836 ctermfg=237  guibg=NONE    ctermbg=NONE
        highlight Normal       guifg=NONE    ctermfg=NONE guibg=NONE    ctermbg=NONE
        highlight NormalNC     guifg=NONE    ctermfg=NONE guibg=#2c2c2c ctermbg=237
        highlight ColorColumn  guifg=NONE    ctermfg=NONE guibg=#2c2c2c ctermbg=237
        highlight VertSplit    guifg=#3c3836 ctermfg=237  guibg=#3c3836 ctermbg=237
        highlight CursorLine   guifg=NONE    ctermfg=NONE guibg=#1c1c1c ctermbg=237
        highlight StatusLineNC guifg=NONE    ctermfg=NONE guibg=#2c2c2c ctermbg=223
        highlight IndentBlanklineChar guifg=#383838
        highlight! link EndOfBuffer Normal
        highlight! link StatusLine Normal
    end

    let g:fzf_colors = {}
endfunction

augroup GruvboxMaterialCustom
    autocmd!
    autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
augroup END

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END
    
colorscheme gruvbox-material
