local M = {}

-- Merge tables utility function
M.merge_tables = function(defaults, overrides)
  local result = {}

  -- Copy all keys and values from defaults
  for k, v in pairs(defaults) do
    result[k] = v
  end

  -- Override with keys and values from overrides
  for k, v in pairs(overrides) do
    result[k] = v
  end

  return result
end

return M
