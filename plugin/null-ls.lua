local null_ls = require('null-ls')

local on_attach = function(client, bufnr)
   local bufopts = { noremap = true, silent = true, buffer = bufnr }
   vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format({ async = true })
   end, bufopts)
end

null_ls.setup({
   on_attach = on_attach,
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
