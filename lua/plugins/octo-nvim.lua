-- return {
--   'pwntester/octo.nvim',
--   requires = {
--     'nvim-lua/plenary.nvim',
--     'nvim-telescope/telescope.nvim',
--     'nvim-tree/nvim-web-devicons',
--     'folke/which-key.nvim',
--   },
--   config = function()
--     require"octo".setup({
--       default_to_projects_v2 = true
--     })
--
--     local wk = require("which-key")
--
--     wk.add({
--       { "<leader>o", group = "[O]cto.nvim" },
--       { "<leader>oi", group = "[I]ssue" },
--       { "<leader>op", group = "[P]ull Request" },
--       { "<leader>or", group = "[R]epo" },
--       { "<leader>og", group = "[G]ist" },
--       { "<leader>oc", group = "[C]omment" },
--       { "<leader>oV", group = "[V]iew Review" },
--       { "<leader>on", group = "[N]otifications" },
--     })
--
--     wk.add({
--       { "<leader>oic", "<cmd>Octo issue close<CR>", desc = "Close Issue" },
--       { "<leader>oir", "<cmd>Octo issue reopen<CR>", desc = "Reopen Issue" },
--       { "<leader>oie", function()
--           vim.ui.input({ prompt = "Enter Issue Number: " }, function(issue_number)
--               if issue_number then
--                   vim.cmd("Octo issue edit " .. issue_number)
--               end
--           end)
--         end, desc = "Edit Issue" },
--       { "<leader>oil", "<cmd>Octo issue list<CR>", desc = "List Issues" },
--       { "<leader>ois", function()
--           vim.ui.input({ prompt = "Enter Search Query: " }, function(query)
--               if query then
--                   vim.cmd("Octo issue search " .. query)
--               end
--           end)
--         end, desc = "Search Issues" },
--       { "<leader>oid", "<cmd>Octo issue develop<CR>", desc = "Develop Issue" },
--       { "<leader>oib", "<cmd>Octo issue browser<CR>", desc = "Open Issue in Browser" },
--       { "<leader>oiu", "<cmd>Octo issue url<CR>", desc = "Copy Issue URL" },
--     })
--
--     wk.add({
--       { "<leader>opc", "<cmd>Octo pr close<CR>", desc = "Close PR" },
--       { "<leader>opr", "<cmd>Octo pr reopen<CR>", desc = "Reopen PR" },
--       { "<leader>ope", function()
--           vim.ui.input({ prompt = "Enter PR Number: " }, function(pr_number)
--               if pr_number then
--                   vim.cmd("Octo pr edit " .. pr_number)
--               end
--           end)
--         end, desc = "Edit PR" },
--       { "<leader>opl", "<cmd>Octo pr list<CR>", desc = "List PRs" },
--       { "<leader>ops", function()
--           vim.ui.input({ prompt = "Enter Search Query: " }, function(query)
--               if query then
--                   vim.cmd("Octo pr search " .. query)
--               end
--           end)
--         end, desc = "Search PRs" },
--       { "<leader>opx", function()
--           vim.ui.input({ prompt = "Enter PR Number: " }, function(pr_number)
--               if pr_number then
--                   vim.cmd("Octo pr checkout " .. pr_number)
--               end
--           end)
--         end, desc = "Checkout PR" },
--       { "<leader>opm", "<cmd>Octo pr merge commit<CR>", desc = "Merge PR (Commit)" },
--       { "<leader>opM", "<cmd>Octo pr merge rebase<CR>", desc = "Merge PR (Rebase)" },
--       { "<leader>opS", "<cmd>Octo pr merge squash<CR>", desc = "Merge PR (Squash)" },
--       { "<leader>opb", "<cmd>Octo pr browser<CR>", desc = "Open PR in Browser" },
--       { "<leader>opu", "<cmd>Octo pr url<CR>", desc = "Copy PR URL" },
--     })
--
--     wk.add({
--       { "<leader>orc", "<cmd>Octo repo create<CR>", desc = "Create Repo" },
--       { "<leader>orv", "<cmd>Octo repo view<CR>", desc = "View Repo" },
--       { "<leader>ogc", "<cmd>Octo gist create<CR>", desc = "Create Gist" },
--       { "<leader>ogb", "<cmd>Octo gist browser<CR>", desc = "Open Gist in Browser" },
--       { "<leader>oCa", "<cmd>Octo comment add<CR>", desc = "Add Comment" },
--       { "<leader>oCd", "<cmd>Octo comment delete<CR>", desc = "Delete Comment" },
--       { "<leader>oVs", "<cmd>Octo review start<CR>", desc = "Start Review" },
--       { "<leader>oVS", "<cmd>Octo review submit<CR>", desc = "Submit Review" },
--       { "<leader>oVR", "<cmd>Octo review resume<CR>", desc = "Resume Review" },
--       { "<leader>oVd", "<cmd>Octo review discard<CR>", desc = "Discard Review" },
--       { "<leader>oVx", "<cmd>Octo review close<CR>", desc = "Close Review Window" },
--       { "<leader>onl", "<cmd>Octo notification list<CR>", desc = "List Notifications" },
--     })
--   end
-- }
--
return {
  'pwntester/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- OR 'ibhagwan/fzf-lua',
    'nvim-tree/nvim-web-devicons',
  },
  config = function ()
    require"octo".setup()
  end
}
