return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
    },
    keys = {
      { "<C-p>",      "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<C-f>",      "<cmd>Telescope live_grep<cr>",  desc = "Grep Files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "List Buffers" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require('telescope.actions')
      local action_state = require('telescope.actions.state')

      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            'rg', '--color=never', '--no-heading', '--with-filename',
            '--line-number', '--column', '--smart-case', '--hidden',
            '--glob', '!.git/**', '--glob', '!**/node_modules/**',
            '--glob', '!**/package-lock.json', '--glob', '!**/.yarn-cache/**',
            '--glob', '!**/yarn.lock', '--glob', '!**/.npm/**',
            '--glob', '!**/.nx/cache/**',
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

      local function replaceAllInOneFile(filename, old_text, new_text)
        -- Open the file in a buffer
        vim.cmd('edit ' .. filename)

        -- Ensure the buffer is loaded
        local buf = vim.fn.bufnr('%')
        vim.fn.bufload(buf)

        -- Perform the substitution
        local success, err = pcall(function()
          vim.cmd(string.format("%%s/%s/%s/g", old_text, new_text))
        end)

        if not success then
          vim.notify("Error performing substitution in file: " .. filename .. "\nError message: " .. err,
            vim.log.levels.ERROR)
          return
        end

        -- Save the changes
        vim.cmd("write")
      end

      function replaceAllInFiles()
        local old_text = vim.fn.input('Old text: ')
        local new_text = vim.fn.input('New text: ')

        require('telescope.builtin').grep_string({
          search = old_text,
          attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
              local picker = action_state.get_current_picker(prompt_bufnr)
              if not picker then
                vim.notify("Error: unable to get current picker", vim.log.levels.ERROR)
                return
              end
              local selections = picker:get_multi_selection()

              actions.close(prompt_bufnr)

              if #selections == 0 then
                vim.notify("No selections made", vim.log.levels.WARN)
                return
              end

              for _, entry in ipairs(selections) do
                replaceAllInOneFile(entry.filename, old_text, new_text)
              end
            end)

            return true
          end
        })
      end

      -- Bind the function to a keymap
      vim.api.nvim_set_keymap('n', '<leader>fr', ':lua replaceAllInFiles()<CR>', { noremap = true, silent = true })
    end,
  },
}
