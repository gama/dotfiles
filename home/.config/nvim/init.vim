"""""""""" vim-plug """"""""""
call plug#begin('~/.cache/nvim/plugged')

" look & feel
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'

" navigation, buffer and file management
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdTree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-surround'
" Plug 'terryma/vim-multiple-cursors'
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-unimpaired'

" development
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim',  { 'do': ':UpdateRemotePlugins' }
Plug 'janko-m/vim-test'
" Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'zenbro/mirror.vim'
Plug 'whiteinge/diffconflicts'

" syntax & filetypes
Plug 'petRUShka/vim-opencl',          { 'for': 'opencl' }
Plug 'pangloss/vim-javascript',       { 'for': ['javascript'] }
Plug 'maxmellon/vim-jsx-pretty',      { 'for': 'jsx' }
Plug 'heavenshell/vim-jsdoc',         { 'for': ['javascript', 'typescript'] }
Plug 'leafgarland/typescript-vim',    { 'for': 'typescript' }
Plug 'mhartington/nvim-typescript',   { 'for': 'typescript', 'do': './install.sh' }
Plug 'elzr/vim-json',                 { 'for': 'json' }
Plug 'vim-python/python-syntax',      { 'for': 'python' }
Plug 'lambdalisue/vim-cython-syntax', { 'for': 'cython' }
Plug 'fatih/vim-go',                  { 'for': 'go', 'do': ':GoInstallBinaries' }
call plug#end()


"""""""""" per-plugin and global options + mappings """"""""""
function! SourceFile(filename)
    if filereadable(a:filename)
        execute 'source ' . a:filename
    endif
    if has('nvim')
        let s:nvim_filename = substitute(a:filename, '\.vim$', '.nvim', 0)
        if filereadable(s:nvim_filename)
            execute 'source ' . s:nvim_filename
        endif
    endif
endfunction

for plugin in keys(g:plugs)
    call SourceFile($HOME . '/.config/nvim/before/plugin/' . plugin . '.vim')
endfor
call SourceFile($HOME . '/.config/nvim/before/options.vim')
call SourceFile($HOME . '/.config/nvim/before/map.vim')


"""""""""" Others """"""""""
filetype plugin indent on
syntax on
colorscheme gruvboxcustom

autocmd BufReadPost *        if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
autocmd BufReadPost quickfix nnoremap <buffer> o <CR><C-W><C-W>

" netrw
let g:netrw_silent=1

" pseudo-detect terminal color
execute "set background=" . readfile(expand("~/.cache/termbg"))[0]
