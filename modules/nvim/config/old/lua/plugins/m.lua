-- Description: A pipe function for Lua
-- Example: 
-- pipe(1, addOne, addOne, addOne) 
-- => 4
local function pipe(value, ...)
  local functions = {...}
  for _, fn in ipairs(functions) do
    value = fn(value)
  end
  return value
end

-- Description: A curried map function for Lua
-- Example:
-- map(addOne)({1, 2, 3})
-- => {2, 3, 4}
local function _map(fn, input)
  local output = {}
  for _, value in ipairs(input) do
    table.insert(output, fn(value))
  end
  return output
end

local function map(fn, input)
  if input then
    return _map(fn, input)
  end

  return function(input)
    return _map(fn, input)
  end
end

-- Description: A curried and uncurried "contains" function for Lua
-- Example:
-- contains(1, {1, 2, 3})
-- => true
-- contains(1)({1, 2, 3})
-- => true
local function _contains(value, input)
  for _, v in ipairs(input) do
    if v == value then
      return true
    end
  end

  return false
end

local function contains(value, input)
  if input then
    return _contains(value, input)
  else
    return function(input)
      return _contains(value, input)
    end
  end
end

return {
  pipe = pipe,
  map = map,
  contains = contains
}

