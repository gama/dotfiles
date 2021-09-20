let g:ale_lint_delay           = 200
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_completion_enabled   = 0  " handled by deoplete
let g:ale_linters = {
    \ 'python': ['flake8', 'pylint'],
    \ }
let g:ale_linters_ignore= {
    \ 'python': ['pylint'],
    \ }

nmap <Space>lf <Plug>(ale_find_references)
vmap <Space>lf <Plug>(ale_find_references)
nmap <Space>ll <Plug>(ale_hover)
vmap <Space>ll <Plug>(ale_hover)
nmap <Space>ld <Plug>(ale_go_to_definition_in_split)
vmap <Space>ld <Plug>(ale_go_to_definition_in_split)
nmap <Space>lo <Plug>(ale_go_to_definition)
vmap <Space>lo <Plug>(ale_go_to_definition)
