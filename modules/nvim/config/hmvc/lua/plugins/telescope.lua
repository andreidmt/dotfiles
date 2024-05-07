return {
  -- telescope: a highly extendable fuzzy finder over lists.
  {
    "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      dependencies = {
        "nvim-lua/plenary.nvim",
        -- "nvim-lua/popup.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
      },
      keys = {
        {
          "<C-p>", "<cmd>Telescope find_files<cr>",
          desc = "Find Files"
        },
        {
          "<C-f>", "<cmd>Telescope live_grep<cr>",
          desc = "Grep Files"
        },
        {
          "<leader>fb", "<cmd>Telescope buffers<cr>",
          desc = "List staged and unstaged changes"
        },
      },
      config = function()
        local actions = require("telescope.actions")

        require("telescope").setup({
          defaults = {
            vimgrep_arguments = {
              'rg',
              '--color=never',
              '--no-heading',
              '--with-filename',
              '--line-number',
              '--column',
              '--smart-case',
              '--hidden',
              -- ignore files in .gitignore, .npm, .git, node_modules, etc.
              '--glob',
              '!.git/**',
              '--glob',
              '!**/node_modules/**',
              '--glob',
              '!**/package-lock.json',
              '--glob',
              '!**/.yarn-cache/**',
              '--glob',
              '!**/yarn.lock',
              '--glob',
              '!**/.npm/**',
              '--glob',
              '!**/.nx/cache/**',
            },
            mappings = {
              i = {
                ["<C-u>"] = false,
                ["<Esc>"] = actions.close,
                ["<M-u>"] = actions.preview_scrolling_up,
                ["<M-d>"] = actions.preview_scrolling_down,
              },
            },
          },
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true
            },
          },
        })
      end,
  },
}
