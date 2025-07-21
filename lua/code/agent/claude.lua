local M = require("claude-code")
local wk = require("which-key")
M.setup({
	window = {
		position = "float",
		hide_numbers = false,
		enter_insert = false,
	}
})
wk.add{
	{ "<leader>cc",    "<cmd>ClaudeCode<CR>",           desc = "Toggle claude code" },
}
