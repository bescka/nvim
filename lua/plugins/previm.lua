return {
  'previm/previm',
  config = function()
    vim.g.previm_open_cmd = 'edge'
    vim.g.previm_wsl_mode = 1
    vim.g.previm_disable_default_css = 0
    vim.g.previm_custom_css_path = '~/.config/nvim/lua/custom/plugins/previm.css'
  end,
}
