local completion = require('completion')
local nvim_lsp = require('nvim_lsp')

local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)
end

nvim_lsp.gopls.setup{
	on_attach = on_attach
}
