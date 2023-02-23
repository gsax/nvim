local dap = require('dap')

-- configure lldb for c, cpp, rust and zig
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

-- use the same config for c, cpp, rust and zig
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c
dap.configurations.zig = dap.configurations.c

-- load nvim-dap-go for go debugging with delve
require('dap-go').setup()

-- load nvim-dap-ui
require('dapui').setup()

-- load nvim-dap-virtual-text
require('nvim-dap-virtual-text').setup()

-- keybindings
vim.keymap.set(
   'n',
   '<F2>',
   require('dapui').toggle,
   { desc = 'Toggle Debugger' }
)
vim.keymap.set(
   'n',
   '<F5>',
   require('dap').continue,
   { desc = 'Debugger continue' }
)
vim.keymap.set(
   'n',
   '<F6>',
   require('dap').toggle_breakpoint,
   { desc = 'Debugger toggle breakpiont' }
)
vim.keymap.set(
   'n',
   '<F10>',
   require('dap').step_over,
   { desc = 'Debugger step over' }
)
vim.keymap.set(
   'n',
   '<F11>',
   require('dap').step_into,
   { desc = 'Debugger step into' }
)
vim.keymap.set(
   'n',
   '<F12>',
   require('dap').step_out,
   { desc = 'Debugger step out' }
)

vim.keymap.set(
   'n',
   '<leader>ds',
   require('dapui').toggle,
   { desc = 'Toggle Debugger' }
)
vim.keymap.set(
   'n',
   '<leader>dc',
   require('dap').continue,
   { desc = 'Debugger continue' }
)
vim.keymap.set(
   'n',
   '<leader>db',
   require('dap').toggle_breakpoint,
   { desc = 'Debugger toggle breakpiont' }
)
vim.keymap.set(
   'n',
   '<leader>do',
   require('dap').step_over,
   { desc = 'Debugger step over' }
)
vim.keymap.set(
   'n',
   '<leader>di',
   require('dap').step_into,
   { desc = 'Debugger step into' }
)
vim.keymap.set(
   'n',
   '<leader>dx',
   require('dap').step_out,
   { desc = 'Debugger step out' }
)
