return {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('diffview').setup {
      diff_binaries = false,    -- Show diffs for binaries
      use_icons = true,         -- Requires nvim-web-devicons
      enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
      file_panel = {
        listing_style = "tree", -- One of 'list' or 'tree'
        tree_options = {
          flatten_dirs = true,  -- Flatten dirs that only contain one single dir
          folder_statuses = "always", -- One of 'never', 'only_folded' or 'always'.
        },
        win_config = {
          position = "left", -- One of 'left', 'right', 'top', 'bottom'
          width = 35,        -- Only applies when position is 'left' or 'right'
          height = 10,       -- Only applies when position is 'top' or 'bottom'
        },
      },
      file_history_panel = {
        -- These options have been depreciated 202409
        -- log_options = {
        --   max_count = 256,      -- Limit the number of commits
        --   follow = false,       -- Follow renames (only for single file)
        --   all = false,          -- Include all refs under 'refs/' including HEAD
        --   merges = false,       -- List only merge commits
        --   no_merges = false,    -- List no merge commits
        --   reverse = false,      -- List commits in reverse order
        -- },
        win_config = {
          position = "bottom",
          width = 35,
          height = 16,
        },
      },
      default_args = {
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      hooks = {}, -- See ':h diffview-config-hooks'
    }
      vim.api.nvim_set_keymap('n', '<leader>do', ':DiffviewOpen<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>dc', ':DiffviewClose<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>dh', ':DiffviewFileHistory<CR>', { noremap = true, silent = true })
    end
  }