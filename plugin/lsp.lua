-- Load neodev first
require('neodev').setup()

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- capabilities comes from nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(
   vim.lsp.protocol.make_client_capabilities()
)
local servers =
   { 'clangd', 'rust_analyzer', 'vimls' }
for _, lsp in pairs(servers) do
   vim.lsp.config(lsp, {
      on_attach = OnLSPAttach,
      capabilities = capabilities,
   })
   vim.lsp.enable(lsp)
end

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
