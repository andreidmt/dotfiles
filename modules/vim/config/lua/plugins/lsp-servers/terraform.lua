local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

return function(on_attach)
  local find_root_dir = function(fname)
    return util.root_pattern("main.tf", ".terraform", ".git")(fname)
      or util.path.dirname(fname)
  end

  lspconfig.terraformls.setup({
    on_attach = on_attach,
    root_dir = find_root_dir,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = {
      experimental = {
        telemetryVersion = false,
      },
    },
  })

  lspconfig.tflint.setup({
    on_attach = on_attach,
    root_dir = find_root_dir,
  })
end
