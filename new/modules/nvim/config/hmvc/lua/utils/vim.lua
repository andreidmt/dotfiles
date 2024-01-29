-- Create autocmds given a table of filetypes and their patterns
local function create_autocmds(filetype_patterns)
  for filetype, patterns in pairs(filetype_patterns) do
    if type(patterns) == 'string' then
      patterns = { patterns }
    end

    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = patterns,
      callback = function() vim.bo.filetype = filetype end
    })
  end
end

-- Create a lua command
local function create_lua_cmd(name, lua_command)
  vim.cmd(string.format("command! %s lua %s", name, lua_command))
end

-- Add a keymap to the current buffer
local function add_keymap(bufnr, keymap)
  local default_opts = { noremap = true, silent = true }
  local merged_opts = vim.tbl_extend("force", default_opts, keymap.opts or {})

  vim.api.nvim_buf_set_keymap(
    bufnr or 0,
    keymap.mode or "n",
    keymap.key,
    keymap.cmd,
    merged_opts
  )
end

return {
  create_autocmds = create_autocmds,
  create_lua_cmd = create_lua_cmd,
  add_keymap = add_keymap,
}
