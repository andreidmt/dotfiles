-- openscad_lsp configuration
return {
  openscad_lsp = {
    cmd = { "openscad-lsp", "--stdio" },
    filetypes = { "openscad" },
    root_markers = { ".git" },
  },
}
