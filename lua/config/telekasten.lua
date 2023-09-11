local home = vim.fn.expand("~/zettelkasten")
local template_folder = home .. '/' .. 'templates'

require('telekasten').setup({
	home = home,
	templates = template_folder,

	take_over_my_home = true,
	auto_set_filetype = true,


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

	plug_into_calendar = true,
	command_palette_theme = 'dropdown',

})
