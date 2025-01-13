local vim_utils = require("utils.vim")

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
    ".stylelintrc",
    ".postcssrc",
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

-- Hack around treesitter not highlighting HTTP files properly
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.hurl", "*.http" },
  callback = function()
    vim.cmd("TSBufEnable highlight")
  end,
})
