return {
  'mattn/emmet-vim',
  ft = { 'html', 'javascriptreact', 'typescriptreact' }, -- Enable for relevant filetypes
  config = function()
    -- Enable Emmet in insert mode
    vim.g.user_emmet_mode = 'i'

    -- Map <C-e> to expand Emmet abbreviations in insert mode
    vim.api.nvim_set_keymap('i', '<C-e>', '<Plug>(emmet-expand-abbr)', {})
    end,
}

