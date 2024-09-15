local harpoon = require("harpoon")
local wk = require("which-key")

harpoon:setup()

wk.add({
	{
		"<leader>ha",
		function ()
			harpoon:list():add()
		end,
		desc = "Bookmark file (harpoon)"
	},


	{
		"<leader>hu",
		function ()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		desc = "Show Bookmarked files (harpoon)"
	},


	{
		"<leader>hr",
		function ()
			harpoon:list():remove()
		end,
		desc = "Remove bookmark from file (harpoon)"
	},


	{
		"<leader>hc",
		function ()
			harpoon:list():clear()
		end,
		desc = "Clear all bookmarks (harpoon)"
	},

	{
		"<leader>hq",
		function ()
			harpoon:list():select(1)
		end,
		desc = "Quick access bookmark 1 (harpoon)"
	},


	{
		"<leader>hw",
		function ()
			harpoon:list():select(2)
		end,
		desc = "Quick access bookmark 2 (harpoon)"
	},


	{
		"<leader>he",
		function ()
			harpoon:list():select(3)
		end,
		desc = "Quick access bookmark 3 (harpoon)"
	},

	{
		"<leader>hr",
		function ()
			harpoon:list():select(4)
		end,
		desc = "Quick access bookmark 4 (harpoon)"
	},

	{
		"<leader>hj",
		function ()
			harpoon:list():next()
		end,
		desc = "Go to next bookmark (harpoon)"
	},


	{
		"<leader>hk",
		function ()
			harpoon:list():prev()
		end,
		desc = "Go to previous bookmark (harpoon)"
	},
})


