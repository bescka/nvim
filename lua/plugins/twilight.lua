return {
  "folke/twilight.nvim",
  config = function()
    require("twilight").setup({
      dimming = {
        alpha = 0.25, -- Amount of dimming (0 = full dark, 1 = no dim)
      },
      context = 10, -- Number of visible lines above/below the cursor
    })
  end,
}
