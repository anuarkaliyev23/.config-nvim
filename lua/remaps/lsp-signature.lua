local lsp_signaure = require("lsp_signature")

vim.keymap.set("n", "<leader>sg", function ()
	lsp_signaure.toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

