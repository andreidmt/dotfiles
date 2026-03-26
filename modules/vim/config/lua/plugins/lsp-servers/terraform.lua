-- terraform lsp configuration
return {
  terraformls = {
    root_markers = { "main.tf", ".terraform", ".git" },
    capabilities = {
      experimental = {
        telemetryVersion = false,
      },
    },
  },
  tflint = {
    root_markers = { "main.tf", ".terraform", ".git" },
  },
}
