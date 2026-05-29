local wk = require("which-key")

wk.add({
	{ "s",  "<Plug>(leap-forward)",     desc = "Leap forward",     mode = { "n", "x", "o" } },
	{ "S",  "<Plug>(leap-backward)",    desc = "Leap backward",    mode = { "n", "x", "o" } },
	{ "gs", "<Plug>(leap-from-window)", desc = "Leap from window", mode = { "n", "x", "o" } },
})
