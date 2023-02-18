require('dap-python').setup('~/.virtualenvs/debugpy3.10/bin/python')
table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Full Debug',
  justMyCode = false,
  program = '${file}',
  -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
})
-- setting up tests with pytest for python
require('dap-python').test_runner = 'pytest'
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = true },
      runner = "pytest"
    })}
})
