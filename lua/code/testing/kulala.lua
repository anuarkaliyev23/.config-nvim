local kulala = require("kulala")
local wk = require("which-key")

kulala.setup({
	-- Set to false because we are configuring global keymaps manually via which-key
	global_keymaps = false,
})

wk.add({
	{ "<leader>k",  group = "HTTP Client (Kulala)" },
	{ "<leader>ks", kulala.run,                    desc = "Send request",         mode = { "n", "v" } },
	{ "<leader>ka", kulala.run_all,                desc = "Send all requests",    mode = "n" },
	{ "<leader>kr", kulala.replay,                 desc = "Replay last request",  mode = "n" },
	{ "<leader>kn", kulala.scratchpad,             desc = "Open scratchpad",      mode = "n" },
	{ "<leader>ku", kulala.toggle_view,            desc = "Toggle Kulala UI",     mode = "n" },
	{ "<leader>kc", kulala.copy,                   desc = "Copy request as cURL", mode = "n" },
	{ "<leader>ki", kulala.inspect,                desc = "Inspect request",      mode = "n" },
})
