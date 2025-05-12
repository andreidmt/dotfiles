-- Hide parts of markdown syntax for easier reading
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Concealed text is completely hidden.
    vim.opt_local.conceallevel = 3
  end,
})

return {
  {
    "mzlogin/vim-markdown-toc",
    ft = { "markdown" },
    event = { "BufEnter" },
    init = function()
      vim.g.vmt_list_item_char = "-"
      vim.g.vmt_list_indent_text = "  "
    end,
  },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		event = { "BufEnter" },
		ft = { "markdown" },
		config = function()
			vim.g.mkdp_browser = "nyxt"
		end,
		build = "cd app && yarn install",
	},
	-- {
	--   "MeanderingProgrammer/render-markdown.nvim",
	--   opts = {
	--     code = {
	--       -- Determines how code blocks & inline code are rendered:
	--       --  none:     disables all rendering
	--       --  normal:   adds highlight group to code blocks & inline code, adds
	--       --            padding to code blocks
	--       --  language: adds language icon to sign column if enabled and icon +
	--       --            name above code blocks
	--       --  full:     normal + language
	--       style = "add",
	--     }
	--   },
	--   dependencies = {
	--     "nvim-treesitter/nvim-treesitter",
	--     "nvim-tree/nvim-web-devicons"
	--   },
	-- }
}
