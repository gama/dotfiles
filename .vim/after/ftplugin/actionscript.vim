if (exists('loaded_fuzzyfinder'))
	nnoremap <silent> <Leader>f :FuzzyFinderFile! <C-r>=fnamemodify(FindInParentDirs("build.xml"), ':h')<CR>/<CR>
endif

