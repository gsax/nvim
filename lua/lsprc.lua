-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap(
   'n',
   '<leader>e',
   '<cmd>lua vim.diagnostic.open_float()<CR>',
   opts
)
vim.api.nvim_set_keymap(
   'n',
   '[d',
   '<cmd>lua vim.diagnostic.goto_prev()<CR>',
   opts
)
vim.api.nvim_set_keymap(
   'n',
   ']d',
   '<cmd>lua vim.diagnostic.goto_next()<CR>',
   opts
)
vim.api.nvim_set_keymap(
   'n',
   '<leader>q',
   '<cmd>lua vim.diagnostic.setloclist()<CR>',
   opts
)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
   -- Enable completion triggered by <c-x><c-o>
   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

   -- Mappings.
   -- See `:help vim.lsp.*` for documentation on any of the below functions
   vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      'gD',
      '<cmd>lua vim.lsp.buf.declaration()<CR>',
      opts
   )
   vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      'gd',
      '<cmd>lua vim.lsp.buf.definition()<CR>',
      opts
   )
   vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      'K',
      '<cmd>lua vim.lsp.buf.hover()<CR>',
      opts
   )
   vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      'gi',
      '<cmd>lua vim.lsp.buf.implementation()<CR>',
      opts
   )
   vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<C-k>',
      '<cmd>lua vim.lsp.buf.signature_help()<CR>',
      opts
   )
   vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>wa',
      '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
      opts
   )
   vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>wr',
      '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
      opts
   )
   vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>wl',
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
      opts
   )
   vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>D',
      '<cmd>lua vim.lsp.buf.type_definition()<CR>',
      opts
   )
   vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>rn',
      '<cmd>lua vim.lsp.buf.rename()<CR>',
      opts
   )
   vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>ca',
      '<cmd>lua vim.lsp.buf.code_action()<CR>',
      opts
   )
   vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      'gr',
      '<cmd>lua vim.lsp.buf.references()<CR>',
      opts
   )
   vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>f',
      '<cmd>lua vim.lsp.buf.formatting()<CR>',
      opts
   )
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- capabilities comes from nvim-cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(
   vim.lsp.protocol.make_client_capabilities()
)
local servers = { 'clangd', 'vimls' }
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
         -- Do not send telemetry data containing a randomized
         -- but unique identifier
         telemetry = {
            enable = false,
         },
      },
   },
})
