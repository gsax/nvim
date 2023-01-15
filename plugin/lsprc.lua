-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
   -- Enable completion triggered by <c-x><c-o>
   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

   -- Mappings.
   -- See `:help vim.lsp.*` for documentation on any of the below functions
   local bufopts = { noremap = true, silent = true, buffer = bufnr }
   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
   vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
   vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
   vim.keymap.set(
      'n',
      '<leader>wr',
      vim.lsp.buf.remove_workspace_folder,
      bufopts
   )
   vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
   end, bufopts)
   vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
   vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
   vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format({ async = true })
   end, bufopts)
end

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
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
         -- This will be the default in neovim 0.7+
         debounce_text_changes = 150,
      },
   })
end
-- gopls go language server, config from go.nvim
require('lspconfig').gopls.setup({
   on_attach = on_attach,
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
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup({
   on_attach = on_attach,
   capabilities = capabilities,
   flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
   },
   settings = {
      Lua = {
         runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
         },
         diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
         },
         workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file('', true),
         },
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
