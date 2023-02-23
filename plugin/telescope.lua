-- keybindings for telescope

-- search for files in the current directory
vim.keymap.set(
   'n',
   '<leader>l',
   require('telescope.builtin').find_files,
   { desc = 'Search all Files' }
)

-- search for files under source control
vim.keymap.set(
   'n',
   '<leader>p',
   require('telescope.builtin').git_files,
   { desc = 'Search Files in git' }
)

-- search for open buffers
vim.keymap.set(
   'n',
   '<leader>b',
   require('telescope.builtin').buffers,
   { desc = 'Find existing buffers' }
)
