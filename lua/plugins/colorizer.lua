return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({
      'css',
      'javascript',
      'html',
      'lua'
    }, {
      mode = 'background'
    })
  end
}
