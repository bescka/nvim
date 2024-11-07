return {
    'TimUntersberger/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    config = function()
      require('neogit').setup({
        integrations = {
          diffview = true  -- Integrate with diffview.nvim
        }
      })
      vim.keymap.set('n', '<leader>g', vim.cmd.Neogit, { desc = 'neogit'})
    end
  }
