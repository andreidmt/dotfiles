return {
  --
  {
    "mzlogin/vim-markdown-toc",
    ft = { "markdown" },
    event = { "VeryLazy" },
  },

  --
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    event = { "VeryLazy" },
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_browser = "surf"
    end,
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
