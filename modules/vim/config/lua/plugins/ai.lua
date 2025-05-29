return {
  {
    "deckr41/nvim",
    name = "deckr41",
    event = { "BufEnter" },
    opts = {
      modes = {
        ["on-demand"] = {
          command = "finish-line",
          double_command = "finish-section",
        },
        ["autocomplete"] = {
          command = "finish-section",
          timeout = 500,
        },
      },
      active_mode = "on-demand",
      backends = {
        anthropic = {
          available_models = {
            ["claude-3-7-sonnet-latest"] = { max_output_tokens = 64000 },
            ["claude-3-7-haiku-latest"] = { max_output_tokens = 64000 },
            ["claude-sonnet-4-0"] = { max_output_tokens = 64000 },
          },
        },
      },
      active_backend = "anthropic",
      active_model = "claude-sonnet-4-0",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "melbaldove/llm.nvim",
    lazy = false,
    opts = {
      openai = {
        url = "https://api.openai.com/v1/chat/completions",
        model = "gpt-4o",
        api_key_name = "OPENAI_API_KEY",
      },
    },
    config = function()
      vim.keymap.set("n", "<leader>g,", function()
        require("llm").prompt({ replace = false, service = "openai" })
      end, { desc = "Prompt with openai" })
      vim.keymap.set("v", "<leader>g,", function()
        require("llm").prompt({ replace = false, service = "openai" })
      end, { desc = "Prompt with openai" })
      vim.keymap.set("v", "<leader>g.", function()
        require("llm").prompt({ replace = true, service = "openai" })
      end, { desc = "Prompt while replacing with openai" })
    end,
    dependencies = {
      --  A library for asynchronous IO in Neovim
      "nvim-neotest/nvim-nio",
    },
  },

  -- {
  --   "huggingface/llm.nvim",
  --   lazy = false,
  --   opts = {
  --     model = "gpt-4o", -- the model ID, behavior depends on backend
  --     backend = "openai", -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
  --     url = "https://api.openai.com",
  --     request_body = {
  --       parameters = {
  --         temperature = 0.2,
  --       },
  --     },
  --   }
  -- },

  --
  --
  -- {
  --   "olimorris/codecompanion.nvim",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "hrsh7th/nvim-cmp",
  --     "nvim-telescope/telescope.nvim",
  --     {
  --       "stevearc/dressing.nvim",
  --       opts = {
  --       },
  --     },
  --   },
  --   config = true
  -- }

  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     provider = "openai"
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     -- "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- }

  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("chatgpt").setup({
  --       openai_params = {
  --         model = "gpt-4o",
  --         max_tokens = 128000,
  --         temperature = 0.2,
  --       }
  --     })
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "folke/trouble.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- },

  -- copilot: Integrate with GitHub Copilot, enable for all filetypes
  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  --   config = function()
  --     vim.g.copilot_filetypes = {
  --       gitcommit = true,
  --       markdown = true,
  --       typescript = true,
  --       typescriptreact = true,
  --       javascript = true,
  --       javascriptreact = true,
  --       sh = true,
  --       yaml = true,
  --       json = true,
  --       toml = true,
  --       lua = true,
  --       go = true,
  --       rust = true,
  --     }
  --   end,
  -- },

  -- {
  --   "robitx/gp.nvim",
  --   event = { "BufRead" },
  --   config = function()
  --     require("gp").setup()

  --     -- or setup with your own config (see Install > Configuration in Readme)
  --     -- require("gp").setup(config)

  --     -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
  --   end,
  -- },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = "LspAttach",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     })
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
}
