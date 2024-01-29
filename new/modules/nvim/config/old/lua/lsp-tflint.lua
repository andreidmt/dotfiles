return {
  setup = function(on_attach)
    local lspconfig = require("lspconfig")

    lspconfig.tflint.setup({
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150
      }
    })
  end,
}
