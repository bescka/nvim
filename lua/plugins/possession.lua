return {
    'jedrzejboczar/possession.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('possession').setup({
        autosave = {
          current = true,  -- Automatically save the current session
          tmp = false,     -- Disable temporary session saving
          on_load = true,  -- Autosave on session load
          on_quit = true,  -- Autosave on quitting Neovim
        },
        silent = true,     -- Suppress messages while saving/loading sessions
        session_dir = vim.fn.stdpath('data') .. '/sessions/',  -- Define where to save sessions
      })
    end,
  }

