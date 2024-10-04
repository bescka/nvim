-- { -- You can easily change to a different colorscheme.
  --   -- Change the name of the colorscheme plugin below, and then
  --   -- change the command in the config to whatever the name of that colorscheme is.
  --   --
  --   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
return {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'

      -- Set terminal colors for ToggleTerm
      vim.g.terminal_color_0 = "#1a1b26"
      vim.g.terminal_color_1 = "#f7768e"
      vim.g.terminal_color_2 = "#9ece6a"
      vim.g.terminal_color_3 = "#e0af68"
      vim.g.terminal_color_4 = "#7aa2f7"
      vim.g.terminal_color_5 = "#bb9af7"
      vim.g.terminal_color_6 = "#7dcfff"
      vim.g.terminal_color_7 = "#a9b1d6"
      vim.g.terminal_color_8 = "#414868"
      vim.g.terminal_color_9 = "#f7768e"
      vim.g.terminal_color_10 = "#9ece6a"
      vim.g.terminal_color_11 = "#e0af68"
      vim.g.terminal_color_12 = "#7aa2f7"
      vim.g.terminal_color_13 = "#bb9af7"
      vim.g.terminal_color_14 = "#7dcfff"
      vim.g.terminal_color_15 = "#c0caf5"
    end,
  }
-- return {
--   'sainnhe/everforest',
--   config = function()
--     -- Set options for Everforest
--     vim.g.everforest_background = 'soft'
--     vim.g.everforest_better_performance = 1
--     vim.g.everforest_enable_italic = 1
--     vim.g.everforest_transparent_background = 1
--
--     -- Apply the theme
--     vim.cmd('colorscheme everforest')
--
--     -- Apply transparency settings
--     vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')
--     vim.cmd('highlight NonText guibg=NONE ctermbg=NONE')
--     vim.cmd('highlight NvimTreeNormal guibg=NONE ctermbg=NONE')
--     vim.cmd('highlight NormalNC guibg=NONE ctermbg=NONE')
--     vim.cmd('highlight EndOfBuffer guibg=NONE ctermbg=NONE')
--     -- background
--
--     vim.cmd[[
--       augroup TerminalSettings
--         autocmd!
--         autocmd TermOpen * setlocal winhighlight=Normal:TerminalBackground
--       augroup END
--     ]]
--
--     vim.api.nvim_set_hl(0, "TerminalBackground", { bg = "#1a1a1a" })  -- Replace with your desired color
--
--   end,
-- }
  --   -- 'liuchengxu/space-vim-theme',
  --   'EdenEast/nightfox.nvim',
  --   config = function()
  --     require('nightfox').setup {
  --       options = {
  --         transparent = true, -- We will handle transparency manually
  --         terminal_colors = true, -- Set terminal colors
  --       },
  --     }
  --     -- Apply the theme
  --     vim.cmd 'colorscheme nordfox'
  --     vim.cmd 'highlight NonText guibg=none ctermbg=none'
  --     vim.cmd 'highlight NvimTreeNormal guibg=NONE ctermbg=NONE'
  --     vim.cmd 'highlight Normal guibg=NONE ctermbg=NONE'
  --     vim.cmd 'highlight NormalNC guibg=NONE ctermbg=NONE'
  --     vim.cmd 'highlight EndOfBuffer guibg=NONE ctermbg=NONE'
  --   end,
  -- }
