return {
    "sainnhe/gruvbox-material",
    enabled = false,
    config = function()
      -- Set a darker background for gruvbox-material
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_palette = 'original'

      -- Apply the gruvbox-material theme
      vim.cmd("colorscheme gruvbox-material")

      -- Override colors to get the Matrix look
      vim.api.nvim_set_hl(0, "Normal", { bg = "#0D0208", fg = "#00FF41" })   -- Background and foreground
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#003B00" })               -- Darker green cursor line
      vim.api.nvim_set_hl(0, "Comment", { fg = "#00FF41", italic = true })   -- Matrix green for comments
      vim.api.nvim_set_hl(0, "String", { fg = "#00FF41" })                   -- Green for strings
      vim.api.nvim_set_hl(0, "Function", { fg = "#00FF41", bold = true })    -- Green for functions
      vim.api.nvim_set_hl(0, "Keyword", { fg = "#00FF41", bold = true })     -- Green for keywords
      vim.api.nvim_set_hl(0, "Type", { fg = "#00FF41" })                     -- Green for types
      vim.api.nvim_set_hl(0, "Constant", { fg = "#00FF41" })                 -- Green for constants
      vim.api.nvim_set_hl(0, "Operator", { fg = "#00FF41" })                 -- Green for operators
    end
}
