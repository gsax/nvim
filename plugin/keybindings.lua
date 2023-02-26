-- make C-U delete the whole line in command mode
vim.keymap.set('c', '<C-U>', '<C-E><C-U>')

-- leave terminal mode with ESC
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- set catagories for which-key
local wk = require('which-key')
wk.register({ s = { name = 'telescope' } }, { prefix = '<leader>' })
wk.register({ d = { name = 'debugger' } }, { prefix = '<leader>' })

-- telescope
-- search for files in the current directory
vim.keymap.set(
   'n',
   '<leader>l',
   require('telescope.builtin').find_files,
   { desc = 'search all files' }
)
-- search for files under source control
vim.keymap.set(
   'n',
   '<leader>p',
   require('telescope.builtin').git_files,
   { desc = 'search files in git' }
)
-- search for open buffers
vim.keymap.set(
   'n',
   '<leader>b',
   require('telescope.builtin').buffers,
   { desc = 'find existing [b]uffers' }
)
-- find recently opened files
vim.keymap.set(
   'n',
   '<leader>?',
   require('telescope.builtin').oldfiles,
   { desc = 'find recently opened files' }
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
   { desc = 'show diagnostics in floating window' }
)
vim.keymap.set(
   'n',
   '[d',
   vim.diagnostic.goto_prev,
   { desc = 'go to previous [d]iagnostic' }
)
vim.keymap.set(
   'n',
   ']d',
   vim.diagnostic.goto_next,
   { desc = 'go to next [d]iagnostic' }
)
vim.keymap.set(
   'n',
   '<leader>q',
   vim.diagnostic.setloclist,
   { desc = 'add diagnostics to location list' }
)

-- null-ls keymaps
OnNullLsAttach = function(_, bufnr)
   local bufopts = { noremap = true, silent = true, buffer = bufnr }
   vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format({ async = true })
   end, { desc = '[f]ormat current buffer' }, bufopts)
end

-- lsp keymaps
OnLSPAttach = function(_, bufnr)
   -- Enable completion triggered by <c-x><c-o>
   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

   -- Define small helper and utility functions so you don't have to repeat
   -- yourself many times.
   local nmap = function(keys, func, desc)
      if desc then
         desc = 'LSP: ' .. desc
      end
      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
   end

   -- See `:help vim.lsp.*` for documentation on any of the below functions
   nmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
   nmap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
   nmap('K', vim.lsp.buf.hover, 'hover documentation')
   nmap('gi', vim.lsp.buf.implementation, '[g]oto [i]mplementation')
   nmap('<C-k>', vim.lsp.buf.signature_help, 'signature documentation')
   nmap(
      '<leader>wa',
      vim.lsp.buf.add_workspace_folder,
      '[w]orkspace [a]dd Folder'
   )
   nmap(
      '<leader>wr',
      vim.lsp.buf.remove_workspace_folder,
      '[w]orkspace [r]emove Folder'
   )
   nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
   end, '[w]orkspace [l]ist Folders')
   nmap('<leader>D', vim.lsp.buf.type_definition, 'type [D]efinition')
   nmap('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
   nmap('<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')
   nmap(
      'gr',
      require('telescope.builtin').lsp_references,
      '[g]oto [r]eferences'
   )
   nmap('<leader>f', function()
      vim.lsp.buf.format({ async = true })
   end, '[f]ormat current buffer')
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
