-- make C-U delete the whole line in command mode
vim.keymap.set('c', '<C-U>', '<C-E><C-U>')

-- leave terminal mode with ESC
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- set catagories for which-key
local wk = require('which-key')
wk.register({ c = { name = 'comments' } }, { prefix = '<leader>' })
wk.register({ d = { name = 'debugger' } }, { prefix = '<leader>' })
wk.register({ s = { name = 'search' } }, { prefix = '<leader>' })

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
local search_map = function(keys, func, desc)
   if desc then
      desc = 'Search: ' .. desc
   end
   vim.keymap.set('n', keys, func, { desc = desc })
end
-- search files in the current directory
search_map('<leader>sf', require('telescope.builtin').find_files, 'all [f]iles')
-- search for files under source control
search_map(
   '<leader>sg',
   require('telescope.builtin').git_files,
   'tracked by [g]it'
)
-- search open buffers
search_map(
   '<leader>sb',
   require('telescope.builtin').buffers,
   'existing [b]uffers'
)
-- search recently opened files
search_map(
   '<leader>sr',
   require('telescope.builtin').oldfiles,
   '[r]ecently opened files'
)
-- search helpfiles
search_map('<leader>sh', require('telescope.builtin').help_tags, '[h]elp')
-- search lsp diagnostices
search_map(
   '<leader>sd',
   require('telescope.builtin').diagnostics,
   '[d]iagnostics'
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
   '<leader>e',
   vim.diagnostic.open_float,
   { desc = 'show diagnostics in floating window' }
)
vim.keymap.set(
   'n',
   '<leader>q',
   vim.diagnostic.setloclist,
   { desc = 'add diagnostics to location list' }
)

-- null-ls keymaps
OnNullLsAttach = function(_, bufnr)
   vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format({ async = true })
   end, { buffer = bufnr, desc = '[f]ormat current buffer' })
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

   -- set catagories for which-key
   wk.register({ l = { name = 'LSP' } }, { prefix = '<leader>' })
   wk.register({ w = { name = 'workspace' } }, { prefix = '<leader>' })

   -- See `:help vim.lsp.*` for documentation on any of the below functions
   lsp_map('K', vim.lsp.buf.hover, 'hover documentation')
   lsp_map('<C-k>', vim.lsp.buf.signature_help, 'signature documentation')
   lsp_map('<leader>ld', vim.lsp.buf.definition, 'goto [d]efinition')
   lsp_map('<leader>lD', vim.lsp.buf.declaration, 'goto [D]eclaration')
   lsp_map('<leader>li', vim.lsp.buf.implementation, 'goto [i]mplementation')
   lsp_map('<leader>lt', vim.lsp.buf.type_definition, '[t]ype definition')
   lsp_map('<leader>lR', vim.lsp.buf.rename, '[R]ename')
   lsp_map('<leader>la', vim.lsp.buf.code_action, 'code [a]ction')
   lsp_map(
      '<leader>lr',
      require('telescope.builtin').lsp_references,
      'goto [r]eferences'
   )
   lsp_map(
      '<leader>ls',
      require('telescope.builtin').lsp_document_symbols,
      'document [s]ymbols'
   )
   -- workspaces
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
   lsp_map(
      '<leader>ws',
      require('telescope.builtin').lsp_dynamic_workspace_symbols,
      '[w]orkspace [s]ymbols'
   )
   -- format
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
dap_map('<leader>db', require('dap').toggle_breakpoint, 'toggle [b]reakpiont')
dap_map('<leader>dc', require('dap').continue, '[c]ontinue')
dap_map('<leader>dn', require('dap').step_over, '[n]ext/step over')
dap_map('<leader>ds', require('dap').step_into, '[s]tep into')
dap_map('<leader>df', require('dap').step_out, '[f]inish/step out')
