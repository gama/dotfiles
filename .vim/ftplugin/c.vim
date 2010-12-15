set cindent
set cinoptions=(0
set comments=sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-
set expandtab
set formatoptions=crqto2
set iskeyword=@,48-57,_,192-255
set nowrap
set tw=0
call LoadRCSPlugin()
if !exists('loaded_taglist')
	call LoadPluginFunc('taglist')
endif

if (expand("%:e") == "c")
	map <buffer> <Leader>aa :drop %:r.h<CR>
elseif (expand("%:e") == "h")
    let s:ftype=getftype(expand("%:r").".c")
    if (s:ftype == "file")
        map <buffer> <Leader>aa :drop %:r.c<CR>
    endif
endif

if (match(expand("%:p:h"), "\/tmp\/gnome-cvs/epiphany") >= 0)
	set sw=8
	set ts=8
	set nosmarttab
	set noexpandtab
endif
