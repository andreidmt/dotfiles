-- "jsonls" lsp configuration
return function(on_attach)
  local lspconfig = require("lspconfig")

  lspconfig.jsonls.setup({
    on_attach = on_attach,
    settings = {
      json = {
        schemas = {
          {
            description = "Nx project configuration file",
            fileMatch = { "project.json" },
            url = "https://raw.githubusercontent.com/nrwl/nx/master/packages/nx/schemas/project-schema.json",
          },
          {
            description = "Commitlint configuration file",
            fileMatch = { ".commitlintrc" },
            url = "https://json.schemastore.org/commitlintrc",
          },
          {
            description = "SWC configuration file",
            fileMatch = { ".swcrc", ".swcrc.json", "swcrc.json" },
            url = "https://swc.rs/schema.json",
          },
          {
            description = "Nx configuration file",
            fileMatch = { "nx.json" },
            url = "https://json.schemastore.org/nx",
          },
          {
            description = "TypeScript compiler configuration file",
            fileMatch = { "tsconfig.json", "tsconfig.*.json" },
            url = "https://json.schemastore.org/tsconfig",
          },
          {
            description = "NPM package.json",
            fileMatch = { "package.json" },
            url = "https://json.schemastore.org/package.json",
          },
          {
            description = "Lerna config",
            fileMatch = { "lerna.json" },
            url = "https://json.schemastore.org/lerna",
          },
          {
            description = "Babel configuration",
            fileMatch = { ".babelrc.json", ".babelrc", "babel.config.json" },
            url = "https://json.schemastore.org/babel",
          },
          {
            description = "ESLint config",
            fileMatch = { ".eslintrc.json", ".eslintrc" },
            url = "https://json.schemastore.org/eslintrc",
          },
          {
            description = "Prettier config",
            fileMatch = {
              ".prettierrc",
              ".prettierrc.json",
              "prettier.config.json",
            },
            url = "https://json.schemastore.org/prettierrc",
          },
          {
            description = "Stylelint config",
            fileMatch = {
              ".stylelintrc",
              ".stylelintrc.json",
              "stylelint.config.json",
            },
            url = "https://json.schemastore.org/stylelintrc",
          },
        },
      },
    },
    flags = {
      debounce_text_changes = 150,
    },
  })
end
