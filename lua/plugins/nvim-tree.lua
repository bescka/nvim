return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.keymap.set('n', '<leader>;', ':NvimTreeToggle<CR>', { desc = 'NvimTreeToggle', silent = true })
    --
    vim.keymap.set('n', '<H>', ':lua require("nvim-tree.api").tree.toggle_hidden_filter()<CR>', { desc = 'Toggle Hidden Files', silent = true })
    vim.keymap.set('n', '<;>', function() 
      require('nvim-tree.api').tree.open({path = vim.fn.getcwd})
    end, { desc = 'NvimTreeOpen at CWD', silent = true})

    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
      git = {
        enable = true,
        ignore = false,
      }
    })
  end,
}
