--
-- Run system command and return output
--
function os.run( command )
  local f = assert( io.popen( command, "r" ) )
  local s = assert( f:read( "*a" ) )
  f:close()

  -- remove last new line char
  return string.gsub( s, "\n$", "" )
end

--
-- Split a string by new line
--
-- http://lua-users.org/wiki/SplitJoin
--
function lines( source )
   local t = {}
   local function helper(line)
      table.insert(t, line)
      return ""
   end
   helper((source:gsub("(.-)\r?\n", helper)))
   return t
end

--
-- Apply fn to each element.
-- Returns new array with transformed values.
--
-- https://en.wikibooks.org/wiki/Lua_Functional_Programming/Functions
--
function map( source, fn )
  local new_array = {}
  for i,v in ipairs(source) do
    new_array[i] = fn(v)
  end
  return new_array
end

function split( source, separator )
    elements = {}
    str:gsub("([^"..sep.."]*)"..sep, function(c)
        table.insert(fields, c)
    end )

    return elements
end
