return require('packer').startup(function(use)

   -- A use-package inspired plugin manager for Neovim. Uses native packages,
   -- supports Luarocks dependencies, written in Lua, allows for expressive
   -- config
   use 'wbthomason/packer.nvim'


   -- lsp and completion
   -- ^^^^^^^^^^^^^^^^^^
   -- nvim-lspconfig: Quickstart configurations for the Nvim LSP client
   use 'neovim/nvim-lspconfig'

   -- completion sources
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/cmp-cmdline'
   use 'hrsh7th/cmp-vsnip'
   use 'ray-x/cmp-treesitter'
   use 'andersevenrud/cmp-tmux'
   use { 'hrsh7th/cmp-nvim-lua', ft = 'lua' }
   -- A completion plugin for neovim coded in Lua.
   use 'hrsh7th/nvim-cmp'

   -- Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
   use 'hrsh7th/vim-vsnip'


   -- files and buffers
   -- ^^^^^^^^^^^^^^^^^
   -- fzf.vim: fzf ❤️ vim
   use 'junegunn/fzf'
   use 'junegunn/fzf.vim'

   -- vim-bbye: don't close splits when closing a buffer
   use 'moll/vim-bbye'


   -- filetypes and languages
   -- ^^^^^^^^^^^^^^^^^^^^^^^
   -- nvim-treesitter: Nvim Treesitter configurations and abstraction layer
   use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

   -- vim-clang-format: Vim plugin for clang-format, a formatter for C, C++,
   -- Obj-C, Java, JavaScript, TypeScript and ProtoBuf.
   use { 'rhysd/vim-clang-format', opt = true,  ft = 'c' }

   -- vim-go: Go development plugin for Vim
   use { 'fatih/vim-go', opt = true, ft = 'go' }

   -- vim-gnupg: transparent editing of PGP files
   use 'jamessan/vim-gnupg'


   -- editing
   -- ^^^^^^^
   -- NERDCommenter: orgasmic comments
   use 'scrooloose/nerdcommenter'

   -- tabular: Vim script for text filtering and alignment
   use 'godlygeek/tabular'

   -- Auto close parentheses and repeat by dot dot dot...
   use 'cohama/lexima.vim'

   -- autopairs for neovim written by lua
   -- Could become an alternative to lexima
   --   use 'windwp/nvim-autopairs'


   -- appereance
   -- ^^^^^^^^^^
   -- lightline.vim: A light and configurable statusline/tabline plugin for Vim
   use 'itchyny/lightline.vim'

   -- vim-gitbranch: Provides the branch name of the current git repository
   use 'itchyny/vim-gitbranch'

   -- dracula: scream A dark theme for Vim
   use { 'gsax/dracula-vim', as = 'dracula' }

end)