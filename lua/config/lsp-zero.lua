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
	'hls',
})
-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup{
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim', 'hs' }
			},
			workspace = {
				library = {
					['/Applications/Hammerspoon.app/Contents/Resources/extensions/hs'] = true,
					['/Users/dusaliyev/.hammerspoon/Spoons/EmmyLua.spoon/annotations'] = true,
				},
				checkThirdParty = false,
			},
		},
	}
}

lspconfig.pylsp.setup{
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
