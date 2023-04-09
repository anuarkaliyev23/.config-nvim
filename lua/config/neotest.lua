require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-plenary"),
	require("neotest-go"),
  },
})

require("neodev").setup({
  library = { plugins = { "neotest" }, types = true },
})
