if exists("b:current_syntax")
	finish
endif

let b:current_syntax = 'railslog'
"if !exists("main_syntax")
	"let main_syntax = 'railslog'
"endif

syn match   railslogRender      '^\s*\<\%(Processing\|Rendering\|Rendered\|Redirected\|Completed\)\>'
syn match   railslogComment     '^\s*# .*'
syn match   railslogModel       '^\s*\u\%(\w\|:\)* \%(Load\%( Including Associations\| IDs For Limited Eager Loading\)\=\|Columns\|Count\|Update\|Destroy\|Delete all\)\>' skipwhite nextgroup=railslogModelNum
syn match   railslogModel       '^\s*SQL\>' skipwhite nextgroup=railslogModelNum
syn region  railslogModelNum    start='(' end=')' contains=railslogNumber contained skipwhite nextgroup=railslogSQL
syn match   railslogSQL         '\u.*$' contained
" Destroy generates multiline SQL, ugh
syn match   railslogSQL         '^ \%(FROM\|WHERE\|ON\|AND\|OR\|ORDER\) .*$'
syn match   railslogNumber      '\<\d\+\>%'
syn match   railslogNumber      '[ (]\@<=\<\d\+\.\d\+\>'
syn region  railslogString      start='"' skip='\\"' end='"' oneline contained
syn region  railslogHash        start='{' end='}' oneline contains=railslogHash,railslogString
syn match   railslogIP          '\<\d\{1,3\}\%(\.\d\{1,3}\)\{3\}\>'
syn match   railslogTimestamp   '\<\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d\>'
syn match   railslogSessionID   '\<\x\{32\}\>'
syn match   railslogIdentifier  '^\s*\%(Session ID\|Parameters\)\ze:'
syn match   railslogSuccess     '\<2\d\d \u[A-Za-z0-9 ]*\>'
syn match   railslogRedirect    '\<3\d\d \u[A-Za-z0-9 ]*\>'
syn match   railslogError       '\<[45]\d\d \u[A-Za-z0-9 ]*\>'
syn match   railslogError       '^DEPRECATION WARNING\>'
syn keyword railslogHTTP        OPTIONS GET HEAD POST PUT DELETE TRACE CONNECT
syn region  railslogStackTrace  start=":\d\+:in `\w\+'$" end="^\s*$" keepend fold

hi def link railslogComment     Comment
hi def link railslogRender      Keyword
hi def link railslogModel       Type
hi def link railslogSQL         PreProc
hi def link railslogNumber      Number
hi def link railslogString      String
hi def link railslogSessionID   Constant
hi def link railslogIdentifier  Identifier
hi def link railslogRedirect    railslogSuccess
hi def link railslogSuccess     Special
hi def link railslogError       Error
hi def link railslogHTTP        Special
