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
	'pylsp',
	'jedi_language_server',
	'lemminx',
	'gopls',
})
-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

local lspconfig = require('lspconfig')
lspconfig.pylsp.setup{
	settings = {
		pylsp = {
			plugins = {
				jedi_completion = {
					enabled = true,
					include_class_objects = true,
					include_function_objects = true,
					fuzzy = true,
				},
				rope_autoimport = {
					enabled = true,
				},
				rope_completion = {
					enabled = true,
				}
			}
		}
	}
}
