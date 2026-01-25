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
         -- list all servers with their executable names
         local servers = {
            clangd = { executable = 'clangd' },
            elixirls = { executable = 'elixirls' },
            emmet_language_server = { executable = 'emmet-language-server' },
            jinja_lsp = {
               executable = 'jinja-lsp',
               filetypes = { 'jinja', 'htmldjango' },
            },
            lua_ls = { executable = 'lua-language-server' },
            rust_analyzer = {
               executable = 'rust-analyzer',
               settings = {
                  ['rust-analyzer'] = {
                     check = {
                        command = 'clippy',
                     },
                  },
               },
            },
         }

         -- Set global capabilities for all LSP servers
         vim.lsp.config('*', {
            capabilities = capabilities,
         })

         -- Configure and enable each LSP server
         for name, config in pairs(servers) do
            local executable = config.executable
            -- Check if executable exists in $PATH
            if vim.fn.executable(executable) == 1 then
               local lsp_config = vim.tbl_deep_extend('force', {}, config)
               lsp_config.executable = nil -- Remove the executable key before passing to lsp.config

               -- Only call vim.lsp.config if there are server-specific settings
               if next(lsp_config) ~= nil then
                  vim.lsp.config(name, lsp_config)
               end

               vim.lsp.enable(name)
            end
         end
      end,
   },
}
