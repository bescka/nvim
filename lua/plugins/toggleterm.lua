return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")

        toggleterm.setup {
            size = 10,
            -- open_mapping = [[<c-\>]],
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            direction = 'horizontal',
            close_on_exit = true,
            autochdir = true,
            shell = vim.o.shell,
            float_opts = {
                border = 'curved',
                width = 120,
                height = 30,
                winblend = 3,
            },
        }

    end,
}

