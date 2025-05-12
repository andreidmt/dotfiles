-- Open definition in a split
local open_definition_split = function()
  local params = vim.lsp.util.make_position_params()
  local result =
    vim.lsp.buf_request_sync(0, "textDocument/definition", params, 1000)

  if not result or vim.tbl_isempty(result) then
    vim.notify("Definition not found", vim.log.levels.WARN)
    return
  end

  local def
  for _, value in pairs(result) do
    def = value.result and value.result[1]
    if def ~= nil then
      break
    end
  end

  if not def then
    vim.notify("Definition not found", vim.log.levels.WARN)
    return
  end

  local uri = def.uri or def.targetUri
  local range = def.range or def.targetSelectionRange

  local bufnr = vim.uri_to_bufnr(uri)
  vim.fn.bufload(bufnr)

  local existing_win = vim.fn.win_findbuf(bufnr)[1]
  if existing_win then
    vim.fn.win_gotoid(existing_win)
  else
    vim.cmd("vsplit")
    vim.api.nvim_win_set_buf(0, bufnr)
  end

  local pos = { range.start.line + 1, range.start.character }
  vim.api.nvim_win_set_cursor(0, pos)
end

return {
  -- neoconf: A NeoVim configuration plugin written in Lua
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    dependencies = { "neovim/nvim-lspconfig" },
  },

  -- neodev: Development tools for neovim plugins
  {
    "folke/neodev.nvim",
    opts = {},
  },

  -- nvim-lspconfig: Collection of common configurations for Neovim's built-in LSP client
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "folke/neodev.nvim",
      "folke/neoconf.nvim",
    },
    config = function()
      --
      -- Customizing how diagnostics are displayed
      --

      vim.diagnostic.config({
        virtual_text = {
          prefix = "❯",
          spacing = 2,
        },
        float = {
          source = "always",
        },
        signs = true,
        underline = true,
        update_in_insert = true,
      })

      --
      -- Set diagnostic symbols in the sign column (gutter)
      --

      local diagnostic_signs = {
        { name = "DiagnosticSignError", icon = "" },
        { name = "DiagnosticSignWarn", icon = "" },
        { name = "DiagnosticSignInfo", icon = "" },
        { name = "DiagnosticSignHint", icon = "" },
      }

      for _, sign in ipairs(diagnostic_signs) do
        vim.fn.sign_define(sign.name, { text = sign.icon, texthl = sign.name })
      end

      --
      -- LSP specific keymaps
      --

      vim.keymap.set("n", "<leader>gt", open_definition_split, {
        desc = "[LSP] Go to definition in a split window",
      })
      vim.keymap.set(
        "n",
        "<leader>i",
        vim.diagnostic.open_float,
        { desc = "[LSP] Show line diagnostics" }
      )
      vim.keymap.set(
        "n",
        "<leader>ki",
        "<cmd>Telescope diagnostics<cr>",
        { desc = "[LSP] Show all diagnostics" }
      )
      vim.keymap.set(
        "n",
        "<leader>k",
        vim.lsp.buf.hover,
        { desc = "[LSP] Show hover information" }
      )
      vim.keymap.set(
        "n",
        "<leader>rn",
        vim.lsp.buf.rename,
        { desc = "[LSP] Rename symbol" }
      )
      vim.keymap.set(
        "n",
        "<C-j>",
        vim.diagnostic.goto_next,
        { desc = "[LSP] Next diagnostic" }
      )
      vim.keymap.set(
        "n",
        "<C-k>",
        vim.diagnostic.goto_prev,
        { desc = "[LSP] Previous diagnostic" }
      )
      vim.keymap.set(
        "n",
        "<leader>ca",
        vim.lsp.buf.code_action,
        { desc = "[LSP] Code actions" }
      )

      --
      -- LSP configuration
      --

      local on_attach = function() end

      local lsp_configs = {
        "bash",
        "css",
        "eslint",
        "json",
        "lua",
        "python",
        "terraform",
        "sql",
        -- "typescript",
        "yaml",
      }

      for _, server in ipairs(lsp_configs) do
        require("plugins.lsp-servers." .. server)(on_attach)
      end
    end,
  },

  --
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    event = "BufReadPre",
    opts = {},
  },
}
