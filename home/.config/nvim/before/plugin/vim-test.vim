function! TmuxWindowStrategy(cmd)
    " call jobstart('tmux send-keys -t :! Escape "A'.a:cmd.' -s -v" Enter') <= python
    call jobstart('tmux send-keys -t :! "'.a:cmd.'" Enter') 
    call jobstart('tmux select-window -t!')
endfunction

function! TmuxPaneStrategy(cmd)
    " call jobstart('tmux send-keys -t.! Escape "A'.a:cmd.' -s -v" Enter') <= python
    call jobstart('tmux send-keys -t ! Escape "A'.a:cmd.'" Enter')
endfunction

let g:test#custom_strategies = {
    \ 'tmux_window': function('TmuxWindowStrategy'),
    \ 'tmux_pane':   function('TmuxPaneStrategy')
    \ }

let test#strategy      = 'tmux_pane'
let g:vimtest_strategy = 'tmux_pane'
let test#python#runner = 'pytest'
let g:test#python#pytest#options = '-sv'

nnoremap mt :<C-u>execute "TestNearest -strategy=".g:vimtest_strategy<CR>
nnoremap mf :<C-u>execute "TestFile -strategy=".g:vimtest_strategy<CR>
