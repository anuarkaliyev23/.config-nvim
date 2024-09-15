local wk = require("which-key")

wk.add({
	{"<leader>gb", vim.cmd.BlameLineToggle, desc = "Show/Hide git blame line"}
})
