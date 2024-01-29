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
    "*.flow"
  },
  json = {
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
    "*.tfstate.backup"
  },
  hcl = {
    "*.hcl",
    ".terraformrc",
    "terraform.rc"
  },
  terraform = {
    "*.tf",
    "*.tfvars"
  },
})
