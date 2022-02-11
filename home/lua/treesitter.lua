-- enable treesitter
require'nvim-treesitter.configs'.setup {
   -- enable treesitter highlighting for all languages
   highlight = {
      enable = true,
      use_languagetree = false,
   },
   -- enable treesitter indentation for all languages
   indent = {
      enable = true
   },
}
