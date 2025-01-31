return {
    -- nvim-dap: Debug Adapter Protocol support
    { "mfussenegger/nvim-dap" },
    
    -- UI for nvim-dap
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
    
    -- Virtual text for debugging
    { "theHamsta/nvim-dap-virtual-text", dependencies = { "mfussenegger/nvim-dap" } },
}

