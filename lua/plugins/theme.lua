-- { -- You can easily change to a different colorscheme.
  --   -- Change the name of the colorscheme plugin below, and then
  --   -- change the command in the config to whatever the name of that colorscheme is.
  --   --
  --   -- If you want to see what colorschemes are already installed, you can use :Telescope colorscheme.
-- return {
--     'folke/tokyonight.nvim',
--     enabled = true,
--     priority = 1000, -- Make sure to load this before all the other start plugins.
--     init = function()
--       -- Load the colorscheme here.
--       -- Like many other themes, this one has different styles, and you could load
--       -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--       vim.cmd.colorscheme 'tokyonight-night'
--
--       -- You can configure highlights by doing something like:
      -- vim.cmd.hi 'Comment gui=none'

return {
  -- Tokyonight color scheme
  {
    'folke/tokyonight.nvim',
    enabled = true,
    priority = 1000,  -- Ensure it's loaded before other plugins
    init = function()
      -- Set Tokyonight color scheme
      -- vim.cmd.colorscheme 'tokyonight-night'
      
      -- Customize highlights for this theme
      vim.cmd.hi 'Comment gui=none'

      -- Set terminal colors
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
  },
  {
    "Zeioth/neon.nvim",
    opts = {
      dim_inactive = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    }
  },
  -- Cyberdream
  {
      "scottmckendry/cyberdream.nvim",
      lazy = false,
      --Apply the theme
      -- vim.cmd 'colorscheme cyberdream'
      -- priority = 1000,
  },

  -- Nightfox color scheme
  {
    'EdenEast/nightfox.nvim',

    config = function()
      require('nightfox').setup {
        options = {
          transparent = true,  -- Handle transparency manually
          terminal_colors = true,  -- Set terminal colors
        },
      }

      -- Apply the theme
      -- vim.cmd 'colorscheme nordfox'

      -- Apply transparency settings
      vim.cmd 'highlight NonText guibg=none ctermbg=none'
      vim.cmd 'highlight NvimTreeNormal guibg=NONE ctermbg=NONE'
      vim.cmd 'highlight Normal guibg=NONE ctermbg=NONE'
      vim.cmd 'highlight NormalNC guibg=NONE ctermbg=NONE'
      vim.cmd 'highlight EndOfBuffer guibg=NONE ctermbg=NONE'
    end,
  },
}

