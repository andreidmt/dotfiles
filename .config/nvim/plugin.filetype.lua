vim.g.did_load_filetypes = 1

require("filetype").setup({
  literal = {
      [".c8rc"] = "json",
  },
})
