local wk = require("which-key")

require('git-conflict').setup {
	default_mappings = false
}

wk.add({
	{"<leader>xo", "<Plug>(git-conflict-ours)", desc="Accept ours - git conflict", mode="n"},
	{"<leader>xt", "<Plug>(git-conflict-theirs)", desc="Accept theirs - git conflict", mode="n"},
	{"<leader>xb", "<Plug>(git-conflict-both)", desc="Accept both - git conflict", mode="n"},
	{"<leader>xN", "<Plug>(git-conflict-prev-conflict)", desc="Go to previous git conflict file", mode="n"},
	{"<leader>xn", "<Plug>(git-conflict-next-conflict)", desc="Go to next git conflict file", mode="n"},
})

