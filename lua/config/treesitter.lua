-- run function for automatic updates
local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
ts_update()


-- config
require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = { 
		"bash",
		"c", 
		"lua", 
		"rust",
		"cmake",
		"dockerfile",
		"go",
		"java",
		"javascript",
		"json",
		"http",
		"kotlin",
		"latex",
		"markdown",
		"markdown_inline",
		"python",
		"sql",
		"toml",
		"vim",
		"yaml",
		 "xml",
		 "graphql"
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	}
}
