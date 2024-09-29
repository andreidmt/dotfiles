-- Prepend the plugin path to the runtime path
vim.opt.rtp:prepend(vim.fn.getenv("NVIM_LAZY_HOME"))

-- Set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

require("config.options")
require("config.autocmd")
require("config.keymaps")

require("lazy").setup({
	import = "plugins",
}, {
	defaults = { lazy = true },
	install = { missing = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"bugreport",
				"compiler",
				"ftplugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"matchit",
				"netrw",
				"netrwFileHandlers",
				"netrwPlugin",
				"netrwSettings",
				"optwin",
				"rplugin",
				-- "rrhelper",
				"spellfile_plugin",
				-- "synmenu",
				-- "syntax",
				"tar",
				"tarPlugin",
				"tohtml",
				"tutor",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
			},
		},
	},
})
