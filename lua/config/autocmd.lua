-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Create a new augroup for Markdown file type
vim.api.nvim_create_augroup('MarkdownUnmap', { clear = true })

-- Vimwiki issue with keymappings interferring with window movement
vim.api.nvim_exec([[
  augroup VimwikiOverrideMappings
    autocmd!
    autocmd FileType vimwiki nnoremap <buffer> <space>wh <cmd>wincmd h<CR>
    autocmd FileType vimwiki nnoremap <buffer> <space>whh <cmd>wincmd h<CR>
    autocmd FileType markdown nnoremap <buffer> <space>wh <cmd>wincmd h<CR>
    autocmd FileType markdown nnoremap <buffer> <space>whh <cmd>wincmd h<CR>
  augroup END
]], false)

