return function(on_attach)
  local lspconfig = require("lspconfig")

  lspconfig.stylelint_lsp.setup({
    on_attach = on_attach,
    filetypes = { "css", "less", "scss", "sugarss" },
    settings = {
      stylelintplus = {
        autoFixOnSave = true,
        autoFixOnFormat = true,
        cssInJs = true,
      }
    },
    flags = {
      debounce_text_changes = 150
    },
  })
end
