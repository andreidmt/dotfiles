local vim_utils = require("utils.vim")

-- Hide parts of markdown syntax for easier reading
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		-- Concealed text is completely hidden.
		vim.opt_local.conceallevel = 3
	end,
})

-- NeoVim Lua configuration for auto-formatting Lua with stylua on save
vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "FormatAutogroup",
	pattern = "*.lua",
	command = "silent! !stylua %",
})

-- Define filetypes and their patterns
vim_utils.create_autocmds({
	html = "*.ejs",
	markdown = "*.mdx",
	zsh = ".zshrc",
	bash = ".xinitrc",
	groff = ".1",
	javascript = {
		"*.js.flow",
		"*.flow",
	},
	json = {
		".d41rc",
		".c8rc",
		".zerobootrc",
		".remarkrc",
		".browserslistrc",
		".commitlintrc",
		".eslintrc",
		".lintstagedrc",
		".markdownlintrc",
		".prettierrc",
		".swcrc",
		".releaserc",
		"*.tfstate",
		"*.tfstate.backup",
	},
	hcl = {
		"*.hcl",
		".terraformrc",
		"terraform.rc",
	},
	terraform = {
		"*.tf",
		"*.tfvars",
	},
})
