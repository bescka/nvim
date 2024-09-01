-- --- install without yarn or npm
-- return {
--   'iamcco/markdown-preview.nvim',
--   cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
--   ft = { 'markdown' },
--   build = function()
--     vim.fn['mkdp#util#install']()
--   end,::
-- }

return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && yarn install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
}

-- - return {
--   'iamcco/markdown-preview.nvim',
--   cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
--   build = 'cd app && yarn install',
--   init = function()
--     vim.g.mkdp_filetypes = { 'markdown' }
--     vim.g.mkdp_browser = { 'edge' }
--   end,
--   ft = { 'markdown' },
--   setup = function()
--     vim.cmd 'autocmd! User mkdp_markdown_initialized let g:mkdp_port = "8000"'
--   end,
-- }
