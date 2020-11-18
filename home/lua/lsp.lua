--enable completion and  lspconfig
local completion = require('completion')
local lspconfig = require('lspconfig')

--always start the lsp
local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)
end

--the go language server
lspconfig.gopls.setup{
	on_attach = on_attach
}
