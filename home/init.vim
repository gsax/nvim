" scriptencoding and mapleader must be set before all other settings
" set encoding for vim rc files
scriptencoding utf-8

" map the leader key to space
let mapleader = "\<space>"


" vim-plug settings
"""""""""""""""""""
" vim plugins path
call plug#begin('$VIMBUNDLE')

" lsp and completion
""""""""""""""""""""
" nvim-lspconfig: Quickstart configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" completion-nvim: A async completion framework aims to provide completion
" to neovim's built in LSP written in Lua
Plug 'nvim-lua/completion-nvim'


" files and buffers
"""""""""""""""""""
" fzf.vim: fzf ❤️ vim
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" vim-bbye: don't close splits when closing a buffer
Plug 'moll/vim-bbye'


" filetypes and languages
"""""""""""""""""""""""""
" nvim-treesitter: Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter'

" vim-clang-format: Vim plugin for clang-format, a formatter for C, C++, Obj-C,
" Java, JavaScript, TypeScript and ProtoBuf. 
Plug 'rhysd/vim-clang-format', { 'for': ['c'] }

" vim-go: Go development plugin for Vim
Plug 'fatih/vim-go', { 'for': ['go'] }

" vim-toml: Vim syntax for TOML
Plug 'cespare/vim-toml', { 'for': ['toml'] }

" vim-gnupg: transparent editing of PGP files
Plug 'jamessan/vim-gnupg'


" editing
"""""""""
" NERDCommenter: orgasmic comments
Plug 'scrooloose/nerdcommenter'

" tabular: Vim script for text filtering and alignment
Plug 'godlygeek/tabular'


" appereance
""""""""""""
" lightline.vim: A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" vim-gitbranch: Provides the branch name of the current git repository
Plug 'itchyny/vim-gitbranch'

" dracula: scream A dark theme for Vim
Plug 'gsax/dracula-vim', { 'as': 'dracula' }

call plug#end()


" set the pythonversion explicitly
""""""""""""""""""""""""""""""""""
" set python provider
let g:python_host_prog = "/usr/bin/python2"

" set python3 provider
let g:python3_host_prog = "/usr/bin/python3"


" appereance
""""""""""""
" set color of syntax highlight
set background=dark

" always display status-line
set laststatus=2

" highlight the current line
set cursorline

" keep some lines distance to the top and bottom
set scrolloff=2

" activate TrueColor support
if (has("termguicolors"))
  set termguicolors
endif

" set colorscheme and activate background opacity
let g:dracula_colorterm = 0
colorscheme dracula


" split config
""""""""""""""
" vsplit for help
cabbrev h botright vert h
map <F1> :botright vert h<CR>

" vsplit for diffsplit
set diffopt=vertical

" place splits right and under the current pane
set splitbelow
set splitright


" misc
""""""
" use incremental search
set incsearch

" enable the autocompletion menu
set wildmenu

" allow modelines
set modeline

" deactivate annoying beeps
set noerrorbells visualbell t_vb=
set novisualbell

" make it possible to move outsitde the text in visual block mode
set virtualedit=block

" don't redraw the screen while executing macros
set lazyredraw

" shows the last command in bottom right
set showcmd

" don't lose undo history after switching buffers
set hidden

" don't show mode
set noshowmode


" filetypes
"""""""""""
" set filetype to c for header (*.h) files, cannot be set in the c ftplugin
let c_syntax_for_h = 1


" plugin configuration
""""""""""""""""""""""
" fzf
source $VIMCONFIG/fzf.vim

" GnuPG
source $VIMCONFIG/gnupg.vim

" Go
source $VIMCONFIG/go.vim

" custom keybindings
source $VIMCONFIG/keybindings.vim

" lightline
source $VIMCONFIG/lightline.vim

" lsp
lua require("lsp")
source $VIMCONFIG/lsp.vim

" NERDCommenter
source $VIMCONFIG/nerdcommenter.vim

" treesitter
lua require("treesitter")
