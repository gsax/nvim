return {
   {
      'neovim/nvim-lspconfig',
      dependencies = {
         { 'j-hui/fidget.nvim', opts = {} },
         {
            'folke/lazydev.nvim',
            ft = 'lua',
            opts = {
               library = {
                  { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
               },
            },
         },
      },

      config = function()
         -- set blink capabilities
         local capabilities = require('blink.cmp').get_lsp_capabilities()
         -- list all servers
         local servers = {
            clangd = true,
            rust_analyzer = true,
            lua_ls = true,
         }

         -- Set global capabilities for all LSP servers
         vim.lsp.config('*', {
            capabilities = capabilities,
         })

         -- Configure and enable each LSP server
         for name, config in pairs(servers) do
            if config == true then
               config = {}
            end

            -- Only call vim.lsp.config if there are server-specific settings
            if next(config) ~= nil then
               local lsp_config = vim.tbl_deep_extend('force', {}, config)
               vim.lsp.config(name, lsp_config)
            end

            vim.lsp.enable(name)
         end

         -- for server_name, server_executable in pairs(servers) do
         --    if vim.fn.executable(server_executable) == 1 then
         --       vim.lsp.config(server_name, {
         --          on_attach = OnLSPAttach,
         --          -- capabilities = capabilities,
         --       })
         --       vim.lsp.enable(server_name)
         --    end
         -- end
      end,
   },
}
