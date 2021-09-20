"""""""""" vim-plug """"""""""
call plug#begin('~/.cache/nvim/plugged')

" look & feel
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
" Plug 'kdav5758/TrueZen.nvim'
" Plug 'kyazdani42/nvim-web-devicons' " required by nvim-tree.lua

" navigation, buffer and file management
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
" Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'         " required by telescope.nvim
Plug 'nvim-telescope/telescope.nvim'

" development
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-compe'
" Plug 'nvim-lua/completion-nvim'
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'zenbro/mirror.vim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'cdelledonne/vim-cmake'
" Plug 'whiteinge/diffconflicts'

" syntax & filetypes
Plug 'pangloss/vim-javascript',         { 'for': ['javascript'] }
Plug 'heavenshell/vim-jsdoc',           { 'for': ['javascript', 'typescript'] }
Plug 'maxmellon/vim-jsx-pretty',        { 'for': 'jsx' }
Plug 'elzr/vim-json',                   { 'for': 'json' }
Plug 'vim-python/python-syntax',        { 'for': 'python' }
Plug 'PProvost/vim-ps1',                { 'for': 'powershell' }
" Plug 'vim-pandoc/vim-pandoc-syntax',  { 'for': ['markdown', 'markdown.pandoc'] }
Plug 'pboettch/vim-cmake-syntax',       { 'for': 'cmake' }
Plug 'tpope/vim-markdown',              { 'for': 'markdown' }
" Plug 'gabrielelana/vim-markdown',       { 'for': 'markdown' }
" Plug 'euclio/vim-markdown-composer',    { 'for': 'markdown' }
" Plug 'pboettch/vim-cmake-syntax',       { 'for': 'cmake' }
" Plug 'rust-lang/rust.vim',              { 'for': 'rust' }
" Plug 'leafgarland/typescript-vim',      { 'for': 'typescript' }
" Plug 'mhartington/nvim-typescript',     { 'for': 'typescript', 'do': './install.sh' }
" Plug 'fatih/vim-go',                    { 'for': 'go', 'do': ':GoInstallBinaries' }
call plug#end()


"""""""""" plugin config + global options + mappings """"""""""
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
    call SourceFile(stdpath('config') . '/before/plugin/' . plugin . '.vim')
endfor
call SourceFile(stdpath('config') . '/before/options.vim')
call SourceFile(stdpath('config') . '/before/map.vim')
call SourceFile(stdpath('config') . '/before/other.vim')

let g:neovide_cursor_animation_length=0
