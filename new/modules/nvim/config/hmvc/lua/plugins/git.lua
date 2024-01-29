return {
  -- vim-fugitive: A Git wrapper so awesome, it should be illegal.
  -- https://github.com/tpope/vim-fugitive
  {
    "tpope/vim-fugitive",
    cmd = {
      "Git", "Gdiffsplit", "Gread", "Gwrite",
      "Ggrep", "GMove", "GDelete", "GBrowse"
    },
  },

  -- gitsigns: Git decorations implemented purely in lua/teal.
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufRead", "VeryLazy" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "│" },
        untracked = { text = "│" },
      }
    }
  }
}
