-- telescope extensions
require('telescope').load_extension('yaml_schema')
require('telescope').load_extension("ui-select")


local telescope = require('telescope.builtin')
local wk = require("which-key")

wk.add({
	{"<leader>ff", telescope.find_files, desc="Find files", mode="n"},
	{"<leader>gs", telescope.grep_string, desc="Find string", mode="n"},
	{"<leader>km", telescope.keymaps, desc="Find keymaps", mode="n"},
	{"<leader>fu", telescope.lsp_references, desc="Find usage", mode="n"},
	{"<leader>fi", telescope.lsp_implementations, desc="Find implementations", mode="n"},
	{"<leader>gf", telescope.git_files, desc="Find among git files", mode="n"},
	{"<leader>gc", telescope.git_commits, desc="Find among git commits", mode="n"},
	{"<leader>ts", telescope.treesitter, desc="Find among treesitter", mode="n"},
	{"<leader>bf", telescope.buffers, desc="Find among buffers", mode="n"},
})
