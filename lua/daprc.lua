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
}

-- use the same config for c, cpp and rust
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c

-- load nvim-dap-go for go debugging with delve
require('dap-go').setup()

-- load nvim-dap-ui
require('dapui').setup()
