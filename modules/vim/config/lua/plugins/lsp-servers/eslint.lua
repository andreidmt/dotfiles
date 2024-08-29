return function(on_attach)
  local lspconfig = require("lspconfig")

  lspconfig.eslint.setup({
    root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.json", ".eslintrc.js", ".eslintrc.cjs"),
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = true

      on_attach(client)
    end,
    settings = {
      -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
      workingDirectory = { mode = "auto" },
      format = {
        enable = true,
      },
    },
    flags = {
      debounce_text_changes = 150
    },
  })
end
