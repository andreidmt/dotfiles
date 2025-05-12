return function(on_attach)
  local lspconfig = require("lspconfig")

  lspconfig.pylsp.setup({
    on_attach = on_attach,
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = { "W391" },
            maxLineLength = 80,
          },
        },
      },
    },
  })
end
