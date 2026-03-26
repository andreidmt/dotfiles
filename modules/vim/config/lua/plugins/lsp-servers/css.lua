-- stylelint_lsp configuration
return {
  stylelint_lsp = {
    filetypes = { "css", "less", "scss", "sugarss" },
    settings = {
      stylelintplus = {
        cssInJs = true,
      },
    },
  },
}
