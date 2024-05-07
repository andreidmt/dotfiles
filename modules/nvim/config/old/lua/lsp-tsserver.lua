local utils = require("utils")

local ts_utils_settings = {
  debug = false,
  disable_commands = false,
  enable_import_on_completion = false,

  -- import all
  import_all_timeout = 5000,
  -- lower numbers = higher priority
  import_all_priorities = {
    same_file = 1, -- add to existing import statement
    local_files = 2, -- git files or files with relative path markers
    buffer_content = 3, -- loaded buffer content
    buffers = 4, -- loaded buffer names
  },
  import_all_scan_buffers = 100,
  import_all_select_source = false,

  -- filter diagnostics
  filter_out_diagnostics_by_severity = {},
  -- filter out dumb module warning
  filter_out_diagnostics_by_code = { 80001 },

  -- inlay hints
  auto_inlay_hints = false,
  inlay_hints_highlight = "Comment",

  -- update imports on file move
  update_imports_on_move = true,
  require_confirmation_on_move = false,
}

return {
  setup = function(on_attach)
    local lspconfig = require("lspconfig")
    local ts_utils = require("nvim-lsp-ts-utils")

    lspconfig.tsserver.setup({
      root_dir = lspconfig.util.root_pattern("tsconfig.json"),
      init_options = ts_utils.init_options,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        ts_utils.setup(ts_utils_settings)
        ts_utils.setup_client(client)

        -- utils.buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        utils.buf_map(bufnr, "n", "<Leader>R", ":TSLspRenameFile<CR>")
        utils.buf_map(bufnr, "n", "<Leader>I", ":TSLspImportAll<CR>")
      end,

      flags = {
        debounce_text_changes = 150,
      },
    })
  end,
}
