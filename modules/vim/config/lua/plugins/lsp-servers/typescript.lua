return function(on_attach)
  local lspconfig = require("lspconfig")

  lspconfig.tsserver.setup({
    on_attach = function(client)
      -- Disable tsserver formatting
      client.resolved_capabilities.document_formatting = false

      -- Enable incremental sync
      client.config.flags.allow_incremental_sync = true

      on_attach(client)
    end,
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
    },
    flags = {
      debounce_text_changes = 150,
    },
  })
end
