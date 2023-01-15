-- enable treesitter
require('nvim-treesitter.configs').setup({
   -- enable treesitter highlighting for all languages
   highlight = {
      enable = true,
      use_languagetree = true,
   },
   -- enable treesitter indentation for all languages
   indent = {
      enable = true,
   },
})
