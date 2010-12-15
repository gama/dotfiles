"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" buftabs (C) 2006 Ico Doornekamp
"
" This program is free software; you can redistribute it and/or modify it
" under the terms of the GNU General Public License as published by the Free
" Software Foundation; either version 2 of the License, or (at your option)
" any later version.
"
" This program is distributed in the hope that it will be useful, but WITHOUT
" ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
" FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
" more details.
"
" Introduction
" ------------
"
" This is a simple script that shows a tabs-like list of buffers in the bottom
" of the window. The biggest advantage of this script over various others is
" that it does not take any lines away from your terminal, leaving more space
" for the document you're editing. The tabs are only visible when you need
" them - when you are switchin between buffers.
"
" Usage
" -----
" 
" This script draws buffer tabs on vim startup, when a new buffer is created
" and when switching between buffers.
"
" It might be handy to create a few maps for easy switching of buffers in your
" .vimrc file. For example, using F1 and F2 keys:
"
"   noremap <f1> :bprev<CR> 
"   noremap <f2> :bnext<CR>
"
" or using control-left and control-right keys:
"
"   :noremap <C-left> :bprev<CR>
"   :noremap <C-right> :bnext<CR>
"
"
" The following extra configuration variables are availabe:
" 
" * g:buftabs_only_basename
"
"   Define this variable to make buftabs only print the filename of each buffer,
"   omitting the preceding directory name. Add to your .vimrc:
"
"   :let g:buftabs_only_basename=1
"
"
" * g:buftabs_in_statusline
"
"   Define this variable to make the plugin show the buftabs in the statusline
"   instead of the command line. It is a good idea to configure vim to show
"   the statusline as well when only one window is open. Add to your .vimrc:
"
"   set laststatus=2
"   :let g:buftabs_in_statusline=1
"    
"
" * g:buftabs_active_highlight_group
"
"   The name of a highlight group (:help highligh-groups) which is used to
"   show the name of the current active buffer. If this variable is not
"   defined, no highlighting is used. (Highlighting is only functional when 
"   g:buftabs_in_statusline is enabled)
"
"   :let g:buftabs_active_highlight_group="Visual"
"
"
" Bugs
" ----
"
" Vim's 'set hidden' option is known to break this plugin - for some reason
" vim will overwrite the buftabs when this option is enabled. 
"
"
" Changelog
" ---------
" 
" 0.1  2006-09-22  Initial version 
"
" 0.2  2006-09-22  Better handling when the list of buffers is longer then the
"                  window width.
"
" 0.3  2006-09-27  Some cleanups, set 'hidden' mode by default
"
" 0.4  2007-02-26  Don't draw buftabs until VimEnter event to avoid clutter at
"                  startup in some circumstances
"
" 0.5  2007-02-26  Added option for showing only filenames without directories
"                  in tabs
"
" 0.6  2007-03-04  'only_basename' changed to a global variable.  Removed
"                  functions and add event handlers instead.  'hidden' mode 
"                  broke some things, so is disabled now. Fixed documentation
"
" 0.7  2007-03-07  Added configuration option to show tabs in statusline
"                  instead of cmdline
"
" 0.8  2007-04-02  Update buftabs when leaving insertmode
"
" 0.9  2007-08-22  Now compatible with older Vim versions < 7.0
"
" 0.10 2008-01-26  Added GPL license
"
" 0.11 2008-02-29  Added optional syntax highlighting to active buffer name
"
" 0.12 2009-03-18  Fixed support for split windows
"
" 0.13 2009-05-07  Store and reuse right-aligned part of original statusline
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Called on VimEnter event
"

let s:buftabs_enabled = 0
let s:original_statusline = matchstr(&statusline, "%=.*")

function! Buftabs_enable()
	let s:buftabs_enabled = 1
endfunction

"
" Draw the buftabs
"

