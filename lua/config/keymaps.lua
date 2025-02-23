-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set("n", "<leader>at", "<Cmd>AvanteChat<CR>", {desc = "[A]vante [T]alk (Chat)"})

vim.api.nvim_set_keymap("n", "<leader>tpc", ":!typst compile %<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tpv", ":!zathura %:r.pdf &<CR>", { noremap = true, silent = true })

vim.g.user_emmet_leader_key = "<C-e>" -- Set a leader key for emmet expansionsl
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- netrw is currently disabled for nvim-tree
-- vim.keymap.set('n', '<leader>f', '<cmd>Ex<cr>')

vim.keymap.set("n", "<leader>z", "<Cmd>ZenMode<CR>", {desc = "Toggle [Z]enMode"})

-- backspace and ctrl 
vim.api.nvim_set_keymap("n", "<C-BS>", "i<C-BS>", { noremap = true, silent = true })
--
-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>cl", vim.diagnostic.hide, { desc = "Hide [l]inting messages" })

-- ToggleTerm Keymaps

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end


vim.keymap.set("n", "<leader>w]", "<Cmd>vertical wincmd ]<CR>", { noremap = true, silent = true })

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Visual Mode Keymaps
-- On windows, avoid issues with <C-v>

vim.keymap.set("n", "<leader>ms", "<C-v>", { desc = "[S]elect [M]ultiple" })
vim.keymap.set("v", "<leader>ms", "<C-v>", { desc = "[S]elect [M]ultiple" })
vim.keymap.set("x", "<leader>ms", "<C-v>", { desc = "[S]elect [M]ultiple" })

-- fixes return to visual mode after re-indenting
vim.api.nvim_set_keymap("v", ">", ">gv", {})
vim.api.nvim_set_keymap("v", "<", "<gv", {})

-- Terminal keymaps
-- vim.api.nvim_set_keymap('n', '<Leader>ot', ':botright 10sp term://bash<CR>', { desc = '[O]pen [T]erminal' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

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
vim.api.nvim_set_keymap("n", "<leader>wh", "", { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<leader>wh",
	"<C-w><C-h>",
	{ noremap = true, silent = true, desc = "Move focus to the left window" }
)
vim.keymap.set("n", "<leader>wl", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<leader>wj", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<leader>wk", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- Map <Leader>e to equalize all window splits
vim.api.nvim_set_keymap("n", "<Leader>we", ":wincmd =<CR>", { noremap = true, silent = true })

-- Marks
vim.keymap.set("n", "md", function()
    -- Prompt the user for the mark they want to delete
    local mark = vim.fn.input("Delete mark: ")

    -- Check if the input is valid
    if mark:match("^[a-zA-Z0-9']$") then
        vim.cmd("delmarks " .. mark)
        print("Deleted mark: " .. mark)
    else
        print("Invalid mark. Use a-z, A-Z, 0-9, or '")
    end
end, { noremap = true, silent = true })

-- Nvim-tree
-- vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', { desc = 'Find current file in NvimTree' })
-- vim.keymap.set('n', ';', function()
--   require('nvim-tree.api').tree.open()
-- end, { noremap = true, silent = true, desc = "Open NvimTree" })
--
-- Ensure you have required the necessary modules
local project_nvim = require("project_nvim")
-- local recent_projects = project_nvim.get_recent_projects()

-- -- Print the list of recent projects to inspect (useful for debugging)
-- print(vim.inspect(recent_projects))

-- Key mappings for project-specific actions
local opts = { noremap = true, silent = true }

-- Normal mode mappings
-- vim.keymap.set('n', '<leader>spf', ':lua require("project_nvim").find_project_files()<CR>', opts)
-- vim.keymap.set('n', '<leader>spb', ':lua require("project_nvim").browse_project_files()<CR>', opts)
-- vim.keymap.set('n', '<leader>spd', ':lua require("project_nvim").delete_project()<CR>', opts)
-- vim.keymap.set('n', '<leader>sps', ':lua require("project_nvim").search_in_project_files()<CR>', opts)
-- vim.keymap.set('n', '<leader>spr', ':lua require("project_nvim").recent_project_files()<CR>', opts)
-- vim.keymap.set('n', '<leader>spw', ':lua require("project_nvim").change_working_directory()<CR>', opts)
vim.keymap.set("n", "<leader>spp", ":Telescope projects<CR>", opts)
-- vim.keymap.set('n', '<leader>spf', ':Telescope find_files<CR>', { noremap = true, silent = true, desc = "Find Project Files" })
-- vim.keymap.set('n', '<leader>spb', ':lua require("project_nvim").browse_project_files()<CR>', { noremap = true, silent = true, desc = "Browse Project Files" })
-- vim.keymap.set('n', '<leader>spd', ':lua require("project_nvim").delete_project()<CR>', { noremap = true, silent = true, desc = "Delete Current Project" })
-- vim.keymap.set('n', '<leader>spg', ':Telescope live_grep<CR>', { noremap = true, silent = true, desc = "Search in Project Files" })
-- vim.keymap.set('n', '<leader>spr', ':lua require("telescope").extensions.project.project{}<CR>', { noremap = true, silent = true, desc = "List Recent Projects" })
-- vim.keymap.set('n', '<leader>spc', ':lua require("project_nvim").change_working_directory()<CR>', { noremap = true, silent = true, desc = "Change Project Working Directory" })

local function select_recent_project()
	local recent_projects = project_nvim.get_recent_projects()
	-- Use vim.ui.select to create a simple selection menu
	vim.ui.select(recent_projects, { prompt = "Select a recent project:" }, function(selected)
		if selected then
			-- Change to the selected project's directory
			vim.cmd("cd " .. selected)
			print("Changed working directory to " .. selected)
		end
	end)
end

vim.keymap.set(
	"n",
	"<leader>spl",
	select_recent_project,
	{ noremap = true, silent = true, desc = "List and Select Recent Projects" }
)

-- Normal mode keymap to open the file browser
vim.keymap.set("n", "<leader>so", ":Telescope file_browser<CR>", opts)
