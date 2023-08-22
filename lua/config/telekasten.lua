local home = vim.fn.expand("~/zettelkasten")
local daily = home .. '/' .. 'daily'
local weeklies = home .. '/' .. 'weekly'
local templates = home .. '/' .. 'templates'

local template_daily = templates .. '/' .. 'daily'


require('telekasten').setup({
	home = home,
	take_over_my_home = true,
	auto_set_filetype = true,

	dailies = daily,
	weeklies = weeklies,
	templates = templates,

	img_subdir = 'img',
	extension = '.md',

	follow_creates_nonexisting = true,
	dailies_create_nonexisting = true,
	weeklies_create_nonexisting = true,

	image_link_style = "markdown",
	tag_notation = "#tag",

	subdirs_in_links = true,

	template_handling = "smart",
	new_note_location = "smart",


	template_new_daily = template_daily,

	plug_into_calendar = true,
	command_palette_theme = 'dropdown',

	vault = {
		personal = {
			home = home .. '/' .. 'vaults' .. '/' .. 'personal'
		}
	}
})
