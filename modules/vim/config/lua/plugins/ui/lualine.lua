return {
  -- lualine.nvim: A blazing fast and easy to configure neovim statusline
  -- written in pure lua.
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox",
          disabled_filetypes = { "NvimTree" },
        },
      })
    end,
  },
}
