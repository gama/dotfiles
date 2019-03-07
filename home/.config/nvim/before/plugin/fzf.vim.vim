let g:fzf_action = {
  \ 'alt-t': 'tab split',
  \ 'alt-p': 'vsplit',
  \ 'alt-o': 'split' }

autocmd FileType fzf tmapclear <buffer> | tmapclear
