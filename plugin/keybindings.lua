-- make C-U delete the whole line in command mode
vim.keymap.set('c', '<C-U>', '<C-E><C-U>')

-- leave terminal mode with ESC
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- set catagories for which-key
local wk = require('which-key')
wk.register({ s = { name = '[s] telescope' } }, { prefix = '<leader>' })
wk.register({ d = { name = '[d] debugger' } }, { prefix = '<leader>' })

-- telescope
-- search for files in the current directory
vim.keymap.set(
   'n',
   '<leader>l',
   require('telescope.builtin').find_files,
   { desc = '[l] search all files' }
)
-- search for files under source control
vim.keymap.set(
   'n',
   '<leader>p',
   require('telescope.builtin').git_files,
   { desc = '[p] search files in git' }
)
-- search for open buffers
vim.keymap.set(
   'n',
   '<leader>b',
   require('telescope.builtin').buffers,
   { desc = '[b] find existing buffers' }
)
-- find recently opened files
vim.keymap.set(
   'n',
   '<leader>?',
   require('telescope.builtin').oldfiles,
   { desc = '[?] find recently opened files' }
)
-- search helpfiles
vim.keymap.set(
   'n',
   '<leader>sh',
   require('telescope.builtin').help_tags,
   { desc = '[s]earch [h]elp' }
)
-- search lsp diagnostices
vim.keymap.set(
   'n',
   '<leader>sd',
   require('telescope.builtin').diagnostics,
   { desc = '[s]earch [d]iagnostics' }
)

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set(
   'n',
   '<leader>e',
   vim.diagnostic.open_float,
   { desc = '[e] show diagnostics in floating window' }
)
vim.keymap.set(
   'n',
   '[d',
   vim.diagnostic.goto_prev,
   { desc = '[[] go to previous [d]iagnostic' }
)
vim.keymap.set(
   'n',
   ']d',
   vim.diagnostic.goto_next,
   { desc = '[]] go to next [d]iagnostic' }
)
vim.keymap.set(
   'n',
   '<leader>q',
   vim.diagnostic.setloclist,
   { desc = '[q] add diagnostics to location list' }
)

-- null-ls keymaps
OnNullLsAttach = function(_, bufnr)
   local bufopts = { noremap = true, silent = true, buffer = bufnr }
   vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format({ async = true })
   end, { desc = '[f] format current buffer' }, bufopts)
end

-- lsp keymaps
OnLSPAttach = function(_, bufnr)
   -- Enable completion triggered by <c-x><c-o>
   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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
   end, { desc = '[f] format current buffer' }, bufopts)
end

-- debug adapter
vim.keymap.set(
   'n',
   '<F2>',
   require('dapui').toggle,
   { desc = 'toggle debugger' }
)
vim.keymap.set(
   'n',
   '<F5>',
   require('dap').continue,
   { desc = 'debugger continue' }
)
vim.keymap.set(
   'n',
   '<F6>',
   require('dap').toggle_breakpoint,
   { desc = 'debugger toggle breakpiont' }
)
vim.keymap.set(
   'n',
   '<F10>',
   require('dap').step_over,
   { desc = 'debugger step over' }
)
vim.keymap.set(
   'n',
   '<F11>',
   require('dap').step_into,
   { desc = 'debugger step into' }
)
vim.keymap.set(
   'n',
   '<F12>',
   require('dap').step_out,
   { desc = 'debugger step out' }
)

vim.keymap.set(
   'n',
   '<leader>dt',
   require('dapui').toggle,
   { desc = '[d]ebugger [t]oggle' }
)
vim.keymap.set(
   'n',
   '<leader>db',
   require('dap').toggle_breakpoint,
   { desc = '[d]ebugger toggle [b]reakpiont' }
)
vim.keymap.set(
   'n',
   '<leader>dc',
   require('dap').continue,
   { desc = '[d]ebugger [c]ontinue' }
)
vim.keymap.set(
   'n',
   '<leader>dn',
   require('dap').step_over,
   { desc = '[d]ebugger step over/[n]ext' }
)
vim.keymap.set(
   'n',
   '<leader>ds',
   require('dap').step_into,
   { desc = '[d]ebugger step into/[s]tep' }
)
vim.keymap.set(
   'n',
   '<leader>df',
   require('dap').step_out,
   { desc = '[d]ebugger step out/[f]inish' }
)
