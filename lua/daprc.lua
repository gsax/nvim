local dap = require('dap')

-- configure lldb for c, cpp and rust
dap.adapters.lldb = {
   type = 'executable',
   command = '/usr/bin/lldb-vscode',
   name = 'lldb',
}

dap.configurations.c = {
   {
      name = 'Launch',
      type = 'lldb',
      request = 'launch',
      program = function()
         return vim.fn.input(
            'Path to executable: ',
            vim.fn.getcwd() .. '/',
            'file'
         )
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
      runInTerminal = false,
   },
   {
      name = 'Attach to process',
      type = 'lldb',
      request = 'attach',
      pid = require('dap.utils').pick_process,
      args = {},
   },
}

-- use the same config for c, cpp and rust
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c

-- load nvim-dap-go for go debugging with delve
require('dap-go').setup()

-- load nvim-dap-ui
require('dapui').setup()

-- keybindings
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap(
   'n',
   '<F2>',
   "<cmd>lua require'dapui'.toggle()<CR>",
   opts
)
vim.api.nvim_set_keymap(
   'n',
   '<F5>',
   "<cmd>lua require'dap'.continue()<CR>",
   opts
)
vim.api.nvim_set_keymap(
   'n',
   '<F6>',
   "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
   opts
)
vim.api.nvim_set_keymap(
   'n',
   '<F10>',
   "<cmd>lua require'dap'.step_over()<CR>",
   opts
)
vim.api.nvim_set_keymap(
   'n',
   '<F11>',
   "<cmd>lua require'dap'.step_into()<CR>",
   opts
)
vim.api.nvim_set_keymap(
   'n',
   '<F12>',
   "<cmd>lua require'dap'.step_out()<CR>",
   opts
)
