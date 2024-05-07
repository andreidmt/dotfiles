return {
  -- nvim-autopairs: Auto close {,[,(
  -- {
  --   'windwp/nvim-autopairs',
  --   event = { "InsertEnter" },
  --   opts = {
  --     fast_wrap = {},
  --     disable_filetype = { "TelescopePrompt", "vim" },
  --   },
  -- },

  -- commentary: Comment stuff out
  -- https://github.com/tpope/vim-commentary
  {
    "tpope/vim-commentary",
    event = { "BufRead" },
    config = function()
      vim.cmd("autocmd FileType terraform setlocal commentstring=#\\ %s")
      vim.cmd("autocmd FileType sql setlocal commentstring=--\\ %s")
    end,
  },

  -- nvim-colorizer: Colorize color codes in your files
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufRead" }
  },

  -- copilot: Integrate with GitHub Copilot, enable for all filetypes
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_filetypes = {
        gitcommit = true,
        markdown = true,
        typescript = true,
        typescriptreact = true,
        javascript = true,
        javascriptreact = true,
        sh = true,
        yaml = true,
        json = true,
        toml = true,
        lua = true,
        go = true,
        rust = true,
      }
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
