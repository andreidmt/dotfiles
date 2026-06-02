local vim_utils = require("utils.vim")

-- `BufReadPre` fires before the UI is fully ready and on scratch/nofile
-- buffers (terminals, quickfix, etc.), which means LSP would try to attach
-- before the editor has settled. `User FilePost` is a one-shot custom event
-- that fires only when the UI is up AND the first real file is open.
-- The augroup deletes itself so it never fires twice.
vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function() vim.g.ui_entered = true end,
})

vim.api.nvim_create_autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("FilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name("FilePost")
    end
  end,
})

-- Define filetypes and their patterns
-- Neovim doesn't know .dbml out of the box; tell it before any filetype
-- detection runs so LSP, Treesitter, and formatters all see the right ft.
vim.filetype.add({ extension = { dbml = "dbml", scad = "openscad" } })

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

-- Custom-parser filetypes need an explicit highlight enable because
-- nvim-treesitter only auto-enables for parsers it officially bundles.
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.hurl", "*.http", "*.dbml" },
  callback = function()
    vim.treesitter.start()
  end,
})
