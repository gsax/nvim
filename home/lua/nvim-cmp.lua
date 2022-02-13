-- set completeopt to have a better completion experience
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- needed for SuperTab snippet behaviour
local has_words_before = function()
   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
   return col ~= 0
      and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
            :sub(col, col)
            :match('%s')
         == nil
end

-- Setup nvim-cmp and luasnip
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
   snippet = {
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
   },
   mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      -- Specify `cmp.config.disable` if you want to remove
      -- the default `<C-y>` mapping.
      ['<C-y>'] = cmp.config.disable,
      ['<C-e>'] = cmp.mapping({
         i = cmp.mapping.abort(),
         c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. Set `select` to `false`
      -- to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
      ['<Tab>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
         elseif has_words_before() then
            cmp.complete()
         else
            fallback()
         end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
         else
            fallback()
         end
      end, { 'i', 's' }),
   },
   -- completion sources to use everywhere
   sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'treesitter' },
      { name = 'luasnip' },
   }, {
      { name = 'buffer' },
      { name = 'path' },
      { name = 'tmux', option = { all_panes = true } },
   }),
})

-- Set configuration for the nvim lua api
cmp.setup.filetype('lua', {
   sources = cmp.config.sources({
      { name = 'nvim_lua' },
   }, {
      { name = 'buffer' },
   }),
})

-- Use buffer source for `/`
-- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
   sources = {
      { name = 'buffer' },
   },
})

-- Use cmdline & path source for ':'
-- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
   sources = cmp.config.sources({
      { name = 'path' },
   }, {
      { name = 'cmdline' },
   }),
})
