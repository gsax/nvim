-- enable lspconfig
local lspconfig = require('lspconfig')

-- the ccls c language server
--lspconfig.ccls.setup{
--   on_attach = on_attach;
--}

-- the clangd c language server
lspconfig.clangd.setup{
   on_attach = on_attach;
}

-- the gopls go language server
lspconfig.gopls.setup{
   on_attach = on_attach
}

-- the vimls vimlang language server
lspconfig.vimls.setup{
   on_attach = on_attach
}

-- the sumneko_lua lua language server
lspconfig.sumneko_lua.setup{
   on_attach = on_attach
}
