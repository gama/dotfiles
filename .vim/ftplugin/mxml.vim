compiler ant
setlocal errorformat=\ %#[%.%#]\ %f(%l):\ %#\ %m,\ %#[%.%#]\ %f(%l):\ col:\ %c\ %#%m
setlocal makeprg=ant\ -s\ build.xml
setlocal expandtab
nmap <buffer> <Leader>m :make<CR>

let g:tlist_mxml_settings = 'actionscript;c:class;f:method' ";p:property;v:variable'
if !exists('loaded_taglist')
	let Tlist_Display_Prototype = 0
	let Tlist_Enable_Fold_Column = 0
	call LoadPluginFunc('taglist')
endif
