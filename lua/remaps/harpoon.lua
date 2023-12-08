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

vim.keymap.set("n", "<leader>hq", function()
	harpoon:list():select(1)
end)

vim.keymap.set("n", "<leader>hw", function()
	harpoon:list():select(2)
end)

vim.keymap.set("n", "<leader>he", function()
	harpoon:list():select(3)
end)

vim.keymap.set("n", "<leader>hr", function()
	harpoon:list():select(4)
end)
