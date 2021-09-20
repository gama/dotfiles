autocmd User Startified setlocal cursorline

let g:startify_change_to_dir       = 0
let g:startify_change_to_vcs_root  = 1
let g:startify_files_number        = 8
let g:startify_fortune_use_unicode = 1
let g:startify_update_oldfiles     = 1
let g:startify_custom_header       = 'startify#fortune#boxed()'
let g:startify_bookmarks           = [
	\ { 'i': '~/.config/nvim/init.vim' },
	\ { 'm': '~/tmp/misc.md' },
	\ { 'n': '~/notes.md' },
	\ ]
