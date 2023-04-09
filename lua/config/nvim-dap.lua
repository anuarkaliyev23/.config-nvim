-- register dedicated venv for debugpy
require('dap-python').setup('~/.pyenv/shims/python')
require('dap-python').test_runner = 'pytest'
require('dap-go').setup()

