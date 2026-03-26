-- sqlls configuration
return {
  sqlls = {
    root_markers = { ".git" },
    cmd = { "sql-language-server", "up", "--method", "stdio" },
  },
}
