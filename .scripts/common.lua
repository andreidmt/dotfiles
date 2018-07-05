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
