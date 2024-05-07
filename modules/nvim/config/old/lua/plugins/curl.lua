local m = require('plugins/m')

-- Description: Transform a table of headers into a string of curl headers
--
-- Example:
--  stringifyHeaders({
--    ["Content-Type"] = "application/json",
--  })
--  => "-H 'Content-Type: application/json'"
local function stringifyHeaders(input)
  local output = ''

  for key, value in pairs(input) do
    output = output .. string.format("-H '%s: %s' ", key, value)
  end

  return output
end

-- Description: Send a request to a URL
local function send(input)
  local url = input.url
  local method = input.method or "GET"
  local headers = input.headers or {}
  local body = input.body or {}

  local command = string.format(
    "curl -s -X %s %s %s",
    method,
    stringifyHeaders(headers),
    url
  )

  if method == "POST" or method == "PUT" then
    command = command .. string.format(" -d '%s'", vim.fn.json_encode(body))
  end

  return m.pipe(
    command,
    vim.fn.system,
    vim.fn.json_decode
  )
end

return {
  send = send
}
