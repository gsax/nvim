local dap = require('dap')
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

-- load nvim-dap-ui
require('dapui').setup()
