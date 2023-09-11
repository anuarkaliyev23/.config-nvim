local telekasten = require('telekasten')

-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "zk", telekasten.panel, {})

-- Most used functions
vim.keymap.set("n", "zkf", telekasten.find_notes, {})
vim.keymap.set("n", "zk/", telekasten.search_notes, {})
vim.keymap.set("n", "gd", telekasten.follow_link, {})
vim.keymap.set("n", "dg", telekasten.show_backlinks, {})
vim.keymap.set("n", "zkn", telekasten.new_templated_note, {})
vim.keymap.set("n", "zkt", telekasten.show_tags, {})

