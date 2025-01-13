return {
  -- conform.nvim: Custom formatters with LSP fallback and format-on-save
  {
    "stevearc/conform.nvim",
    event = "BufReadPre",

    config = function()
      local conform = require("conform")

      conform.setup({
        lsp_fallback = true,
        log_level = vim.log.levels.DEBUG,
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
        formatters_by_ft = {
          toml = { "taplo" },
          lua = { "stylua" },
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
