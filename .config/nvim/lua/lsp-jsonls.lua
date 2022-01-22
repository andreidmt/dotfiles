return {
  setup = function(on_attach)
    local lspconfig = require("lspconfig")

    lspconfig.jsonls.setup({
      on_attach = on_attach,

      settings = {
        json = {
          -- Schemas https://www.schemastore.org
          schemas = {
            lerna = {
              fileMatch = {'lerna.json'},
              url = 'http://json.schemastore.org/lerna'
            },
            node = {
              fileMatch = {"package.json"},
              url = "https://json.schemastore.org/package.json"
            }, 
            typescript = {
              fileMatch = {"tsconfig*.json"},
              url = "https://json.schemastore.org/tsconfig.json"
            }, 
            prettier = {
              fileMatch = {
                ".prettierrc", ".prettierrc.json", "prettier.config.json"
              },
              url = "https://json.schemastore.org/prettierrc.json"
            }, 
            eslint = {
              fileMatch = {".eslintrc", ".eslintrc.json"},
              url = "https://json.schemastore.org/eslintrc.json"
            }, 
            babel = {
              fileMatch = {
                ".babelrc", ".babelrc.json", "babel.config.json"
              },
              url = "https://json.schemastore.org/babelrc.json"
            },
            stylelint = {
              fileMatch = {
                ".stylelintrc", ".stylelintrc.json", "stylelint.config.json"
              },
              url = "http://json.schemastore.org/stylelintrc.json"
            }
          }
        }
      },

      flags = { 
        debounce_text_changes = 150
      },
    })
  end,
}
