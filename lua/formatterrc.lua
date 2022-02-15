-- keybinding
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('', '<leader>g', '<cmd>Format<CR>', opts)

-- make a function for prettier, so it's easier to use for multiple languages
local prettier = function()
   return {
      exe = 'prettier',
      args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
      stdin = true,
   }
end

require('formatter').setup({
   filetype = {
      c = {
         function()
            return {
               exe = 'clang-format',
               args = { '--assume-filename', vim.api.nvim_buf_get_name(0) },
               stdin = true,
               cwd = vim.fn.expand('%:p:h'),
            }
         end,
      },
      css = { prettier },
      html = { prettier },
      go = {
         function()
            return {
               exe = 'goimports',
               stdin = true,
            }
         end,
         function()
            return {
               exe = 'gofumpt',
               stdin = true,
            }
         end,
      },
      javascript = { prettier },
      json = { prettier },
      lua = {
         function()
            return {
               exe = 'stylua',
               args = {
                  '--config-path '
                     .. os.getenv('XDG_CONFIG_HOME')
                     .. '/stylua/stylua.toml',
                  '-',
               },
               stdin = true,
            }
         end,
      },
      markdown = { prettier },
      python = {
         function()
            return {
               exe = 'black',
               args = { '-' },
               stdin = true,
            }
         end,
      },
      rust = {
         function()
            return {
               exe = 'rustfmt',
               args = { '--emit=stdout' },
               stdin = true,
            }
         end,
      },
      typescript = { prettier },
      yaml = { prettier },
   },
})
