require('move').setup({
	line = {
		enable = true, -- Enables line movement
		indent = true  -- Toggles indentation
	},
	block = {
		enable = true, -- Enables block movement
		indent = true  -- Toggles indentation
	},
	word = {
		enable = true, -- Enables word movement
	},
	char = {
		enable = false -- Enables char movement
	}
})

local wk = require("which-key")


-- Normal-mode commands
wk.add({
	{"<A-j>", ":MoveLine(1)<CR>", desc="Move line down", mode="n"},
	{"<A-k>", ":MoveLine(-1)<CR>", desc="Move line up", mode="n"},

	{"<A-j>", ":MoveBlock(1)<CR>", desc="Move block down", mode="v"},
	{"<A-k>", ":MoveBlock(-1)<CR>", desc="Move block up", mode="v"},
})

