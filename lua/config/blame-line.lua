
require("blame_line").setup{
	show_in_insert = false,
	template = "<author> | <author-time> | <summary>",
	date = {
			relative = true,
	},
	hl_group = "BlameLineNvim",
	delay = 0,
}
