local neotest = require("neotest")

neotest.setup({
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
			args = {"--log-level", "DEBUG"},
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


require("neodev").setup({
	library = { plugins = { "neotest" }, types = true },
})
