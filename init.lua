require("config.lazy")

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Tab Settings
-- tabs are spaces
vim.opt.expandtab = true
-- insert two spaces on tab
vim.opt.shiftwidth = 2
-- number of spaces a tab counts for
vim.opt.tabstop = 2
-- copy indent from current line when starting a new line
-- vim.opt.autoindent = true
-- do smart auto indenting when starting a new line
vim.opt.smartindent = true
-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
--
-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Create a new augroup for Markdown file type
vim.api.nvim_create_augroup('MarkdownUnmap', { clear = true })

vim.api.nvim_set_keymap('n', '<leader>tpc', ':!typst compile %<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tpv', ':!zathura %:r.pdf &<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader')

-- Create an autocommand for the FileType event for markdown files
-- vim.api.nvim_create_autocmd('FileType', {
--   group = 'MarkdownUnmap',
--   pattern = 'markdown',
--   callback = function()
--     -- Get the list of normal mode keymaps for the current buffer
--     local keymaps = vim.api.nvim_buf_get_keymap(0, 'n')
--     for _, keymap in ipairs(keymaps) do
--       if keymap.lhs == '<Leader>whh' then
--         vim.keymap.del('n', '<Leader>whh', { buffer = 0 })
--         break
--       end
--     end
--   end
-- })
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
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

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
-- Changed to leader
--  See `:help wincmd` for a list of all window commands
vim.api.nvim_set_keymap('n', '<leader>wh', '', { noremap = true, silent = true })
vim.api.nvim_exec([[
  augroup VimwikiOverrideMappings
    autocmd!
    autocmd FileType vimwiki nnoremap <buffer> <space>wh <cmd>wincmd h<CR>
    autocmd FileType vimwiki nnoremap <buffer> <space>whh <cmd>wincmd h<CR>
    autocmd FileType markdown nnoremap <buffer> <space>wh <cmd>wincmd h<CR>
    autocmd FileType markdown nnoremap <buffer> <space>whh <cmd>wincmd h<CR>
  augroup END
]], false)
vim.keymap.set('n', '<leader>wh', '<C-w><C-h>', { noremap = true, silent = true, desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>wl', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>wj', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>wk', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Map <Leader>e to equalize all window splits
vim.api.nvim_set_keymap('n', '<Leader>we', ':wincmd =<CR>', {noremap = true, silent = true })
-- Enable 24-bit RGB color in the terminal
vim.opt.termguicolors = true

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


vim.g.vimtex_view_general_viewer = 'SumatraPDF'
vim.g.vimtex_view_general_viewer = "C:\\Users\\ben-c\\AppData\\Local\\SumatraPDF.exe"


vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- define browser to use for markdown
vim.g.mkdp_browser = 'edge'
-- vim.g.markdown_folding = true
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
-- -- Luasnip snips
-- local ls = require("luasnip")
--
-- require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})
-- ls.config.set_config {
--   -- be able to jump back into the last snipped
--   history = true,
--   updateevents = "TextChanged, TextChangedI",
--   enable_autosnippets = true,
-- }
-- vim.keymap.set({"i"}, "<c-k>", function() ls.expand() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<c-k>", function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<c-j>", function() ls.jump(-1) end, {silent = true})
--
-- vim.keymap.set({"i", "s"}, "<c-l>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, {silent = true})
--
vim.keymap.set("n", "<leader><leader>h", "<cmd>source ~/.config/nvim/LuaSnip/html.lua<CR>")
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/LuaSnip/all.lua<CR>")


-- Define a custom highlight group for the ruler line
vim.cmd([[
  highlight ColorColumn guibg=lightgrey ctermbg=lightgrey
]])

-- require('luasnip.loaders.from_vscode').load({ paths = {"./LuaSnip"}})
-- Set colorcolumn to 80 for the ruler line

require('luasnip.loaders.from_vscode').load({paths = "~/.config/nvim/LuaSnip"})
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip" })

-- Disable <leader>whh mapping
-- vim.api.nvim_del_keymap('n', '<leader>whh')

require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-\>]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    width = 120,
    height = 30,
    winblend = 3,
  }
}





