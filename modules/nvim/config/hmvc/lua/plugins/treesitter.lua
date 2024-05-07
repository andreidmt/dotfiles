return {
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    build = ":TSUpdate",
    event = { "BufRead", "VeryLazy" },
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "diff",
        "go",
        "graphql",
        "hcl", -- Terraform
        "html",
        "javascript",
        "jq",
        "jsdoc",
        "json",
        "latex",
        "lua",
        "svelte",
        "handlebars",
        -- "markdown",
        "markdown_inline",
        "python",
        "rust",
        "terraform",
        "toml",
        "tsx",
        "tsx",
        "typescript",
        "yaml"
      },
      highlight = {
        enable = true,
        use_languagetree = true
      },
      indent = {
        enable = true
      },
    },
  },
}
