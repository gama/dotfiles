setlocal regexpengine=1

nnoremap <buffer> <Space>ib Ofrom IPython.terminal.debugger import set_trace; set_trace()  # noqa; TODO: remove breakpoint<Esc>
nnoremap <buffer> <Space>iB ofrom IPython.terminal.debugger import set_trace; set_trace()  # noqa; TODO: remove breakpoint<Esc>
