return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- install() calls reload_parsers() first, which wipes the module cache
      -- and re-requires parsers from disk, then fires User TSUpdate on the
      -- fresh table. That's the only window where custom parsers survive.
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          require("nvim-treesitter.parsers").dbml = {
            install_info = {
              url = "https://github.com/dynamotn/tree-sitter-dbml",
              revision = "2e2fa5640268c33c3d3f27f7e676f631a9c68fd9",
            },
          }
        end,
      })

      require("nvim-treesitter").setup({})
      require("nvim-treesitter").install({
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
        "dbml",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufRead", "VeryLazy" },
  }
}
