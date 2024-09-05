require("config.lazy")
require("config.keymaps")
require("config.autocmd")
require("config.vimopt")


-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- vimwiki
-- this command should only recognise .md files as vimwiki if they are in a vimwiki dir
vim.g.vimwiki_global_ext = 0

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

-- re-sourcing commands for snips
vim.keymap.set("n", "<leader><leader>h", "<cmd>source ~/.config/nvim/LuaSnip/html.lua<CR>")
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/LuaSnip/all.lua<CR>")
vim.keymap.set("n", "<leader><leader>w", "<cmd>source ~/.config/nvim/LuaSnip/vimwiki.lua<CR>")

-- Define a custom highlight group for the ruler line
vim.cmd([[
  highlight ColorColumn guibg=lightgrey ctermbg=lightgrey
]])



-- LUASNIP/ completion
-- Ensure Neovim recognizes .tsx and .jsx files as the correct filetype
-- vim.cmd([[
--   autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
--   autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
-- ]])

require('luasnip.loaders.from_vscode').load({paths = "~/.config/nvim/LuaSnip"})
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip" })

require'luasnip'.filetype_extend("typescriptreact", { "html" })
-- Autocommand for react
-- vim.cmd([[
--   augroup LuaSnipForHTMLReact
--     autocmd!
--     autocmd FileType html,typescriptreact,javascriptreact lua require('luasnip.loaders.from_lua').load({ paths = "~/.config/nvim/LuaSnip" })
--   augroup END
-- ]])




