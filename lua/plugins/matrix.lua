return  {
  'iruzo/matrix-nvim',
   enabled = false,
   config = function()
      -- Enable the matrix colorscheme
      vim.cmd[[colorscheme matrix]]

      -- Optional: Additional configurations
      vim.g.matrix_contrast = true              -- Make sidebars and popups have a different background
      vim.g.matrix_borders = true               -- Enable borders between vertical splits
      vim.g.matrix_disable_background = false   -- Use Neovim background color
      vim.g.matrix_cursorline_transparent = true -- Transparent cursorline
      vim.g.matrix_italic = false               -- Disable italics if you don't like them
    end
  }
