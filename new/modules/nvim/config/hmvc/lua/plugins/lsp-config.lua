-- Open definition in a split
local open_definition_split = function()
  local def = vim.lsp.buf.implementation()
  -- local def = vim.lsp.buf.declaration()
  -- local def = vim.lsp.buf.definition()
  if def == nil then
    return
  end

  local def_win = vim.fn.win_findbuf(def.bufnr)[1]
  if def_win ~= nil then
    vim.fn.win_gotoid(def_win)
    return
  end

  vim.cmd("vsplit")
  vim.api.nvim_win_set_buf(0, def.bufnr)
  vim.api.nvim_win_set_cursor(0, def.range.start)
end

-- Format buffer with a specific client
local format_buffer_with_client = function(opts)
  local params = vim.lsp.util.make_formatting_params()
  local result, err = opts.client.request_sync("textDocument/formatting", params, 5000, opts.bufnr)
  local encoding = opts.client and opts.client.offset_encoding or "utf-16"

  if err then
    local err_msg = type(err) == "string" and err or err.message
    vim.notify("lsp-config formatting buffer: " .. err_msg, vim.log.levels.WARN)
    return
  end

  if result and result.result then
    vim.lsp.util.apply_text_edits(result.result, opts.bufnr, encoding)
  end
end

-- Format buffer with all available clients
local format_buffer = function(opts)
  local rejected_formatting_clients = { "tsserver", "typescript-tools", "copilot" }
  local current_clients = vim.lsp.get_active_clients({ bufnr = opts.bufnr })
  local selected_clients = {}

  for _, client in ipairs(current_clients) do
    if not vim.tbl_contains(rejected_formatting_clients, client.name) then
      table.insert(selected_clients, client)
    end
  end

  if #selected_clients == 0 then
    return
  end

  for _, client in ipairs(selected_clients) do
    -- print("Formatting buffer with " .. client.name)
    format_buffer_with_client({ bufnr = opts.bufnr, client = client })
  end
end

return {
  -- neoconf: A NeoVim configuration plugin written in Lua
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    config = false,
    dependencies = { "nvim-lspconfig" }
  },

  -- neodev: Development tools for neovim plugins
  {
    "folke/neodev.nvim",
    opts = {}
  },

  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspStart", "LspStop", "LspRestart" },
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
        { name = "DiagnosticSignError", icon = "" },
        { name = "DiagnosticSignWarn", icon = "" },
        { name = "DiagnosticSignInfo", icon = "" },
        { name = "DiagnosticSignHint", icon = "" }
      }

      for _, sign in ipairs(diagnostic_signs) do
        vim.fn.sign_define(sign.name, { text = sign.icon, texthl = sign.name })
      end

      --
      -- LSP specific keymaps
      --

      vim.keymap.set('n', '<M-CR>', function()
        local ts_api = require("typescript-tools.api")
        ts_api.go_to_source_definition(true)
      end)
      vim.keymap.set('n', '<leader>i', vim.diagnostic.open_float)
      vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
      vim.keymap.set('n', '<C-j>', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<C-k>', vim.diagnostic.goto_prev)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

      --
      -- LSP configuration
      --

      local on_attach = function(client)
        -- Format before saving, if the client supports it
        -- print("Setting up format on save for " .. client.name)
      end

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          format_buffer({ bufnr = vim.api.nvim_get_current_buf() })
        end,
      })

      local lsp_configs = {
        "bash",
        "css",
        "eslint",
        "json",
        "lua",
        "terraform",
        "sql",
        -- "typescript",
        "yaml",
      }

      for _, server in ipairs(lsp_configs) do
        require("plugins.lsp-servers." .. server)(on_attach)
      end
    end
  },

  --
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig"
    },
    event = "BufReadPre",
    opts = {},
  },
}
