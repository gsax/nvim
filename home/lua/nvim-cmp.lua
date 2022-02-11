-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
   snippet = {
      expand = function(args)
         vim.fn["vsnip#anonymous"](args.body)
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
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
         elseif has_words_before() then
            cmp.complete()
         else
            -- The fallback function sends a already mapped key.
            -- In this case, it's probably `<Tab>`.
            fallback()
         end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function()
         if cmp.visible() then
            cmp.select_prev_item()
         elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
         end
      end, { "i", "s" }),
   },
   -- completion sources to use everywhere
   sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'treesitter' },
      { name = 'vsnip' },
   }, {
      { name = 'buffer' },
      { name = 'path' },
      { name = 'tmux',
            option = { all_panes = true }
      },
   })
})

-- Set configuration for the nvim lua api
cmp.setup.filetype('lua', {
   sources = cmp.config.sources({
      { name = 'nvim_lua' },
   }, {
      { name = 'buffer' },
      })
})

-- Use buffer source for `/`
-- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
   sources = {
      { name = 'buffer' }
   }
})

-- Use cmdline & path source for ':'
-- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
   sources = cmp.config.sources({
      { name = 'path' }
   }, {
      { name = 'cmdline' }
      })
})
