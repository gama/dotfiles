compiler ant
setlocal errorformat=\ %#[%.%#]\ %f(%l):\ %#%m,\ %#[%.%#]\ %f(%l):\ col:\ %c\ %#%m
setlocal makeprg=ant\ -s\ build.xml
setlocal expandtab
nmap <buffer> <Leader>m :make<CR>

let g:tlist_actionscript_settings = 'actionscript;c:class;f:method' ";p:property;v:variable'
if !exists('loaded_taglist')
	let Tlist_Display_Prototype = 0
	let Tlist_Enable_Fold_Column = 0
	call LoadPluginFunc('taglist')
endif

map [[ :call OpenBracket_OpenBracket()<CR>
map ]] :call CloseBracket_CloseBracket()<CR>

function! OpenBracket_OpenBracket()
	let __hls=&hlsearch
	normal k
	?^\s*{$
	normal j^
	let @/=""
	let &hlsearch=__hls
endfunction

function! CloseBracket_CloseBracket()
	let __hls=&hlsearch
	"silent execute "normal /^\s*{\s*$"
	/^\s*{$
	normal j^
	let @/=""
	let &hlsearch=__hls
endfunction
