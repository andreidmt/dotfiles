return {
  -- nvim-autopairs: Auto close {,[,(
  {
    'windwp/nvim-autopairs',
    event = { "InsertEnter" },
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },

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

  -- copilot: Integrate with GitHub Copilot
  {
    "github/copilot.vim",
    event = { "BufRead" }
  },
}
