-- scriptencoding and mapleader must be set before all other settings
-- set encoding for vim rc files
--scriptencoding utf-8

-- map the leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- first load all plugins, but load setup and config the plugins at last
require('plugins')


-- language providers
--"""""""""""""""""""
-- disable nodejs provider
vim.g.loaded_node_provider = 0

-- disable perl provider
vim.g.loaded_perl_provider = 0

-- disable python provider
vim.g.loaded_python3_provider = 0

-- disable ruby provider
vim.g.loaded_ruby_provider = 0


-- appereance
--"""""""""""
-- set color of syntax highlight
vim.o.background = "dark"

-- always display status-line
vim.o.laststatus = 2

-- highlight the current line
vim.o.cursorline = true

-- always show the gutterline
vim.o.signcolumn = "yes"

-- keep some lines distance to the top and bottom
vim.o.scrolloff = 2

-- activate TrueColor support
if vim.fn.exists("+termguicolors") == 1 then
  vim.opt.termguicolors = true
elseif vim.fn.exists("+guicolors") == 1 then
  vim.opt.guicolors = true
end

-- set colorscheme and activate background opacity
require('dracularc')
vim.cmd([[colorscheme dracula]])


-- split config
--"""""""""""""
-- vsplit for help and Man
vim.cmd([[
cabbrev h vertical botright help
cabbrev M vertical botright Man
]])

-- vsplit for diffsplit
vim.o.diffopt = "vertical"

-- place splits right and under the current pane
vim.o.splitbelow = true
vim.o.splitright = true


-- misc
--"""""
-- use incremental search
vim.o.incsearch = true

-- enable the autocompletion menu
vim.o.wildmenu = true

-- allow modelines
vim.o.modeline = true

-- make it possible to move outsitde the text in visual block mode
vim.o.virtualedit = "block"

-- don't redraw the screen while executing macros
vim.o.lazyredraw = true

-- shows the last command in bottom right
vim.o.showcmd = true

-- don't lose undo history after switching buffers
vim.o.hidden = true

-- don't show mode
vim.o.showmode = false

-- disable mouse support
vim.o.mouse = ""

-- use ripgrep as grepprg if installed
vim.cmd([[
if executable("rg")
  set grepprg=rg\ --vimgrep
endif
]])


-- filetypes
--""""""""""
-- set filetype to c for header (*.h) files, cannot be set in the c ftplugin
vim.g.c_syntax_for_h = 1

-- allow embedded syntax highlight for lua
vim.g.vimsyn_embed = "lPr"


-- plugin configuration
--"""""""""""""""""""""
-- custom keybindings
require('keybindings')

-- custom tools for =
require('format')

-- NERDCommenter
require('nerdcommenter')

-- nvim-autopairs
require('nvim-autopairs').setup{}

-- nvim-cmp
require('cmprc')

-- nvim-dap
require('daprc')

-- diffview
require('diffviewrc')

-- lsp
require('lsprc')

-- lualine
require('lualinerc')

-- LuaSnip
require('luasniprc')

-- neogit
require('neogitrc')

-- nvim-surround
require('nvim-surround').setup{}

-- telescope
require('telescoperc')

-- treesitter
require('treesitterrc')
