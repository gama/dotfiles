set tw=99999
set expandtab
set comments=sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-
set formatoptions=crqo
set autoindent
set smartindent
set nowrap
set include=^\s*import
set includeexpr=substitute(v:fname,'\\.','/','g')
set errorformat=%A\ %#[javac]\ %f:%l:\ %m,%C\ %#[javac]\ symbol\ %#:\ %#%m,%+Z\ %#[javac]\ %p

compiler ant
set makeprg=ant\ -s\ build.xml
" call LoadRCSPlugin()
