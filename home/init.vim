" scriptencoding and mapleader must be set before all other settings
" set encoding for vim rc files
scriptencoding utf-8

" map the leader key to space
let mapleader = "\<space>"
let maplocalleader = "\<space>"

lua require('plugins')


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
" vsplit for help and Man
cabbrev h vertical botright help
cabbrev M vertical botright Man

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

" use ripgrep as grepprg if installed
if executable("rg")
  set grepprg=rg\ --vimgrep
endif


" filetypes
"""""""""""
" set filetype to c for header (*.h) files, cannot be set in the c ftplugin
let c_syntax_for_h = 1


" plugin configuration
""""""""""""""""""""""
" GnuPG
source $NVIMHOME/config/gnupg.vim

" custom keybindings
source $NVIMHOME/config/keybindings.vim

" lightline
source $NVIMHOME/config/lightline.vim

" NERDCommenter
source $NVIMHOME/config/nerdcommenter.vim

" nvim-autopairs
lua require('nvim-autopairs').setup{}

" nvim-cmp
lua require('nvim-cmp')

" nvim-dap
lua require('nvim-dap-config')

" formatter
lua require('formatter-config')

" lsp
lua require('lsp')

" LuaSnip
lua require('luasnip-config')

" telescope
lua require('telescope-config')

" treesitter
lua require('treesitter')