function! Buftabs_setwin(winidx, buflist)
	if s:buftabs_enabled != 1 
		return
	endif

	let l:list = ''
	let l:start = 0
	let l:end = 0

	" Walk the list of buffers
	for l:bnr in a:buflist
		" Get the name of the current buffer, and escape characters that might
		" mess up the statusline
		if exists("g:buftabs_only_basename")
			let l:name = fnamemodify(bufname(bnr), ":t")
		else
			let l:name = bufname(bnr)
		endif
		let l:name = substitute(l:name, "%", "%%", "g")
		if empty(l:name)
			let l:name = 'No Name'
		endif
		
		" Append the current buffer number and name to the list. If the buffer
		" is the active buffer, enclose it in some magick characters which will
		" be replaced by markers later. If it is modified, it is appended with
		" an exclaimation mark

		if winbufnr(a:winidx) == bnr
			let l:start = strlen(l:list)
			let l:list = l:list . "\x01"
		else
			let l:list = l:list . ' '
		endif
			
		let l:list = l:list . bnr . "-" 
		let l:list = l:list . l:name

		if getbufvar(bnr, "&modified") == 1
			let l:list = l:list . "!"
		endif
		
		if winbufnr(a:winidx) == bnr
			let l:list = l:list . "\x02"
			let l:end = strlen(l:list)
		else
			let l:list = l:list . ' '
		endif
	endfor

	" If the resulting list is too long to fit on the screen, chop
	" out the appropriate part

	"echomsg "winwidth(" . a:winidx . "): " . winwidth(a:winidx)
	let l:bnr = winbufnr(a:winidx)
	let l:width = winwidth(a:winidx)
	"echomsg "removing 15 by default"
	let l:width = l:width - 15
	if getbufvar(l:bnr, "&modified") == 1
		"echomsg "removing 3 due to &modified"
		let l:width = l:width - 3
	endif
	if getbufvar(l:bnr, "&readonly") == 1
		"echomsg "removing 4 due to &readonly"
		let l:width = l:width - 4
	endif
	if getbufvar(l:bnr, "&previewwindow") == 1
		"echomsg "removing 9 due to &previewwindow"
		let l:width = l:width - 9
	endif
	if getbufvar(l:bnr, "&filetype") != ""
		let l:width = l:width - len(getbufvar(bnr, "&filetype"))
		"echomsg "removing " . (len(getbufvar(bnr, "&filetype")) + 2) . " due to &filetype"
		let l:width = l:width - 2
	endif
	"echomsg "l:width: " . l:width

	let l:listlen = strlen(l:list)
	if (l:listlen > l:width)
		let l:from = ((l:start + l:end) / 2) - (l:width / 2)
		let l:from = max([0, l:from])
		let l:from = min([l:from, l:listlen - l:width])
		let l:list = strpart(l:list, l:from, l:width)
	endif

	" Replace the magic characters by visible markers for highlighting the
	" current buffer. The markers can be simple characters like square brackets,
	" but can also be special codes with highlight groups

	let l:buftabs_marker_start = "["
	let l:buftabs_marker_end = "]"
	let l:highlight_group = ""
	if exists("g:buftabs_active_highlight_group") && winnr() == a:winidx
		let l:highlight_group = g:buftabs_active_highlight_group
	elseif exists("g:buftabs_active_highlight_group_nc") && winnr() != a:winidx
		let l:highlight_group = g:buftabs_active_highlight_group_nc
	endif
	if exists("g:buftabs_in_statusline") && len(highlight_group) > 0
		let l:buftabs_marker_start = "%#" . l:highlight_group . "#" . l:buftabs_marker_start
		let l:buftabs_marker_end = l:buftabs_marker_end . "%##"
	end

	let l:list = substitute(l:list, "\x01", l:buftabs_marker_start, 'g')
	let l:list = substitute(l:list, "\x02", l:buftabs_marker_end, 'g')

	" Show the list. The buftabs_in_statusline variable determines of the list
	" is displayed in the command line (volatile) or in the statusline
	" (persistent)

	if exists("g:buftabs_in_statusline")
		call setwinvar(a:winidx, "&statusline", l:list . s:original_statusline)
		"let &l:statusline = l:list . s:original_statusline
	else
		redraw
		echon l:list
	end

endfunction

function! Buftabs_build_buflist()
	redir => bufoutput
  buffers!
  redir END

	let buflist = []
  for buf in split(bufoutput, '\n')
		let matches = matchlist(buf, '\s*\(\d\+\)\(.\)\(.\)\(.\)\(.\)\(.\) "\(.*\)"\s*line\s\(\d\+\)')
		if (matches[2] != 'u') && (matches[5] != '-')
      call add(buflist, str2nr(matches[1]))
		endif
	endfor
	return buflist
endfunction

function! Buftabs_show()
	silent let buflist = Buftabs_build_buflist()
	if exists("g:buftabs_in_statusline")
		let w = 1
		let wnr = winnr('$')
		while (w <= wnr)
			if buflisted(winbufnr(w))
				call Buftabs_setwin(w, buflist)
			endif
			let w = w + 1
		endwhile
	elseif 
		call Buftabs_setwin(1)
	endif
endfunction

function! Buftabs_markToDelete()
  let b = bufnr(expand("<afile>"))
	call setbufvar(b, "todelete", 1)
endfunction

" Hook to events to show buftabs at startup, when creating and when switching
" buffers
autocmd VimEnter * call Buftabs_enable()
autocmd BufDelete * call Buftabs_markToDelete()
"autocmd VimEnter,BufNew,BufEnter,BufWinEnter,BufWritePost,BufWipeout * call Buftabs_show()
autocmd VimEnter,BufAdd,BufEnter,WinEnter,BufWritePost,BufWipeout * call Buftabs_show()

if version >= 700
	autocmd InsertLeave,VimResized * call Buftabs_show()
end

" vi: ts=2 sw=2
