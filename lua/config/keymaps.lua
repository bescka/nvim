-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`


vim.api.nvim_set_keymap('n', '<leader>tpc', ':!typst compile %<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tpv', ':!zathura %:r.pdf &<CR>', { noremap = true, silent = true })

vim.g.user_emmet_leader_key = '<C-e>' -- Set a leader key for emmet expansionsl
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>f', '<cmd>Ex<cr>')


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>l', vim.diagnostic.hide, { desc = 'Hide [l]inting messages'})

-- ToggleTerm Keymaps

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Visual Mode Keymaps
-- On windows, avoid issues with <C-v>

vim.keymap.set('n', '<leader>ms', '<C-v>', { desc = '[S]elect [M]ultiple' })
vim.keymap.set('v', '<leader>ms', '<C-v>', { desc = '[S]elect [M]ultiple' })
vim.keymap.set('x', '<leader>ms', '<C-v>', { desc = '[S]elect [M]ultiple' })

-- fixes return to visual mode after re-indenting
vim.api.nvim_set_keymap('v', '>', '>gv', {})
vim.api.nvim_set_keymap('v', '<', '<gv', {})

-- Terminal keymaps
-- vim.api.nvim_set_keymap('n', '<Leader>ot', ':botright 10sp term://bash<CR>', { desc = '[O]pen [T]erminal' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')


-- NAVIGATION keymaps
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
-- Changed to leader
--  See `:help wincmd` for a list of all window commands
vim.api.nvim_set_keymap('n', '<leader>wh', '', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wh', '<C-w><C-h>', { noremap = true, silent = true, desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>wl', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>wj', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>wk', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Map <Leader>e to equalize all window splits
vim.api.nvim_set_keymap('n', '<Leader>we', ':wincmd =<CR>', {noremap = true, silent = true })

-- Marks
vim.keymap.set('n', 'md', function()
  -- Prompt the user for the mark they want to delete
  local mark = vim.fn.input("Delete mark: ")
  -- Execute the delete mark command for the given mark
  vim.cmd('delm ' .. mark)
end, { noremap = true, silent = true })
