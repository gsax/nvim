-- keybindings for telescope
-- set nnoremap and silent for all keybindings
local opts = { noremap = true, silent = true }

-- search for open buffers
vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>Telescope find_files<CR>', opts)

-- search for files under source control
vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>Telescope git_files<CR>', opts)

-- search for open buffers
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<CR>', opts)
