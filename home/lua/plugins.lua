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
   use({ 'hrsh7th/cmp-nvim-lua', opt = true, ft = 'lua' })
   -- A completion plugin for neovim coded in Lua.
   use('hrsh7th/nvim-cmp')

   -- Snippet Engine for Neovim written in Lua.
   use('L3MON4D3/LuaSnip')

   -- files and buffers
   -- ^^^^^^^^^^^^^^^^^
   -- fzf.vim: fzf ❤️ vim
   use('junegunn/fzf')
   use('junegunn/fzf.vim')

   -- vim-bbye: don't close splits when closing a buffer
   use('moll/vim-bbye')

   -- filetypes and languages
   -- ^^^^^^^^^^^^^^^^^^^^^^^
   -- nvim-treesitter: Nvim Treesitter configurations and abstraction layer
   use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

   -- formatter.nvim
   use('mhartington/formatter.nvim')

   -- vim-gnupg: transparent editing of PGP files
   use('jamessan/vim-gnupg')

   -- editing
   -- ^^^^^^^
   -- NERDCommenter: orgasmic comments
   use('scrooloose/nerdcommenter')

   -- tabular: Vim script for text filtering and alignment
   use('godlygeek/tabular')

   -- autopairs for neovim written by lua
   use('windwp/nvim-autopairs')

   -- appereance
   -- ^^^^^^^^^^
   -- lightline.vim: A light and configurable statusline/tabline plugin for Vim
   use('itchyny/lightline.vim')

   -- vim-gitbranch: Provides the branch name of the current git repository
   use('itchyny/vim-gitbranch')

   -- dracula: scream A dark theme for Vim
   use({ 'https://git.sr.ht/~gsx/dracula-vim', as = 'dracula' })
end)
