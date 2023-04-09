neotest = require("neotest")

-- test run
vim.keymap.set("n", "<leader>tr", function ()
	neotest.run.run()
end)

-- test file
vim.keymap.set("n", "<leader>tf", function ()
	neotest.run.run(vim.fn.expand("%"))
end)

-- test dap
vim.keymap.set("n", "<leader>td", function ()
	neotest.run.run({strategy = "dap"})
end)

-- test stop
vim.keymap.set("n", "<leader>ts", function ()
	neotest.run.stop()
end)

-- test attach
vim.keymap.set("n", "<leader>ta", function ()
	neotest.run.attach()
end)


