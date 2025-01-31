local dap = require("dap")
local dapui = require("dapui")

-- LLDB Adapter configuration
dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode", -- Path to lldb-vscode
    name = "lldb"
}

-- Configuration for C++ debugging
dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb", -- Use the LLDB adapter
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}

-- Use the same configuration for C
dap.configurations.c = dap.configurations.cpp

-- UI Setup
dapui.setup()

-- Automatically open/close UI on debugger events
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end


-- Keybindings
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>B", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Set Conditional Breakpoint" })
vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Open Debug REPL" })
vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "Run Last Debug Session" })

