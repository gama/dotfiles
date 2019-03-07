function! TmuxWindowStrategy(cmd)
    call jobstart('tmux send-keys -t! Escape "A'.a:cmd.' -s -v" Enter')
    call jobstart('tmux select-window -t!')
endfunction

function! TmuxPaneStrategy(cmd)
    call jobstart('tmux send-keys -t.! Escape "A'.a:cmd.' -s -v" Enter')
endfunction

let g:test#custom_strategies = {
    \ 'tmux_window': function('TmuxWindowStrategy'),
    \ 'tmux_pane':   function('TmuxPaneStrategy')
    \ }
let g:test#strategy          = 'tmux_pane'
let g:test#python#runner     = 'pytest'

nnoremap mt :<C-u>TestNearest<CR>
nnoremap mf :<C-u>TestFile<CR>
