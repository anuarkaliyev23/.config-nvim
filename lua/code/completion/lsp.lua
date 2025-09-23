local lsp_config = require("lspconfig")
local cmp = require("cmp")
local wk = require("which-key")

local enabled_servers = {
	"gopls",
	-- "golangci_lint_ls",
	"jdtls",
	"lua_ls",
	"dockerls",
	"yamlls",
	"sqlls",
	"marksman",
	"pylsp"
}
-- LSP configuration

lsp_config.lua_ls.setup {
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT'
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				}
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
				-- library = vim.api.nvim_get_runtime_file("", true)
			}
		})
	end,

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

lsp_config.pylsp.setup {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
	settings = {
		pylsp = {
			plugins = {
				-- Formatting
				black = {
					enabled = true,
					line_length = 79,
					cache_config = false
				},
				-- Linting
				ruff = {
					enabled = true,
					format_enabled = false,
					lineLength = 79,
					preview = true,
					unsafeFixes = true,
					select = {
						"E", -- pycodestyle errors
						"F", -- Pyflakes
						"W", -- pycodestyle warnings
						"C90", -- mccabe complexity
						"I", -- isort
						"N", -- pep8-naming
						"UP", -- pyupgrade
						"YTT", -- flake8-2020
						"ANN", -- flake8-annotations
						"S", -- bandit
						"BLE", -- flake8-blind-except
						"FBT", -- flake8-boolean-trap
						"B", -- flake8-bugbear
						"A", -- flake8-builtins
						"COM", -- flake8-commas
						"C4", -- flake8-comprehensions
						"DTZ", -- flake8-datetimez
						"T10", -- flake8-debugger
						"DJ", -- flake8-django
						"EM", -- flake8-errmsg
						"EXE", -- flake8-executable
						"ISC", -- flake8-implicit-str-concat
						"ICN", -- flake8-import-conventions
						"G", -- flake8-logging-format
						"INP", -- flake8-no-pep420
						"PIE", -- flake8-pie
						"T20", -- flake8-print
						"PYI", -- flake8-pyi
						"PT", -- flake8-pytest-style
						"Q", -- flake8-quotes
						"RSE", -- flake8-raise
						"RET", -- flake8-return
						"SLF", -- flake8-self
						"SIM", -- flake8-simplify
						"TID", -- flake8-tidy-imports
						"TCH", -- flake8-type-checking
						"INT", -- flake8-gettext
						"ARG", -- flake8-unused-arguments
						"PTH", -- flake8-use-pathlib
						"TD", -- flake8-todos
						"FIX", -- flake8-fixme
						"ERA", -- eradicate
						"PD", -- pandas-vet
						"PGH", -- pygrep-hooks
						"PL", -- Pylint
						"TRY", -- tryceratops
						"FLY", -- flynt
						"NPY", -- NumPy-specific rules
						"AIR", -- Airflow
						"PERF", -- Perflint
						"FURB", -- refurb
						"LOG", -- flake8-logging
						"RUF", -- Ruff-specific rules
					}
				},
				pycodestyle = {
					enabled = false
				},
				-- Code completion and imports
				rope_autoimport = {
					enabled = true,
					memory = true
				},
				rope_completion = {
					enabled = true,
					eager = true
				},
				jedi_completion = {
					enabled = true,
					fuzzy = true,
					eager = true,
					include_params = true
				},
				jedi_definition = {
					enabled = true,
					follow_imports = true,
					follow_builtin_imports = true
				},
				jedi_hover = {
					enabled = true
				},
				jedi_references = {
					enabled = true
				},
				jedi_signature_help = {
					enabled = true
				},
				jedi_symbols = {
					enabled = true,
					all_scopes = true
				},
				-- Code actions and refactoring
				rope = {
					enabled = true
				},
				-- Workspace symbol search
				pylsp_mypy = {
					enabled = false
				}
			}
		}
	}
}

lsp_config.marksman.setup {}


-- CMP configuration
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},

	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, enabled_lsp_server in pairs(enabled_servers) do
	lsp_config[enabled_lsp_server].setup {
		capabilities = capabilities
	}
end

-- local blackForPythonOrDefault = function()
-- 	if vim.bo.filetype == "python" then
-- 		vim.lsp.buf.format({
-- 			filter = function(client)
-- 				return client.name == "pylsp"
-- 			end,
-- 			async = true,
-- 		})
-- 	else
-- 		vim.lsp.buf.format({ async = true })
-- 	end
-- end


wk.add({
	{ "K",    vim.lsp.buf.hover,           desc = "Hover (LSP)" },
	{ "gd",   vim.lsp.buf.definition,      desc = "Go to definition (LSP)" },
	{ "gD",   vim.lsp.buf.declaration,     desc = "Go to declaration (LSP)" },
	{ "gi",   vim.lsp.buf.implementation,  desc = "Go to implementations (LSP)" },
	{ "go",   vim.lsp.buf.type_definition, desc = "Go to type definition (LSP)" },
	{ "gr",   vim.lsp.buf.references,      desc = "Go to references (LSP)" },
	{ "gs",   vim.lsp.buf.signature_help,  desc = "Go to function signature (LSP)" },
	{ "<F2>", vim.lsp.buf.rename,          desc = "Rename (LSP)" },
	{ "<F3>", vim.lsp.buf.format,          desc = "Format file (LSP)",             mode = { "n", "x" } },
	{ "<F4>", vim.lsp.buf.code_action,     desc = "Show code actions (LSP)" },
})
