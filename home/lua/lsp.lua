--enable lspconfig
local lspconfig = require('lspconfig')

--the ccls c language server
--lspconfig.ccls.setup{
--   on_attach = on_attach;
--}

--the clangd c language server
lspconfig.clangd.setup{
   on_attach = on_attach;
}

--the go language server
lspconfig.gopls.setup{
   on_attach = on_attach
}
