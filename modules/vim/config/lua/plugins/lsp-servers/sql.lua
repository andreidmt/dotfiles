-- "sqlls" lsp configuration
return function(on_attach)
  local lspconfig = require("lspconfig")

  lspconfig.sqlls.setup({
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
    cmd = { "sql-language-server", "up", "--method", "stdio" },
  })
end
