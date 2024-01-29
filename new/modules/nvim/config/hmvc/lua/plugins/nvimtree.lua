return {
  -- nvim-tree: a file explorer tree for neovim written in lua.
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      {
        "<F1>",
        "<cmd>NvimTreeFindFile<cr>",
        desc = "Open file explorer with current buffer focused"
      },
    },
    config = function()
      require("nvim-tree").setup({
        on_attach = function(bufnr)
          local api = require('nvim-tree.api')
          local ops = function(desc)
            return {
              desc = 'nvim-tree: ' .. desc,
              buffer = bufnr,
              noremap = true,
              silent = true,
              nowait = true
            }
          end

          api.config.mappings.default_on_attach(bufnr)
          vim.keymap.set('n', 's', api.node.open.vertical, ops("Open: Vertical Split"))
          vim.keymap.set('n', 'o', api.node.open.horizontal, ops("Open: Horizontal Split"))
        end,
        filters = {
          dotfiles = false,
          git_ignored = false,
        },
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        view = {
          adaptive_size = true,
          side = "left",
          width = 30,
          preserve_window_proportions = true,
        },
        sort = {
          sorter = "case_sensitive",
        },
        diagnostics = {
          enable = true,
        },
        git = {
          enable = true,
          ignore = true,
        },
        filesystem_watchers = {
          enable = true,
        },
        actions = {
          open_file = {
            resize_window = true,
          },
        },
        renderer = {
          add_trailing = true,
          root_folder_label = false,
          highlight_git = true,
          highlight_opened_files = "all",
          highlight_diagnostics = true,

          indent_markers = {
            enable = false,
          },

          icons = {
            show = {
              file = true,
              folder = false,
              folder_arrow = true,
              git = true,
            },

            glyphs = {
              default = "󰈚",
              symlink = "",
              folder = {
                default = "",
                empty = "",
                empty_open = "",
                open = "",
                symlink = "",
                symlink_open = "",
                arrow_open = "",
                arrow_closed = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
      })
    end,
  }
}
