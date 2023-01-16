return {
   -- A use-package inspired plugin manager for Neovim. Uses native packages,
   -- supports Luarocks dependencies, written in Lua, allows for expressive
   -- config
   --  use('wbthomason/packer.nvim')

   -- lsp and completion
   -- ^^^^^^^^^^^^^^^^^^
   -- nvim-lspconfig: Quickstart configurations for the Nvim LSP client
   'neovim/nvim-lspconfig',

   -- null-ls: Use Neovim as a language server to inject LSP diagnostics,
   -- code actions, and more via Lua.
   {
      'jose-elias-alvarez/null-ls.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
   },

   -- completion sources
   'hrsh7th/cmp-nvim-lsp',
   'hrsh7th/cmp-buffer',
   'hrsh7th/cmp-path',
   'hrsh7th/cmp-cmdline',
   'saadparwaiz1/cmp_luasnip',
   'ray-x/cmp-treesitter',
   'andersevenrud/cmp-tmux',
   'hrsh7th/cmp-nvim-lua',
   -- A completion plugin for neovim coded in Lua.
   'hrsh7th/nvim-cmp',

   --  -- Snippet Engine for Neovim written in Lua.
   'L3MON4D3/LuaSnip',

   -- files and buffers
   -- ^^^^^^^^^^^^^^^^^
   -- Find, Filter, Preview, Pick. All lua, all the time.
   {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
   },

   -- 🥪 An alternative sudo.vim for Vim and
   -- Neovim, limited support sudo in Windows
   'lambdalisue/suda.vim',

   -- bufdelete.nvim: Delete Neovim buffers without losing window layout
   'famiu/bufdelete.nvim',

   -- help-vsplit: Open Neovim help in vertical split if there is enough space
   {
      'anuvyklack/help-vsplit.nvim',
      config = true,
   },

   -- neogit: magit for neovim
   {
      'TimUntersberger/neogit',
      dependencies = {
         'nvim-lua/plenary.nvim',
         'sindrets/diffview.nvim',
      },
   },

   -- filetypes and languages
   -- ^^^^^^^^^^^^^^^^^^^^^^^
   -- nvim-treesitter: Nvim Treesitter configurations and abstraction layer
   'nvim-treesitter/nvim-treesitter',

   -- aniseed: Neovim configuration and plugins in Fennel (Lisp compiled to Lua)
   'Olical/aniseed',

   -- debugger
   -- ^^^^^^^^
   -- nvim-dap: Debug Adapter Protocol client implementation for Neovim
   'mfussenegger/nvim-dap',
   -- nvim-dap-ui: A UI for nvim-dap
   'rcarriga/nvim-dap-ui',
   -- nvim-dap-virtual-text: This plugin adds virtual text support to nvim-dap.
   'theHamsta/nvim-dap-virtual-text',
   -- nvim-dap-go:  An extension for nvim-dap providing configurations for
   -- launching go debugger (delve) and debugging individual tests
   'leoluz/nvim-dap-go',

   -- repl
   -- ^^^^
   -- Conjure: Interactive evaluation for Neovim
   -- (Clojure, Fennel, Janet, Racket, Hy, MIT Scheme, Guile)
   'Olical/conjure',

   -- editing
   -- ^^^^^^^
   -- Comment: brain muscle // Smart and powerful comment plugin for neovim.
   -- Supports treesitter, dot repeat,
   -- left-right/up-down motions, hooks, and more
   {
      'numToStr/Comment.nvim',
      config = true,
   },

   -- nvim-align: Neovim plugin for aligning text
   'RRethy/nvim-align',

   -- autopairs for neovim written by lua
   {
      'windwp/nvim-autopairs',
      config = true,
   },

   -- nvim-surround: Add/change/delete surrounding delimiter pairs with ease.
   -- Written with heart in Lua.
   {
      'kylechui/nvim-surround',
      config = true,
   },

   -- appereance
   -- ^^^^^^^^^^
   -- lualine.nvim: A blazing fast and easy to configure neovim statusline
   -- plugin written in pure lua.
   'nvim-lualine/lualine.nvim',

   -- dracula.nvim: Dracula colorscheme for neovim written in Lua
   'gsax/dracula.nvim',
}
