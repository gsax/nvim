-- make C-U delete the whole line in command mode
vim.keymap.set('c', '<C-U>', '<C-E><C-U>')

-- leave terminal mode with ESC
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- keybindings for telescope
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
