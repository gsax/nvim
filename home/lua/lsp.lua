--enable completion and  lspconfig
local completion = require('completion')
local lspconfig = require('lspconfig')

--always start the lsp
local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)
end

--the ccls c language server
--lspconfig.ccls.setup{
--  on_attach = on_attach;
--}

--the clangd c language server
lspconfig.clangd.setup{
  on_attach = on_attach;
}

--the go language server
lspconfig.gopls.setup{
	on_attach = on_attach
}
