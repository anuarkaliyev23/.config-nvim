local harpoon = require('harpoon')

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():append()
end)

vim.keymap.set("n", "<leader>hu", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>hr", function()
	harpoon:list():remove()
end)

vim.keymap.set("n", "<leader>hc", function()
	harpoon:list():clear()
end)
