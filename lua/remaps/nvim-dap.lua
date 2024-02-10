local dap = require("dap")
local dap_go = require("dap-go")

-- breakpoint
vim.keymap.set("n", '<leader>b', function ()
	dap.toggle_breakpoint()
end)

-- IDE emulation
vim.keymap.set("n", '<F5>', function ()
	dap.continue()
end)

vim.keymap.set("n", '<F7>', function ()
	dap.step_over()
end)

vim.keymap.set("n", '<F8>', function ()
	dap.step_into()
end)

vim.keymap.set("n", '<F9>', function ()
	dap.step_out()
end)

vim.keymap.set("n", '<F12>', function ()
	dap.terminate()
end)

-- debug run
vim.keymap.set("n", '<leander>dr', function ()
	dap.repl.open()
end)

vim.keymap.set("n", "<leader>gtd", function ()
	dap_go.debug_test()
end)
