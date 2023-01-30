return {
  setup = function(on_attach)
    local lspconfig = require("lspconfig")

    lspconfig.jsonls.setup({
      on_attach = on_attach,
      settings = {
        json = {
          schemas = {
            {
              description = 'Nx configuration file',
              fileMatch = {'nx.json'},
              url = 'http://json.schemastore.org/nx'
            },
            {
              description = 'TypeScript compiler configuration file',
              fileMatch = {'tsconfig.json', 'tsconfig.*.json'},
              url = 'http://json.schemastore.org/tsconfig'
            },
            {
              description = 'NPM package.json',
              fileMatch = {'package.json'},
              url = 'http://json.schemastore.org/package'
            },
            {
              description = 'Lerna config',
              fileMatch = {'lerna.json'},
              url = 'http://json.schemastore.org/lerna'
            },
            {
              description = 'Babel configuration',
              fileMatch = {'.babelrc.json', '.babelrc', 'babel.config.json'},
              url = 'http://json.schemastore.org/babel'
            },
            {
              description = 'ESLint config',
              fileMatch = {'.eslintrc.json', '.eslintrc'},
              url = 'http://json.schemastore.org/eslintrc'
            },
            {
              description = 'Prettier config',
              fileMatch = {'.prettierrc', '.prettierrc.json', 'prettier.config.json'},
              url = 'http://json.schemastore.org/prettierrc'
            },
            {
              description = 'Stylelint config',
              fileMatch = {'.stylelintrc', '.stylelintrc.json', 'stylelint.config.json'},
              url = 'http://json.schemastore.org/stylelintrc'
            }
          }
        }
      },
      flags = { 
        debounce_text_changes = 150
      }
    })

  end,
}
