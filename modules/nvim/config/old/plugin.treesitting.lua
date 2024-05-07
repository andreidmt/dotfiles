local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
  ensure_installed = {
    "bash",
    "toml",
    "latex",
    "javascript",
    "jsdoc",
    "json",
    "html",
    "css",
    "typescript",
    "tsx",
    "graphql",
    "yaml",
    "lua",
    "python",
    "hcl", -- Terraform
    "terraform",
    "rust",
    "go"
  },
  highlight = {
    enable = true,
    use_languagetree = true
  }
}
