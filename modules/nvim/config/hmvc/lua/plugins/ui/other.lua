return {
  -- nvin-web-devicons: lua `fork` of vim-devicons for neovim.
  { "nvim-tree/nvim-web-devicons" },

  -- dressing.nvim: A simple, fast, and extensible prompt library for Neovim.
  {
    "stevearc/dressing.nvim",
    event = { "BufRead", "BufNewFile" },
  },
}
