-- Function to generate the Table of Contents, only for Markdown files
local function generate_toc()
  -- Check if the current file is of type 'markdown'
  if vim.bo.filetype ~= "markdown" then
    vim.api.nvim_err_writeln("Error: Filetype is not '.md'")
    return
  end

  -- Open the current file for reading
  local file = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(file, 0, -1, false)

  -- Initialize the ToC header and a flag to track the first top-level heading
  local toc = { "## Table of Contents" }
  local first_top_level_heading_found = false

  -- Loop through each line to find headers
  for _, line in ipairs(lines) do
    local header, title = line:match("^(#+)%s+(.*)")
    if header then
      local level = #header

      -- Check if it's the first top-level header and skip it
      if level == 1 and not first_top_level_heading_found then
        first_top_level_heading_found = true
      else
        -- Create the ToC entry and add it to the list
        local link = title:gsub(" ", "-"):gsub("[^%w%-]", ""):lower()
        table.insert(toc, string.rep("  ", level - 1) .. "- [" .. title .. "](#" .. link .. ")")
      end
    end
  end

  -- Get the current cursor position
  local row = vim.api.nvim_win_get_cursor(0)[1]

  -- Insert the generated ToC at the cursor position
  vim.api.nvim_buf_set_lines(file, row - 1, row - 1, false, toc)
end

-- Create a custom command to generate the ToC
vim.api.nvim_create_user_command("GenerateToC", generate_toc, {})

-- Map <leader>ic to run the GenerateToC command
vim.api.nvim_set_keymap("n", "<leader>ic", ":GenerateToC<CR>", { noremap = true, silent = true })

