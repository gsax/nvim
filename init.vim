" scriptencoding and mapleader must be set before all other settings
" set encoding for vim rc files
scriptencoding utf-8

" map the leader key to space
let mapleader = " "
let maplocalleader = "\\"

" first load all plugins, but load setup and config the plugins at last
lua require('plugins')


" language providers
""""""""""""""""""""
" disable nodejs provider
let g:loaded_node_provider = 0

" disable perl provider
let g:loaded_perl_provider = 0

" disable python provider
let g:loaded_python3_provider = 0

" disable ruby provider
let g:loaded_ruby_provider = 0


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

" allow embedded syntax highlight for lua
let g:vimsyn_embed = 'l'


" plugin configuration
""""""""""""""""""""""
" custom keybindings
source $NVIMHOME/config/keybindings.vim

" custom tools for =
source $NVIMHOME/config/format.vim

" GnuPG
source $NVIMHOME/config/gnupg.vim

" lightline
source $NVIMHOME/config/lightline.vim

" NERDCommenter
source $NVIMHOME/config/nerdcommenter.vim

" nvim-autopairs
lua require('nvim-autopairs').setup{}

" nvim-cmp
lua require('cmprc')

" nvim-dap
lua require('daprc')

" lsp
lua require('lsprc')

" LuaSnip
lua require('luasniprc')

" telescope
lua require('telescoperc')

" treesitter
lua require('treesitterrc')
