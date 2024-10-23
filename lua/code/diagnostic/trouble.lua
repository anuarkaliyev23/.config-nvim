local trouble = require("trouble")
local wk = require("which-key")


wk.add({
	{
		"<leader>xx",
		function ()
			trouble.toggle("diagnostics")
		end,
		desc="Toggle Diagnostics (Trouble)"
	},
})
