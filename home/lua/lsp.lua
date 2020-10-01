--enable completion and  nvim_lsp
local completion = require('completion')
local nvim_lsp = require('nvim_lsp')

--always start the lsp
local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)
end

--the go language server
nvim_lsp.gopls.setup{
	on_attach = on_attach
}
