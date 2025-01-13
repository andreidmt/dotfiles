return {
  -- nvim-cmp: A completion plugin for neovim coded in Lua.
  -- https://github.com/hrsh7th/nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",

      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      -- "hrsh7th/cmp-nvim-lsp",
      -- "hrsh7th/cmp-nvim-lua",
    },
    event = { "InsertEnter" },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      -- gray
      vim.api.nvim_set_hl(
        0,
        "CmpItemAbbrDeprecated",
        { bg = "NONE", strikethrough = true, fg = "#808080" }
      )
      -- blue
      vim.api.nvim_set_hl(
        0,
        "CmpItemAbbrMatch",
        { bg = "NONE", fg = "#569CD6" }
      )
      vim.api.nvim_set_hl(
        0,
        "CmpItemAbbrMatchFuzzy",
        { link = "CmpIntemAbbrMatch" }
      )
      -- light blue
      vim.api.nvim_set_hl(
        0,
        "CmpItemKindVariable",
        { bg = "NONE", fg = "#9CDCFE" }
      )
      vim.api.nvim_set_hl(
        0,
        "CmpItemKindInterface",
        { link = "CmpItemKindVariable" }
      )
      vim.api.nvim_set_hl(
        0,
        "CmpItemKindText",
        { link = "CmpItemKindVariable" }
      )
      -- pink
      vim.api.nvim_set_hl(
        0,
        "CmpItemKindFunction",
        { bg = "NONE", fg = "#C586C0" }
      )
      vim.api.nvim_set_hl(
        0,
        "CmpItemKindMethod",
        { link = "CmpItemKindFunction" }
      )
      -- front
      vim.api.nvim_set_hl(
        0,
        "CmpItemKindKeyword",
        { bg = "NONE", fg = "#D4D4D4" }
      )
      vim.api.nvim_set_hl(
        0,
        "CmpItemKindProperty",
        { link = "CmpItemKindKeyword" }
      )
      vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

      cmp.setup({
        icons = true,
        lspkind_text = true,
        -- default/flat_light/flat_dark/atom/atom_colored
        style = "default",
        -- only applicable for "default" style, use color names from base30 variables
        border_color = "grey_fg",
        selected_item_bg = "colored", -- colored / simple

        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },

        window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            side_padding = 0,
          },
        },

        -- Add fancy icons
        formatting = {
          expandable_indicator = true,
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = lspkind.cmp_format({
              mode = "symbol_text",
              maxwidth = 50,
            })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })

            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"

            return kind
          end,
        },

        view = {
          entries = { name = "custom", selection_order = "near_cursor" },
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),

          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }, {
          { name = "buffer" },
        }),
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
          { name = "buffer" },
        }),
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
