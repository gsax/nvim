local dap = require('dap')

-- configure lldb for c, cpp, rust and zig
dap.adapters.lldb = {
   type = 'executable',
   command = 'lldb-dap',
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
