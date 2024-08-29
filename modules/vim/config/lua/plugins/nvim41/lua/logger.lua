local M = {
  opts = {
    debug = true,
    namespace = "nvim41"
  }
}

M.error = function(msg)
  vim.schedule(function()
    vim.api.nvim_echo({ { M.opts.namespace .. ": " .. msg, "ErrorMsg" }, }, true, {})
  end)
end

M.debug = function(msg)
  if M.opts.debug then
    vim.schedule(function()
      vim.api.nvim_echo({ { M.opts.namespace .. ": " .. msg, "Normal" }, }, true, {})
    end)
  end
end

return M
