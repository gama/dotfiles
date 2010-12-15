setlocal cinkeys=0{,0},0),:,!^F,o,O,e
setlocal expandtab
setlocal formatoptions=2crqo
setlocal nowrap
setlocal smartindent
setlocal keywordprg=perldoc\ -f
setlocal textwidth=80
setlocal iskeyword=@,48-57,_,192-255
hi clear Identifier
inoremap # X#
compiler perl
call LoadRCSPlugin()
