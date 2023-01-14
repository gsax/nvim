return require('packer').startup(function(use)
   -- A use-package inspired plugin manager for Neovim. Uses native packages,
   -- supports Luarocks dependencies, written in Lua, allows for expressive
   -- config
   use('wbthomason/packer.nvim')

   -- lsp and completion
   -- ^^^^^^^^^^^^^^^^^^
   -- nvim-lspconfig: Quickstart configurations for the Nvim LSP client
   use('neovim/nvim-lspconfig')

   -- completion sources
   use('hrsh7th/cmp-nvim-lsp')
   use('hrsh7th/cmp-buffer')
   use('hrsh7th/cmp-path')
   use('hrsh7th/cmp-cmdline')
   use('saadparwaiz1/cmp_luasnip')
   use('ray-x/cmp-treesitter')
   use('andersevenrud/cmp-tmux')
   use('hrsh7th/cmp-nvim-lua')
   -- A completion plugin for neovim coded in Lua.
   use('hrsh7th/nvim-cmp')

   -- Snippet Engine for Neovim written in Lua.
   use('L3MON4D3/LuaSnip')

   -- files and buffers
   -- ^^^^^^^^^^^^^^^^^
   -- Find, Filter, Preview, Pick. All lua, all the time.
   use({
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
   })

   -- 🥪 An alternative sudo.vim for Vim and
   -- Neovim, limited support sudo in Windows
   use('lambdalisue/suda.vim')

   -- bufdelete.nvim: Delete Neovim buffers without losing window layout
   use('famiu/bufdelete.nvim')

   -- help-vsplit: Open Neovim help in vertical split if there is enough space
   use('anuvyklack/help-vsplit.nvim')

   -- neogit: magit for neovim
   use({
      'TimUntersberger/neogit',
      requires = {
         'nvim-lua/plenary.nvim',
         'sindrets/diffview.nvim',
      },
   })

   -- filetypes and languages
   -- ^^^^^^^^^^^^^^^^^^^^^^^
   -- nvim-treesitter: Nvim Treesitter configurations and abstraction layer
   use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

   -- aniseed: Neovim configuration and plugins in Fennel (Lisp compiled to Lua)
   use('Olical/aniseed')

   -- debugger
   -- ^^^^^^^^
   -- nvim-dap: Debug Adapter Protocol client implementation for Neovim
   use('mfussenegger/nvim-dap')
   -- nvim-dap-ui: A UI for nvim-dap
   use('rcarriga/nvim-dap-ui')
   -- nvim-dap-virtual-text: This plugin adds virtual text support to nvim-dap.
   use('theHamsta/nvim-dap-virtual-text')
   -- nvim-dap-go:  An extension for nvim-dap providing configurations for
   -- launching go debugger (delve) and debugging individual tests
   use('leoluz/nvim-dap-go')

   -- repl
   -- ^^^^
   -- Conjure: Interactive evaluation for Neovim
   -- (Clojure, Fennel, Janet, Racket, Hy, MIT Scheme, Guile)
   use('Olical/conjure')

   -- editing
   -- ^^^^^^^
   -- NERDCommenter: orgasmic comments
   use('scrooloose/nerdcommenter')

   -- tabular: Vim script for text filtering and alignment
   use('godlygeek/tabular')

   -- autopairs for neovim written by lua
   use('windwp/nvim-autopairs')

   -- nvim-surround: Add/change/delete surrounding delimiter pairs with ease.
   -- Written with heart in Lua.
   use('kylechui/nvim-surround')

   -- appereance
   -- ^^^^^^^^^^
   -- lualine.nvim: A blazing fast and easy to configure neovim statusline
   -- plugin written in pure lua.
   use('nvim-lualine/lualine.nvim')

   -- dracula.nvim: Dracula colorscheme for neovim written in Lua
   use('gsax/dracula.nvim')
end)
