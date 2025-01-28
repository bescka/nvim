return {
  'numToStr/Comment.nvim',
  opts = {},  -- Use `opts = {}` to force a plugin to be loaded.
  config = function()
    require('Comment').setup({
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    })
  end
}

