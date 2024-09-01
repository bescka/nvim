return {
    'mattn/emmet-vim',
    config = function()
      vim.g.user_emmet_settings = {
        typescriptreact = {
            extends = 'jsx',
        },
      }
      -- Optionally, set a keybinding for Emmet expand
      vim.api.nvim_set_keymap('i', '<C-y>,', '<Plug>(emmet-expand-abbr)', {})
    end,
    }