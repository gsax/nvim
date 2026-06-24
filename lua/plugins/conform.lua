return {
   {
      'stevearc/conform.nvim',
      keys = {
         {
            '<leader>f',
            function()
               require('conform').format({
                  async = true,
                  lsp_format = 'fallback',
               })
            end,
            mode = '',
            desc = '[f]ormat buffer',
         },
      },
      opts = {
         formatters_by_ft = {
            c = { 'clang-format' },
            css = { 'biome' },
            elixir = { 'mix' },
            html = { 'djlint', 'biome' },
            htmldjango = { 'djlint' },
            javascript = { 'biome' },
            lua = { 'stylua' },
            nix = { 'nixfmt' },
            rust = { 'rustfmt' },
            typst = { 'typstyle' },
         },
      },
   },
}
