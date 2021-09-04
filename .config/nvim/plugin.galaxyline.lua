local gl = require("galaxyline")
local condition = require("galaxyline.condition")
local lspclient = require("galaxyline.provider_lsp")

local colors = require("colors")

gl.short_line_list = {" "}

local checkIsScreenWide = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 30 then
    return true
  end

  return false
end

gl.section.left = {
  {
    ViModeIcon = {
      provider = function()
        return "   "
      end,
      highlight = {colors.black, colors.nord_blue},
    }
  },
  {
    ViMode = {
      provider = function()
        local alias = {
          n = "Normal",
          i = "Insert",
          c = "Command",
          V = "Visual",
          [""] = "Visual",
          v = "Visual",
          R = "Replace"
        }
        local current_Mode = alias[vim.fn.mode()]

        if current_Mode == nil then
          return "  Terminal "
        else
          return "  " .. current_Mode .. " "
        end
      end,
      highlight = {colors.black, colors.nord_blue},
      separator = "  ",
      separator_highlight = {colors.nord_blue, colors.lightbg}
    }
  },
  {
    FileIcon = {
      provider = "FileIcon",
      condition = condition.buffer_not_empty,
      highlight = {colors.white, colors.lightbg}
    }
  },
  {
    FileName = {
      provider = "FileName",
      condition = condition.buffer_not_empty,
      highlight = {colors.white, colors.lightbg},
      separator = " ",
      separator_highlight = {colors.lightbg, colors.lightbg2}
    }
  },
  {
    FileType = {
      provider = 'FileTypeName',
      separator = " ",
      separator_highlight = {colors.lightbg2, colors.statusline_bg},
      highlight = {colors.grey_fg2, colors.lightbg2}
    }
  }, 
  {
    LspStatus = {
      provider = function()
        return string.format("%s", lspclient.get_lsp_client())
      end,
      icon = "  ",
      highlight = {colors.grey_fg2, colors.statusline_bg}
    }
  },
  {
    DiagnosticError = {
      provider = "DiagnosticError",
      icon = "  ",
      highlight = {colors.red, colors.statusline_bg}
    }
  },
  {
    DiagnosticWarn = {
      provider = "DiagnosticWarn",
      icon = "  ",
      highlight = {colors.yellow, colors.statusline_bg}
    }
  }
}

gl.section.right = {
  {
    GitIcon = {
      provider = function()
        return " "
      end,
      condition = require("galaxyline.condition").check_git_workspace,
      highlight = {colors.grey_fg2, colors.statusline_bg},
      separator = " ",
      separator_highlight = {colors.statusline_bg, colors.statusline_bg}
    }
  },
  {
    GitBranch = {
      provider = "GitBranch",
      condition = require("galaxyline.condition").check_git_workspace,
      highlight = {colors.grey_fg2, colors.statusline_bg}
    }
  },
  {
    DiffAdd = {
      provider = "DiffAdd",
      condition = checkIsScreenWide,
      icon = "  ",
      separator = " ",
      highlight = {colors.white, colors.statusline_bg}
    }
  },
  {
    DiffModified = {
      provider = "DiffModified",
      condition = checkIsScreenWide,
      icon = "  ",
      highlight = {colors.grey_fg2, colors.statusline_bg}
    }
  }, 
  {
    DiffRemove = {
      provider = "DiffRemove",
      condition = checkIsScreenWide,
      icon = "  ",
      highlight = {colors.grey_fg2, colors.statusline_bg}
    }
  },
  {
    LinePercentageIcon = {
      provider = function()
        return " "
      end,
      separator = " ",
      separator_highlight = {colors.green, colors.lightbg},
      highlight = {colors.lightbg, colors.green}
    }
  },
  {
    LinePercentage = {
      provider = function()
        local current_line = vim.fn.line(".")
        local total_line = vim.fn.line("$")

        if current_line == 1 then
          return "  Top "
        elseif current_line == vim.fn.line("$") then
          return "  Bot "
        end

        local result, _ = math.modf((current_line / total_line) * 100)

        return "  " .. result .. "% "
      end,
      highlight = {colors.green, colors.lightbg}
    }
  }
}
