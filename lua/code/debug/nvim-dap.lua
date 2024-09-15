local dap = require("dap")
local dap_go = require("dap-go")
local wk = require("which-key")

-- register dedicated venv for debugpy
require('dap-python').setup('~/.pyenv/shims/python')
require('dap-python').test_runner = 'pytest'

-- require('dap-go').setup()
dap_go.setup {
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    path = "dlv",
    initialize_timeout_sec = 20,
    port = "${port}",
    args = {"--check-go-version=false"},
    build_flags = "",
  },
}


wk.add({
	{"<leader>b", dap.toggle_breakpoint, desc="Toggle breakpoint", mode="n"},
	{"<F5>", dap.continue, desc="Debug - Continue", mode="n"},
	{"<F7>", dap.step_over, desc="Debug - Step Over", mode="n"},
	{"<F8>", dap.step_into, desc="Debug - Step Into", mode="n"},
	{"<F9>", dap.step_out, desc="Debug - Step Out", mode="n"},
	{"<F12>", dap.terminate, desc="Debug - Terminate", mode="n"},
	{"<leader>dr", dap.repl.open, desc="Debug - REPL open", mode="n"},
	{"<leader>gtd", dap_go.debug_test, desc="Debug Tests (Go only) ", mode="n"},
})
