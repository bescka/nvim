return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  -- enabled = false,
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    provider = "claude",
    claude = {
      api_key_name = "cmd:bw get notes anthropic-api-key", -- the shell command must prefixed with `^cmd:(.*)`
      -- api_key_name = {"bw","get","notes","anthropic-api-key"}, -- if it is a table of string, then default to command.
    }
    -- add any opts here
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
  },
  config = function()
    require('avante').setup({
       -- provider = "ollama",
       -- vendors = {
       --   ---@type AvanteProvider
       --   ollama = {
       --     ["local"] = true,
       --     endpoint = "127.0.0.1:11434/v1",
       --     model = "codegemma",
       --     parse_curl_args = function(opts, code_opts)
       --       return {
       --         url = opts.endpoint .. "/chat/completions",
       --         headers = {
       --           ["Accept"] = "application/json",
       --           ["Content-Type"] = "application/json",
       --         },
       --         body = {
       --           model = opts.model,
       --           messages = require("avante.providers").copilot.parse_message(code_opts), -- you can make your own message, but this is very advanced
       --           max_tokens = 2048,
       --           stream = true,
       --         },
       --       }
       --     end,
       --     parse_response_data = function(data_stream, event_state, opts)
       --       require("avante.providers").openai.parse_response(data_stream, event_state, opts)
       --     end,
       --   },
       -- },
     -- },
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      provider = "claude",
      auto_suggestions_provider = "claude",
      -- openai = {
      --   -- endpoint = "https://api.openai.com/v1/chat/completions",
      --   model = "gpt-4",
      --   temperature = 0.5,
      --   max_tokens = 2000,
      -- },
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20240620",
        temperature = 0,
        max_tokens = 4096,
      },
      behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      mappings = {
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        -- sidebar = {
        --   switch_windows = "<Tab>",
        --   reverse_switch_windows = "<S-Tab>",
        -- },
      },
      hints = { enabled = true },
      windows = {
        position = "right",
        wrap = true,
        width = 30,
        sidebar_header = {
          align = "center",
          rounded = true,
        },
      },
      highlights = {
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },
      diff = {
        autojump = true,
        list_opener = "copen",
      },
    })
  end,
}


