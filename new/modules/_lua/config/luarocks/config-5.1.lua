-- LuaRocks configuration

rocks_trees = {
   { name = "user", root = home .. "/.luarocks" };
   { name = "system", root = "/home/andreid/Work/andreidmt.dotfiles/new/modules/lua/.local/luarocks-tree" };
}
lua_interpreter = "luajit";
variables = {
   LUA_DIR = "/usr";
   LUA_BINDIR = "/usr/bin";
}
