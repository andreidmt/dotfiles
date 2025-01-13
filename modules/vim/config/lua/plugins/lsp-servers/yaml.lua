-- "yamlls" lsp configuration
return function(on_attach)
  local lspconfig = require("lspconfig")

  lspconfig.yamlls.setup({
    on_attach = on_attach,
    settings = {
      yaml = {
        ["https://json.schemastore.org/circleciconfig.json"] = ".circleci/**/*.{yml,yaml}",
        ["https://raw.githubusercontent.com/lalcebo/json-schema/master/serverless/reference.json"] = "serverless.{yml,yaml}",
        ["https://gitlab.com/gitlab-org/gitlab/-/blob/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.{yml,yaml}",
      },
    },
    flags = {
      debounce_text_changes = 150,
    },
  })
end
