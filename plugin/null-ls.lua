local null_ls = require('null-ls')

null_ls.setup({
   on_attach = OnNullLsAttach,
   sources = {
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.clang_format,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.prettier.with({
         filetypes = { 'css', 'html', 'javascript', 'markdonwn' },
         extra_filetypes = { 'htmldjango' },
         extra_args = { '--use-tabs' },
      }),
      null_ls.builtins.formatting.stylua,
   },
})
