return {
   {
      'saghen/blink.cmp',
      dependencies = { 'folke/lazydev.nvim' },
      version = '1.*',
      opts = {
         sources = {
            default = {
               'lazydev',
               'lsp',
               'path',
               'snippets',
               'buffer',
               'omni',
            },
            providers = {
               lazydev = {
                  name = 'LazyDev',
                  module = 'lazydev.integrations.blink',
                  score_offset = 100,
               },
            },
         },
         fuzzy = { implementation = 'prefer_rust_with_warning' },
         signature = { enable = true },
      },
   },
}
