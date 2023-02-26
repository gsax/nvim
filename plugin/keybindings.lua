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
