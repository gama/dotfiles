if !has('gui_running') && $TERM =~# '^\%(screen\|tmux\)' && empty(&t_ts)
    " enable window title
    let &t_ts = "\e]2;"
    let &t_fs = "\007"
endif

" window movement and management
nnoremap <silent> <M-l>   :TmuxNavigateRight<CR>
nnoremap <silent> <M-h>   :TmuxNavigateLeft<CR>
nnoremap <silent> <M-k>   :TmuxNavigateUp<CR>
nnoremap <silent> <M-j>   :TmuxNavigateDown<CR>
tnoremap <silent> <M-l>   <C-\><C-n>:TmuxNavigateRight<CR>
tnoremap <silent> <M-h>   <C-\><C-n>:TmuxNavigateLeft<CR>
tnoremap <silent> <M-k>   <C-\><C-n>:TmuxNavigateUp<CR>
tnoremap <silent> <M-j>   <C-\><C-n>:TmuxNavigateDown<CR>
