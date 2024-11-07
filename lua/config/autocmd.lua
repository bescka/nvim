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

-- -- Create a new augroup for Markdown file type
-- vim.api.nvim_create_augroup('MarkdownUnmap', { clear = true })

-- -- Vimwiki issue with keymappings interferring with window movement
-- vim.api.nvim_exec([[
--   augroup VimwikiOverrideMappings
--     autocmd!
--     autocmd FileType vimwiki nnoremap <buffer> <space>wh <cmd>wincmd h<CR>
--     autocmd FileType vimwiki nnoremap <buffer> <space>whh <cmd>wincmd h<CR>
--     autocmd FileType markdown nnoremap <buffer> <space>wh <cmd>wincmd h<CR>
--     autocmd FileType markdown nnoremap <buffer> <space>whh <cmd>wincmd h<CR>
--   augroup END
-- ]], false)
--
vim.api.nvim_create_autocmd("User", {
  pattern = "ToggleMyPrompt",
  callback = function() require("avante.config").override({system_prompt = "MY CUSTOM SYSTEM PROMPT"}) end,
})

vim.keymap.set("n", "<leader>am", function() vim.api.nvim_exec_autocmds("User", { pattern = "ToggleMyPrompt" }) end, { desc = "avante: toggle my prompt" })

-- open help in full buffer
--
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("help_window_full", { clear = true }),
  pattern = "*.txt",
  callback = function()
    if vim.o.filetype == 'help' then
      vim.cmd.only()
    end
  end
})


-- -- Put this in your init.lua or a Lua configuration file
-- local function change_nvim_tree_dir()
--   local api = require('nvim-tree.api')
--   local cwd = vim.fn.getcwd()
--   api.tree.change_root(cwd)
-- end
--
-- -- Auto-change nvim-tree root directory when switching tabs
-- vim.api.nvim_create_autocmd('TabEnter', {
--   callback = change_nvim_tree_dir,
-- })
--

-- Function to print the current session name
vim.api.nvim_create_user_command('PrintSessionName', function()
    local possession = require('possession.session')
    local current_session = possession.session_name()
    if current_session then
        print('Current session: ' .. current_session)
    else
        print('No session is currently loaded.')
    end
end, {})

local terminals = {}  -- Table to store terminals for each directory


-- Function to get or create a terminal for the current directory
function _G.open_project_terminal()
  local current_dir = vim.fn.getcwd()
  
  if not terminals[current_dir] then
    -- Create a new terminal for the current directory
    local Terminal = require('toggleterm.terminal').Terminal
    terminals[current_dir] = Terminal:new({
      dir = current_dir,
      hidden = true,  -- Do not show the terminal upon creation
    })
  end

  -- Toggle the terminal for the current directory
  terminals[current_dir]:toggle()
end

vim.keymap.set('n', '<C-\\>', ':lua open_project_terminal()<CR>', { noremap = true, silent = true })


-- Function to set terminal colors
local function set_terminal_colors()
    vim.g.terminal_color_0 = "#414868"   -- black
    vim.g.terminal_color_1 = "#F7768E"   -- red
    vim.g.terminal_color_2 = "#73DACA"   -- green
    vim.g.terminal_color_3 = "#E0AF68"   -- yellow
    vim.g.terminal_color_4 = "#7AA2F7"   -- blue
    vim.g.terminal_color_5 = "#BB9AF7"   -- purple
    vim.g.terminal_color_6 = "#73DACA"   -- cyan
    vim.g.terminal_color_7 = "#C0CAF5"   -- white
    vim.g.terminal_color_8 = "#414868"   -- bright black
    vim.g.terminal_color_9 = "#F7768E"   -- bright red
    vim.g.terminal_color_10 = "#73DACA"  -- bright green
    vim.g.terminal_color_11 = "#E0AF68"  -- bright yellow
    vim.g.terminal_color_12 = "#7AA2F7"  -- bright blue
    vim.g.terminal_color_13 = "#BB9AF7"  -- bright purple
    vim.g.terminal_color_14 = "#73DACA"  -- bright cyan
    vim.g.terminal_color_15 = "#C0CAF5"  -- bright white
end

-- Apply terminal colors on TermOpen
vim.api.nvim_create_autocmd('TermOpen', {
    pattern = 'term://*',
    callback = function()
        set_terminal_colors()
    end,
})
--
--
-- command! Lynx call system('lynx ' . input('URL: '))
--
-- command! ELinks call system('elinks ' . input('URL: '))
--
local function run_browser(browser)
    local url = vim.fn.input("URL: ")
    os.execute(browser .. " " .. url)
end

-- Create a command for Lynx
vim.api.nvim_create_user_command("Lynx", function()
    run_browser("lynx")
end, {})

-- Create a command for ELinks
vim.api.nvim_create_user_command("ELinks", function()
    run_browser("elinks")
end, {})
