return {
  -- conform.nvim: Custom formatters with LSP fallback and format-on-save
  {
    "stevearc/conform.nvim",
    event = "BufReadPre",

    config = function()
      local conform = require("conform")

      conform.setup({
        formatters = {
          shfmt = {
            prepend_args = {
              "--indent",
              "2",
              "--case-indent",
              "--binary-next-line",
              "--space-redirects",
            },
          },
          prettier = {
            prepend_args = {
              "--trailing-comma",
              "none",
            },
          },
        },
        lsp_fallback = true,
        log_level = vim.log.levels.DEBUG,
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
        formatters_by_ft = {
          sh = { "shfmt" },
          typescript = { "eslint_d" },
          typescriptreact = { "eslint_d" },
          javascript = { "eslint_d" },
          javascriptreact = { "eslint_d" },
          toml = { "taplo" },
          lua = { "stylua" },
          markdown = { "prettier" },
          tf = { "terraform_fmt" },
          terraform = { "terraform_fmt" },
          json = { "prettier" },
          jsonc = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          less = { "prettier" },
        },
      })

      -- Explicit format a buffer or a selection
      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })

        print("LSP log file:", vim.lsp.get_log_path())
      end, { desc = "[CNF] Format file or selected range" })
    end,
  },
}
