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
      vim.cmd("autocmd FileType lua setlocal commentstring=--\\ %s")
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- nvim-colorizer: Colorize color codes in your files
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = {
        "css",
        "javascript",
        html = { mode = "foreground" },
      },
      user_default_options = {
        css = true,
        -- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn
        css_fn = true,
        -- Tailwind colors.  boolean|'normal'|'lsp'|'both'.
        tailwind = true,
        -- Highlighting mode.  'background'|'foreground'|'virtualtext'
        mode = "background",
      },
    },
  },
}
