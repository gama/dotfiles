if !has('gui_running') && $TERM =~# '^\%(screen\|tmux\)' && empty(&t_ts)
    " enable window title
    let &t_ts = "\e]2;"
    let &t_fs = "\007"
endif

" window movement and management
nnoremap <silent> <A-l>   :TmuxNavigateRight<CR>
nnoremap <silent> <A-h>   :TmuxNavigateLeft<CR>
nnoremap <silent> <A-k>   :TmuxNavigateUp<CR>
nnoremap <silent> <A-j>   :TmuxNavigateDown<CR>
inoremap <silent> <A-l>   <C-\><C-n>:TmuxNavigateRight<CR>
inoremap <silent> <A-h>   <C-\><C-n>:TmuxNavigateLeft<CR>
inoremap <silent> <A-k>   <C-\><C-n>:TmuxNavigateUp<CR>
inoremap <silent> <A-j>   <C-\><C-n>:TmuxNavigateDown<CR>
tnoremap <silent> <A-l>   <C-\><C-n>:TmuxNavigateRight<CR>
tnoremap <silent> <A-h>   <C-\><C-n>:TmuxNavigateLeft<CR>
tnoremap <silent> <A-k>   <C-\><C-n>:TmuxNavigateUp<CR>
tnoremap <silent> <A-j>   <C-\><C-n>:TmuxNavigateDown<CR>
tnoremap <silent> <M-l>   <C-\><C-n>:TmuxNavigateRight<CR>
tnoremap <silent> <M-h>   <C-\><C-n>:TmuxNavigateLeft<CR>
tnoremap <silent> <M-k>   <C-\><C-n>:TmuxNavigateUp<CR>
tnoremap <silent> <M-j>   <C-\><C-n>:TmuxNavigateDown<CR>
