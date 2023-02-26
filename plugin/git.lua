local neogit = require('neogit')
local diffview = require('diffview')

neogit.setup({
   kind = 'replace',
   integrations = { diffview = true },
})

diffview.setup({
   use_icons = false,
})
