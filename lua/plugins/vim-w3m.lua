return {
        "yuratomo/w3m.vim",
        enabled = false,
        config = function()
            -- Optional: Key mappings for vim-w3m
            vim.api.nvim_set_keymap('n', '<Leader>ob', ':W3M<CR>', { noremap = true, silent = true })
        end,
    }
