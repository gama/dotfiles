set cindent
set comments=sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-
set formatoptions=crqto2
set expandtab
set iskeyword=@,48-57,_,192-255
set nowrap
set tw=0

let g:is_cpp_file=1

if has("gui")
	command! -nargs=1 Drop drop <args>
else
	command! -nargs=1 Drop edit <args>
endif

if ((expand("%:e") == "cc") || (expand("%:e") == "cpp"))
	map <buffer> <Leader>aa :Drop %:r.h<CR>
elseif ((expand("%:e") == "h") || (expand("%:e") == "hpp"))
    let ftype=getftype(expand("%:r").".cpp")
    if (ftype == "file")
        map <buffer> <Leader>aa :Drop %:r.cpp<CR>
    endif
    let ftype=getftype(expand("%:r").".cc")
    if (ftype == "file")
        map <buffer> <Leader>aa :Drop %:r.cc<CR>
    endif
    let ftype=getftype(expand("%:r").".cxx")
    if (ftype == "file")
        map <buffer> <Leader>aa :Drop %:r.cxx<CR>
    endif
endif

call LoadRCSPlugin()
