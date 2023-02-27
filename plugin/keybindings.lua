-- make C-U delete the whole line in command mode
vim.keymap.set('c', '<C-U>', '<C-E><C-U>')

-- leave terminal mode with ESC
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- set catagories for which-key
local wk = require('which-key')
wk.register({ c = { name = 'comments' } }, { prefix = '<leader>' })
wk.register({ d = { name = 'debugger' } }, { prefix = '<leader>' })
wk.register({ s = { name = 'telescope' } }, { prefix = '<leader>' })
wk.register({ w = { name = 'workspace' } }, { prefix = '<leader>' })

-- toggle linenumbers
local toggle_line_numbers = function()
   if not vim.wo.number and not vim.wo.relativenumber then
      vim.wo.number = true
      vim.wo.relativenumber = false
   elseif vim.o.number and not vim.wo.relativenumber then
      vim.wo.number = true
      vim.wo.relativenumber = true
   else
      vim.wo.number = false
      vim.wo.relativenumber = false
   end
end
vim.keymap.set(
   'n',
   '<leader>n',
   toggle_line_numbers,
   { desc = 'toggle line[n]umbers' }
)

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

-- comments
-- toggle linewise comments
vim.keymap.set('n', '<leader>cc', function()
   return vim.v.count == 0 and '<Plug>(comment_toggle_linewise_current)'
      or '<Plug>(comment_toggle_linewise_count)'
end, { expr = true, desc = 'toggle linewise [c]omment' })
vim.keymap.set(
   'n',
   '<leader>c',
   '<Plug>(comment_toggle_linewise)',
   { desc = 'toggle linewise [c]omment' }
)
vim.keymap.set(
   'x',
   '<leader>cc',
   '<Plug>(comment_toggle_linewise_visual)',
   { desc = 'toggle linewise [c]omment' }
)
-- toggle blockwise comments
vim.keymap.set('n', '<leader>cb', function()
   return vim.v.count == 0 and '<Plug>(comment_toggle_blockwise_current)'
      or '<Plug>(comment_toggle_blockwise_count)'
end, { expr = true, desc = 'toggle [b]lockwise comment' })
vim.keymap.set(
   'x',
   '<leader>cb',
   '<Plug>(comment_toggle_blockwise_visual)',
   { desc = 'toggle [b]lockwise comment' }
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
   local lsp_map = function(keys, func, desc)
      if desc then
         desc = 'LSP: ' .. desc
      end
      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
   end

   -- See `:help vim.lsp.*` for documentation on any of the below functions
   lsp_map('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
   lsp_map('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
   lsp_map('K', vim.lsp.buf.hover, 'hover documentation')
   lsp_map('gi', vim.lsp.buf.implementation, '[g]oto [i]mplementation')
   lsp_map('<C-k>', vim.lsp.buf.signature_help, 'signature documentation')
   lsp_map(
      '<leader>wa',
      vim.lsp.buf.add_workspace_folder,
      '[w]orkspace [a]dd Folder'
   )
   lsp_map(
      '<leader>wr',
      vim.lsp.buf.remove_workspace_folder,
      '[w]orkspace [r]emove Folder'
   )
   lsp_map('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
   end, '[w]orkspace [l]ist Folders')
   lsp_map('<leader>D', vim.lsp.buf.type_definition, 'type [D]efinition')
   lsp_map('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
   lsp_map('<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')
   lsp_map(
      'gr',
      require('telescope.builtin').lsp_references,
      '[g]oto [r]eferences'
   )
   lsp_map('<leader>f', function()
      vim.lsp.buf.format({ async = true })
   end, '[f]ormat current buffer')
end

-- debug adapter
local dap_map = function(keys, func, desc)
   if desc then
      desc = 'DAP: ' .. desc
   end
   vim.keymap.set('n', keys, func, { desc = desc })
end

dap_map('<leader>dt', require('dapui').toggle, '[t]oggle dap-ui')
dap_map(
   '<leader>db',
   require('dap').toggle_breakpoint,
   'toggle [b]reakpiont'
)
dap_map('<leader>dc', require('dap').continue, '[c]ontinue')
dap_map('<leader>dn', require('dap').step_over, '[n]ext/step over')
dap_map('<leader>ds', require('dap').step_into, '[s]tep into')
dap_map('<leader>df', require('dap').step_out, '[f]inish/step out')
