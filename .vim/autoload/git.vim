function! VimDiff(...)
  let originalBuffer = GitCommandGetOriginalBuffer(bufnr('%'))
  let s:isEditFileRunning = s:isEditFileRunning + 1
  try
    " If there's already a VimDiff'ed window, restore it.
    " There may only be one VCSVimDiff original window at a time.

    if exists('s:vimDiffSourceBuffer') && s:vimDiffSourceBuffer != originalBuffer
      " Clear the existing vimdiff setup by removing the result buffers.
      call s:WipeoutCommandBuffers(s:vimDiffSourceBuffer, 'vimdiff')
    endif

    " Split and diff
    if(a:0 == 2)
      " Reset the vimdiff system, as 2 explicit versions were provided.
      if exists('s:vimDiffSourceBuffer')
        call s:WipeoutCommandBuffers(s:vimDiffSourceBuffer, 'vimdiff')
      endif
      let resultBuffer = s:plugins[vcsType].Review([a:1])
      if resultBuffer < 0
        echomsg 'Can''t open revision ' . a:1
        return resultBuffer
      endif
      let b:VCSCommandCommand = 'vimdiff'
      diffthis
      let s:vimDiffScratchList = [resultBuffer]
      " If no split method is defined, cheat, and set it to vertical.
      try
        call s:OverrideOption('VCSCommandSplit', VCSCommandGetOption('VCSCommandDiffSplit', VCSCommandGetOption('VCSCommandSplit', 'vertical')))
        let resultBuffer=s:plugins[vcsType].Review([a:2])
      finally
        call s:OverrideOption('VCSCommandSplit')
      endtry
      if resultBuffer < 0
        echomsg 'Can''t open revision ' . a:1
        return resultBuffer
      endif
      let b:VCSCommandCommand = 'vimdiff'
      diffthis
      let s:vimDiffScratchList += [resultBuffer]
    else
      " Add new buffer
      call s:OverrideOption('VCSCommandEdit', 'split')
      try
        " Force splitting behavior, otherwise why use vimdiff?
        call s:OverrideOption('VCSCommandSplit', VCSCommandGetOption('VCSCommandDiffSplit', VCSCommandGetOption('VCSCommandSplit', 'vertical')))
        try
          if(a:0 == 0)
            let resultBuffer=s:plugins[vcsType].Review([])
          else
            let resultBuffer=s:plugins[vcsType].Review([a:1])
          endif
        finally
          call s:OverrideOption('VCSCommandSplit')
        endtry
      finally
        call s:OverrideOption('VCSCommandEdit')
      endtry
      if resultBuffer < 0
        echomsg 'Can''t open current revision'
        return resultBuffer
      endif
      let b:VCSCommandCommand = 'vimdiff'
      diffthis

      if !exists('s:vimDiffSourceBuffer')
        " New instance of vimdiff.
        let s:vimDiffScratchList = [resultBuffer]

        " This could have been invoked on a VCS result buffer, not the
        " original buffer.
        wincmd W
        execute 'buffer' originalBuffer
        " Store info for later original buffer restore
        let s:vimDiffRestoreCmd = 
              \    'call setbufvar('.originalBuffer.', ''&diff'', '.getbufvar(originalBuffer, '&diff').')'
              \ . '|call setbufvar('.originalBuffer.', ''&foldcolumn'', '.getbufvar(originalBuffer, '&foldcolumn').')'
              \ . '|call setbufvar('.originalBuffer.', ''&foldenable'', '.getbufvar(originalBuffer, '&foldenable').')'
              \ . '|call setbufvar('.originalBuffer.', ''&foldmethod'', '''.getbufvar(originalBuffer, '&foldmethod').''')'
              \ . '|call setbufvar('.originalBuffer.', ''&scrollbind'', '.getbufvar(originalBuffer, '&scrollbind').')'
              \ . '|call setbufvar('.originalBuffer.', ''&wrap'', '.getbufvar(originalBuffer, '&wrap').')'
              \ . '|if &foldmethod==''manual''|execute ''normal zE''|endif'
        diffthis
        wincmd w
      else
        " Adding a window to an existing vimdiff
        let s:vimDiffScratchList += [resultBuffer]
      endif
    endif

    let s:vimDiffSourceBuffer = originalBuffer

    " Avoid executing the modeline in the current buffer after the autocommand.

    let currentBuffer = bufnr('%')
    let saveModeline = getbufvar(currentBuffer, '&modeline')
    try
      call setbufvar(currentBuffer, '&modeline', 0)
      silent do VCSCommand User VCSVimDiffFinish
    finally
      call setbufvar(currentBuffer, '&modeline', saveModeline)
    endtry
    return resultBuffer
  finally
    let s:isEditFileRunning = s:isEditFileRunning - 1
  endtry
endfunction

function! GitCommandGetOriginalBuffer(vcsBuffer)
  let origBuffer = getbufvar(a:vcsBuffer, 'VCSCommandOriginalBuffer')
  if origBuffer
    if bufexists(origBuffer)
      return origBuffer
    else
      " Original buffer no longer exists.
      throw 'Original buffer for this VCS buffer no longer exists.'
    endif
  else
    " No original buffer
    return a:vcsBuffer
  endif
endfunction

function! s:WipeoutCommandBuffers(originalBuffer, VCSCommand)
  let buffer = 1
  while buffer <= bufnr('$')
    if getbufvar(buffer, 'VCSCommandOriginalBuffer') == a:originalBuffer
      if getbufvar(buffer, 'VCSCommandCommand') == a:VCSCommand
        execute 'bw' buffer
      endif
    endif
    let buffer = buffer + 1
  endwhile
endfunction
