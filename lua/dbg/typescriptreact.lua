
local dap=require"dap"
--todo define adapter
dap.configurations.typescriptreact={
    {
        type = "chrome",
        request = "attach",
        -- program = "${file}/src/index.js",
        -- cwd = vim.fn.getcwd(),
        -- sourceMaps = true,
        -- protocol = "inspector",
        port = 3000,
        webRoot = "${workspaceFolder}/src",
        url = "http://localhost:3000",
    }
}

