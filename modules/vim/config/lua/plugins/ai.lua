return {
  -- {
  --   dir = "~/.config/nvim/lua/plugins/nvim41",
  --   name = "nvim41",
  --   event = { "BufEnter" },
  --   opts = {},
  -- },

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        openai_params = {
          model = "gpt-4o",
          max_tokens = 128000,
          temperature = 0.2,
        }
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },

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

  {
    "robitx/gp.nvim",
    event = { "BufRead" },
    config = function()
      require("gp").setup()

      -- or setup with your own config (see Install > Configuration in Readme)
      -- require("gp").setup(config)

      -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
    end,
  },

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
