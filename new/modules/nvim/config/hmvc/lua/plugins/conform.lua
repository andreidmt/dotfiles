return {
  -- {
  --   "stevearc/conform.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   opts = {},
  --   config = function()
  --     local conform = require("conform")

  --     conform.setup({
  --       lsp_fallback = true,
  --       format_on_save = {
  --         lsp_fallback = true,
  --         async = false,
  --         timeout_ms = 500,
  --       },
  --     })

  --     vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  --       conform.format({
  --         lsp_fallback = true,
  --         async = false,
  --         timeout_ms = 500,
  --       })

  --       print('LSP log file:', vim.lsp.get_log_path())
  --     end, { desc = "Format file or range (in visual mode)" })
  --   end
  -- }
}
