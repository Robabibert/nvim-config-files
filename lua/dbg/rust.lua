require('dap').defaults.rust.exception_breakpoints = {"rust_panic","cpp_throw","cpp_caught"}

local extension_path = os.getenv("HOME") .. '/.local/bin/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'


require"dap".adapters.lldb = {
  type = 'executable',
  command = codelldb_path , -- adjust as needed, must be absolute path
  name = 'lldb'
}
require"dap".configurations.rust = {
  {
    name = "Launch current file",
    type = "lldb",
    request = "launch",
    program = vim.fn.expand('%'),
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
}


