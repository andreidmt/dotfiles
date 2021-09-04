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
    "lua",
    "python"
    -- "rust",
    -- "go"
  },
  highlight = {
    enable = true,
    use_languagetree = true
  }
}
