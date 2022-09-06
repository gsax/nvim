require('lualine').setup({
   options = {
      icons_enabled = true,
      theme = 'dracula-nvim',
      component_separators = '',
      section_separators = '',
      disabled_filetypes = {
         statusline = {},
         winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
         statusline = 1000,
         tabline = 1000,
         winbar = 1000,
      },
   },
   sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = {
         {
            'filename',
            path = 1,
            symbols = {
               modified = ' +',
               readonly = ' ',
            },
         },
      },
      lualine_x = {
         { 'filetype', separator = '|' },
         { 'encoding', separator = '|' },
         { 'fileformat', icons_enabled = false },
      },
      lualine_y = { 'location' },
      lualine_z = { 'progress' },
   },
   inactive_sections = {
      lualine_a = {},
      lualine_b = {
         {
            'filename',
            path = 1,
            symbols = {
               modified = ' +',
               readonly = ' ',
            },
         },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {
         { 'filetype', separator = '|' },
         { 'encoding', separator = '|' },
         { 'fileformat', icons_enabled = false },
      },
   },
   tabline = {},
   winbar = {},
   inactive_winbar = {},
   extensions = {},
})
