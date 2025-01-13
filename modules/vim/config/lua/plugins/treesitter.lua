return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufRead",
    setup = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "css",
          "diff",
          "go",
          "graphql",
          "html",
          "javascript",
          "jq",
          "jsdoc",
          "json",
          "latex",
          "lua",
          "svelte",
          "hurl",
          "http",
          "handlebars",
          -- "markdown",
          "markdown_inline",
          "python",
          "rust",
          "hcl", -- Terraform
          "terraform",
          "toml",
          "tsx",
          "typescript",
          "yaml",
        },
        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
}
