local neotest = require("neotest")
local wk = require("which-key")

neotest.setup({
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
			args = { "--log-level", "DEBUG" },
		}),
		require("neotest-plenary"),
		require("neotest-go")({
			recursive_run = true,
			experimental = {
				test_table = true,
			},
			args = { "-count=1", "-timeout=60s" }
		}),
	},
})



wk.add({
	{ "<leader>tr", neotest.run.run,                                    desc = "Run test",                  mode = "n" },
	{ "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, desc = "Run all tests in file",     mode = "n" },
	{ "<leader>td", function() neotest.run.run({ strategy = "dap" }) end, desc = "Debug test",              mode = "n" },
	{ "<leader>tt", neotest.run.stop,                                   desc = "Stop/Terminate test",                 mode = "n" },
	{ "<leader>ta", neotest.run.attach,                                 desc = "Attach to test",            mode = "n" },
	{ "<leader>tp", neotest.output_panel.toggle,                        desc = "Toggle tests output panel", mode = "n" },
})
