let g:R_user_maps_only = 1

function! CustomizeNvimR()
    " let g:maplocalleader = ","
    " Press the space bar to send lines and selection to R:
    " vnoremap <Space><Space> <Plug>RDSendSelection
    " nnoremap <Space><Space> <Plug>RDSendLine

    command! StartR call StartR("R")
    nnoremap <Space>ls  :<C-U>call StartR("R")<CR>
    nnoremap <Space>lh  :<C-U>call RAction("help")<CR>
    nnoremap <Space>ll  :<C-U>call SendLineToR("stay")')<CR>
    nnoremap <Space>lj  :<C-U>call SendLineToR("down")')<CR>
endfunction

autocmd FileType r call CustomizeNvimR()
" command RStart let oldft=&ft | set ft=r | exe 'set ft='.oldft | let b:IsInRCode = function("DefaultIsInRCode") | normal <LocalLeader>rf
