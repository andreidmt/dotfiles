local tabby = require("plugins.ui.tabby")
local lualine = require("plugins.ui.lualine")
local other = require("plugins.ui.other")
local table_utils = require("utils.tables")

return table_utils.merge(tabby, lualine, other)
