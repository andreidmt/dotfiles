return {
  setup = function(on_attach)
    local lspconfig = require("lspconfig")

    lspconfig.yamlls.setup({
      on_attach = on_attach,

      settings = {
        yaml = {
          schemas = {
            ['http://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}'
          }
        }
      },

      flags = { 
        debounce_text_changes = 150
      },
    })
  end,
}
