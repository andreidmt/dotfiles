local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

return function(on_attach)
  lspconfig.eslint.setup({
    root_dir = util.root_pattern(
      ".eslintrc",
      ".eslintrc.json",
      ".eslintrc.js",
      ".eslintrc.cjs",
      "eslint.config.js"
    ),
    on_attach = on_attach,
    settings = {
      experimental = {
        useFlatConfig = true,
      },
      -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
      workingDirectory = { mode = "auto" },
      format = true,
    },
    flags = {
      debounce_text_changes = 150,
    },
  })
end
