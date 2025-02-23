return {
  -- Make sure to set this up properly if you have lazy=true
  'MeanderingProgrammer/render-markdown.nvim',
  opts = {
    file_types = { "Avante" }, --"markdown"
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim', 'nvim-tree/nvim-web-devicons'}, -- if you use the mini.nvim suite
  ft = { "Avante" }, ---"markdown"
}
