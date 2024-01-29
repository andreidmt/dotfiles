local function open(props)
  local value = props.value or ""
  local onSubmit = props.onSubmit

  local buffer = vim.api.nvim_create_buf(false, true)
  local width = math.min(80, vim.o.columns - 10)
  local height = math.min(80, vim.o.lines - 10)
  local window = vim.api.nvim_open_win(buffer, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = math.ceil((vim.o.columns - width) / 2),
    row = math.ceil((vim.o.lines - height) / 2)
  })

  -- Disable gutter row count
  vim.api.nvim_win_set_option(window, 'number', false)

  -- Insert a list of models into the buffer.
  vim.api.nvim_buf_set_lines(buffer, 0, -1, false, value)

  -- Highlight the current selection.
  vim.api.nvim_buf_add_highlight(buffer, -1, 'Visual', 0, 0, -1)

  vim.api.nvim_buf_attach(buffer, false, {
    on_detach = function()
      vim.api.nvim_win_close(window, true)
    end
  })

  local function on_key_press(key)
    local row = vim.api.nvim_win_get_cursor(window)[1] - 1
    print(row)

    if key == '<CR>' then
      vim.api.nvim_win_close(window, true)
      onChange(models[row])
    end
  end

  vim.api.nvim_buf_set_keymap(buffer, 'n', '<CR>', '<cmd>lua require("plugins/ui_select").on_key_press("<CR>")<CR>', {
    nowait = true,
    noremap = true,
    silent = true
  })
end

return {
  open = open
}
