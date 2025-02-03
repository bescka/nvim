require("config.vimopt")
require("config.lazy")
require("config.keymaps")
require("config.autocmd")
require("config.fn")
require("config.debug")

-- Disable swap files
vim.opt.swapfile = false

-- Enable automatic file reload on external changes
vim.opt.autoread = true

-- Auto-check for file changes when focus is gained or buffers are entered
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
    callback = function()
        vim.cmd("checktime")  -- Check for external changes to the file
    end,
})


vim.opt.mousescroll = { "ver:4", "hor:2" }

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- config for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

-- gui colours 
vim.opt.termguicolors = true

-- Define a custom highlight group for the ruler line
vim.cmd([[
  highlight ColorColumn guibg=lightgrey ctermbg=lightgrey
]])

-- For avante.tokenizers and templates to work, make sure to call require('avante_lib').load() somewhere when entering the editor. We will leave the users to decide where it fits to do this, as this varies among configurations. (But we do recommend running this after where you set your colorscheme)
-- require('avante_lib').load()

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

-- -- highlighting for markdown blocks
-- vim.cmd [[
--     highlight markdownCode guibg=#282828 guifg=#dcdcdc ctermbg=235 ctermfg=145
--     highlight markdownCodeBlock guibg=#282828 guifg=#dcdcdc ctermbg=235 ctermfg=145
-- ]]

-- vim.cmd([[highlight RenderMarkdownCode guibg=#A0C4FF ctermbg=lightblue]])
-- vim.cmd([[highlight RenderMarkdownCodeInline guibg=#A0C4FF ctermbg=lightblue]])
vim.cmd([[highlight RenderMarkdownCode guibg=#1C1C1C ctermbg=black]])
vim.cmd([[highlight RenderMarkdownCodeInline guibg=#1C1C1C ctermbg=black]])
