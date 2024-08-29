local Utils = require("plugins.nvim41.lua.utils")
local Logger = require("plugins.nvim41.lua.logger")

local M = {
  -- Plugin name
  name = "nvim41",

  -- Create a namespace for virtual text
  namespace_id = vim.api.nvim_create_namespace("nvim41"),

  --
  suggestion_text = "lorem ipsum",
  suggestion_line = nil,

  -- Plugin configurable options
  opts = {
    -- Flag telling if M.debug if it should actualy echo messages
    debug = true,
  },
}

-- Function to show suggestion
M.show_suggestion = function()
  Logger.debug("Showing suggestion")

  local col = vim.fn.col('.') - 1
  local line = vim.fn.line('.') - 1

  -- Save the initial position of the suggestion
  M.suggestion_pos = { line = line, col = col }

  -- Add the suggestion in gray text as virtual text using extmark
  vim.api.nvim_buf_set_extmark(0, M.namespace_id, line, col, {
    virt_text = { { M.suggestion_text, 'Comment' } },
    virt_text_pos = 'overlay',
  })
end

-- Function to update suggestion position
M.update_suggestion = function()
  if not M.suggestion_pos then return end

  local col = vim.fn.col('.') - 1
  local line = vim.fn.line('.') - 1

  -- Clear the previous virtual text
  vim.api.nvim_buf_clear_namespace(0, M.namespace_id, 0, -1)

  -- Add the suggestion in gray text at the new position using extmark
  vim.api.nvim_buf_set_extmark(0, M.namespace_id, line, col, {
    virt_text = { { M.suggestion_text, 'Comment' } },
    virt_text_pos = 'overlay',
  })

  -- Update the suggestion position
  M.suggestion_pos = { line = line, col = col }
end

-- Function to apply suggestion
M.apply_suggestion = function()
  Logger.debug("Applying suggestion")

  -- Capture the current context before scheduling
  local col = vim.fn.col('.') - 1
  local line = vim.api.nvim_get_current_line()
  local before_cursor = line:sub(1, col)
  local suggestion = "lorem ipsum"

  -- Schedule the application of the suggestion
  vim.schedule(function()
    Logger.debug("col:" .. col)
    Logger.debug("line:" .. line)
    Logger.debug("before_cursor:" .. before_cursor)

    --
    M.clear_suggestions()

    -- Apply the suggestion
    local new_line = before_cursor .. suggestion
    vim.api.nvim_set_current_line(new_line)

    -- Move the cursor to the end of the newly added suggestion
    local new_col = #new_line
    vim.api.nvim_win_set_cursor(0, { vim.fn.line('.'), new_col })
  end)
end

-- Clear all comments attached to the plugin namespace
M.clear_suggestions = function()
  Logger.debug("Clearing suggestions")
  vim.api.nvim_buf_clear_namespace(0, M.namespace_id, 0, -1)
end

-- Set up autocommand to show suggestion on InsertEnter
---@param opts table | nil # table with options
M.setup = function(opts)
  opts = opts or {}
  if type(opts) ~= "table" then
    Logger.error(string.format("setup() expects table, but got %s:\n%s", type(opts), vim.inspect(opts)))
    opts = {}
  else
    M.opts = Utils.merge_tables(M.opts, opts)
  end

  Logger.opts.debug = M.opts.debug

  vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    callback = function()
      -- require("nvim41").show_suggestion()
    end,
  })

  vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
      require("nvim41").clear_suggestions()
    end,
  })

  -- Set up CursorMovedI to update suggestion position
  vim.api.nvim_create_autocmd("CursorMovedI", {
    pattern = "*",
    callback = function()
      Logger.debug("CursorMovedI triggered")
      -- require("nvim41").update_suggestion()
    end,
  })

  vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.require("nvim41").apply_suggestion()',
    { expr = true, noremap = true })

  Logger.debug("Successfuly loaded!")
end

return M
