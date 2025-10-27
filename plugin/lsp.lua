-- Load neodev first
require('neodev').setup()

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- capabilities comes from nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(
   vim.lsp.protocol.make_client_capabilities()
)
local servers =
   { 'clangd', 'rust_analyzer', 'vimls', 'zls' }
for _, lsp in pairs(servers) do
   vim.lsp.config(lsp, {
      on_attach = OnLSPAttach,
      capabilities = capabilities,
   })
   vim.lsp.enable(lsp)
end

-- gopls go language server, config from go.nvim
vim.lsp.config('gopls', {
   on_attach = OnLSPAttach,
   capabilities = capabilities,
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

-- LuaLS: A language server that offers Lua language support - programmed in Lua
-- config from :help lspconfig-all
vim.lsp.config('lua_ls', {
   on_attach = OnLSPAttach,
   capabilities = capabilities,
   on_init = function(client)
      if client.workspace_folders then
         local path = client.workspace_folders[1].name
         if
            path ~= vim.fn.stdpath('config')
            and (
               vim.uv.fs_stat(path .. '/.luarc.json')
               or vim.uv.fs_stat(path .. '/.luarc.jsonc')
            )
         then
            return
         end
      end

      client.config.settings.Lua =
         vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
               version = 'LuaJIT',
               path = {
                  'lua/?.lua',
                  'lua/?/init.lua',
               },
            },
            workspace = {
               checkThirdParty = false,
               library = {
                  vim.env.VIMRUNTIME,
               },
            },
         })
   end,
   settings = {
      Lua = {
         format = {
            enable = false,
         },
      },
   },
})
