-- register dedicated venv for debugpy
require('dap-python').setup('~/.pyenv/shims/python')
require('dap-python').test_runner = 'pytest'

-- require('dap-go').setup()
require('dap-go').setup {
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

