return {
   {
      'nvim-treesitter/nvim-treesitter',
      branch = 'main',
      build = ':TSUpdate',
      config = function()
         -- Register bash as sh
         vim.treesitter.language.register('bash', 'sh')

         -- always install some languages
         require('nvim-treesitter')
            .install({
               'bash',
               'c',
               'caddy',
               'cmake',
               'css',
               'csv',
               'diff',
               'elixir',
               'fish',
               'git_config',
               'git_rebase',
               'gitattributes',
               'gitcommit',
               'gitignore',
               'html',
               'html_tags',
               'htmldjango',
               'ini',
               'javascript',
               'jinja',
               'jinja_inline',
               'jq',
               'json',
               'julia',
               'just',
               'lua',
               'luadoc',
               'make',
               'markdown',
               'markdown_inline',
               'meson',
               'muttrc',
               'ninja',
               'nix',
               'passwd',
               'printf',
               'python',
               'regex',
               'rust',
               'scss',
               'sql',
               'strace',
               'sway',
               'toml',
               'typst',
               'udev',
               'vim',
               'vimdoc',
               'xml',
               'xresources',
               'yaml',
               'zathurarc',
               'zig',
            })
            :wait(300000) -- max. 5 minutes

         -- Enable treesitter highlighting for all buffers by default
         vim.api.nvim_create_autocmd(
            { 'BufReadPost', 'BufNewFile', 'BufWritePost' },
            {
               group = vim.api.nvim_create_augroup(
                  'treesitter_start',
                  { clear = true }
               ),
               callback = function(args)
                  local buf = args.buf

                  -- Only enable for regular buffers, not special ones
                  if vim.bo[buf].buftype == '' then
                     pcall(function()
                        vim.treesitter.start(buf)
                     end)
                  end
               end,
            }
         )

         -- Also try to start on FileType changes
         vim.api.nvim_create_autocmd('FileType', {
            group = 'treesitter_start',
            callback = function()
               local buf = vim.api.nvim_get_current_buf()
               pcall(function()
                  vim.treesitter.start(buf)
               end)
            end,
         })
      end,
   },
   {
      'nvim-treesitter/nvim-treesitter-textobjects',
      branch = 'main',
      dependencies = 'nvim-treesitter/nvim-treesitter',
      init = function()
         -- Disable entire built-in ftplugin mappings to avoid conflicts
         vim.g.no_plugin_maps = true
      end,
      config = function()
         local ts_textobjects = require('nvim-treesitter-textobjects')

         -- Setup textobjects
         ts_textobjects.setup({
            select = {
               enable = true,
               lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
               selection_modes = {
                  ['@function.outer'] = 'v', -- charwise
                  ['@class.outer'] = 'v', -- charwise
               },
            },
            move = {
               enable = true,
               set_jumps = true,
            },
            swap = {
               enable = true,
            },
         })

         -- Defer keymap setup to avoid parser not found errors during initialization
         vim.schedule(function()
            local select_textobject =
               require('nvim-treesitter-textobjects.select').select_textobject

            -- Text object select keymaps
            vim.keymap.set({ 'x', 'o' }, 'aa', function()
               select_textobject('@parameter.outer', 'textobjects')
            end, { noremap = true, silent = true })
            vim.keymap.set({ 'x', 'o' }, 'ia', function()
               select_textobject('@parameter.inner', 'textobjects')
            end, { noremap = true, silent = true })
            vim.keymap.set({ 'x', 'o' }, 'af', function()
               select_textobject('@function.outer', 'textobjects')
            end, { noremap = true, silent = true })
            vim.keymap.set({ 'x', 'o' }, 'if', function()
               select_textobject('@function.inner', 'textobjects')
            end, { noremap = true, silent = true })
            vim.keymap.set({ 'x', 'o' }, 'ac', function()
               select_textobject('@class.outer', 'textobjects')
            end, { noremap = true, silent = true })
            vim.keymap.set({ 'x', 'o' }, 'ic', function()
               select_textobject('@class.inner', 'textobjects')
            end, { noremap = true, silent = true })

            -- Movement keymaps
            local move = require('nvim-treesitter-textobjects.move')
            vim.keymap.set('n', ']m', function()
               move.goto_next_start('@function.outer', 'textobjects')()
            end, { noremap = true, silent = true })
            vim.keymap.set('n', ']]', function()
               move.goto_next_start('@class.outer', 'textobjects')()
            end, { noremap = true, silent = true })
            vim.keymap.set('n', ']M', function()
               move.goto_next_end('@function.outer', 'textobjects')()
            end, { noremap = true, silent = true })
            vim.keymap.set('n', '][', function()
               move.goto_next_end('@class.outer', 'textobjects')()
            end, { noremap = true, silent = true })
            vim.keymap.set('n', '[m', function()
               move.goto_previous_start('@function.outer', 'textobjects')()
            end, { noremap = true, silent = true })
            vim.keymap.set('n', '[[', function()
               move.goto_previous_start('@class.outer', 'textobjects')()
            end, { noremap = true, silent = true })
            vim.keymap.set('n', '[M', function()
               move.goto_previous_end('@function.outer', 'textobjects')()
            end, { noremap = true, silent = true })
            vim.keymap.set('n', '[]', function()
               move.goto_previous_end('@class.outer', 'textobjects')()
            end, { noremap = true, silent = true })

            -- Swap keymaps
            local swap = require('nvim-treesitter-textobjects.swap')
            vim.keymap.set('n', '<leader>a', function()
               swap.swap_next('@parameter.inner', 'textobjects')()
            end, { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>A', function()
               swap.swap_previous('@parameter.inner', 'textobjects')()
            end, { noremap = true, silent = true })
         end)
      end,
   },
}
