-- lsp-zero config
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- Install these servers
lsp.ensure_installed({
	'tsserver',
	'eslint',
	'bashls',
	'marksman',
	'dockerls',
	'yamlls',
	'pyright',
	'lemminx',
	'gopls',
})
-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

