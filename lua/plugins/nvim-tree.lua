return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  enabled = false,
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
      --   mappings = {
      --   list = {
      --     { key = "u", action = "refresh" }, -- Refresh nvim-tree to see new changes
      --   },
      -- },
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            modified = true,  -- Ensure modified files are flagged
          },
          glyphs = {
            modified = "[+]",  -- Set modified glyph to match the statusline
          }
        },
      },
      filters = {
        dotfiles = true,
        custom = {'.git', 'node_modules', '.cache'},
      },
      git = {
        enable = true,
        ignore = false,
      },
      diagnostics = {
        enable = true,
      }
    })
  end,
}
