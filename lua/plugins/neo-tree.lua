-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  enabled = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { ';', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
    { '<leader>;', ':Neotree toggle<CR>', { desc = 'NeoTree toggle' } },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
  config = function()
    require('neo-tree').setup {
      window = {
        width = 30,
      },
      mappings = {
        ["/"] = "noop"
      }
    }
    

    -- Function to set custom highlights
    local function set_custom_highlights()
      vim.cmd 'highlight NormalFloat guibg=NONE ctermbg=NONE guifg=#D3D3D3'
      vim.cmd 'highlight FloatBorder guibg=NONE ctermbg=NONE'
      vim.cmd 'highlight NeoTreeTitleBar guibg=NONE ctermbg=NONE guifg=#D3D3D3'
      vim.cmd 'highlight NeoTreePromptTitle guibg=NONE ctermbg=NONE guifg=#D3D3D3'
      vim.cmd 'highlight NeoTreeNormal guibg=NONE ctermbg=NONE'
      vim.cmd 'highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE'
      vim.cmd 'highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE'
    end

    -- Apply custom highlights initially
    set_custom_highlights()

    -- Apply custom highlights on ColorScheme event
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        set_custom_highlights()
      end,
    })

    -- Open on nvim launch --
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        vim.cmd 'Neotree toggle'
      end,
    })
  end,
}
