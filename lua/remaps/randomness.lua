local randomness = require("randomness")

vim.keymap.set('n', '<leader>rii', function ()
	randomness:Integer()
end)

vim.keymap.set('n', '<leader>ria', function ()
	randomness:Integers()
end)

vim.keymap.set('n', '<leader>rsi', function ()
	randomness:String()
end)

vim.keymap.set('n', '<leader>rsa', function ()
	randomness:Strings()
end)


