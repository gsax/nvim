-- Load neodev first
require('neodev').setup()

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- capabilities comes from nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(
   vim.lsp.protocol.make_client_capabilities()
)
local servers =
   { 'clangd', 'eslint', 'julials', 'rust_analyzer', 'vimls', 'zls' }
for _, lsp in pairs(servers) do
   require('lspconfig')[lsp].setup({
      on_attach = OnLSPAttach,
      capabilities = capabilities,
      flags = {
         -- This will be the default in neovim 0.7+
         debounce_text_changes = 150,
      },
   })
end
-- gopls go language server, config from go.nvim
require('lspconfig').gopls.setup({
   on_attach = OnLSPAttach,
   capabilities = capabilities,
   flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
   },
   settings = {
      gopls = {
         analyses = { unusedparams = true, unreachable = false },
         codelenses = {
            generate = true,
            gc_details = true,
            test = true,
            tidy = true,
         },
         usePlaceholders = true,
         completeUnimported = true,
         staticcheck = true,
         matcher = 'Fuzzy',
         diagnosticsDelay = '500ms',
         experimentalWatchedFileDelay = '100ms',
         symbolMatcher = 'fuzzy',
         ['local'] = '',
         gofumpt = true,
         -- buildFlags = { '-tags', 'integration' },
         -- buildFlags = {"-tags", "functional"}
      },
   },
})

-- the sumneko_lua lua language server
require('lspconfig').lua_ls.setup({
   on_attach = OnLSPAttach,
   capabilities = capabilities,
   flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
   },
   settings = {
      Lua = {
         -- disable format, will use stylua with null-ls
         format = {
            enable = false,
         },
         -- Do not send telemetry data containing a randomized
         -- but unique identifier
         telemetry = {
            enable = false,
         },
      },
   },
})
