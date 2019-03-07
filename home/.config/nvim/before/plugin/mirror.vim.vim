let g:mirror#config_path = expand("~/.config/mirrors.yaml")
autocmd BufWritePost * call WriteToMirror()

function! WriteToMirror()
    if  exists('b:project_with_mirror') &&
    \   exists('g:mirror#local_default_environments') &&
    \   has_key(g:mirror#local_default_environments, b:project_with_mirror)
        silent MirrorPush
    endif
endfunction
