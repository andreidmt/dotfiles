local telescope = require("telescope")
local actions = require("telescope.actions")
local utils = require("utils")

telescope.setup({
  extensions = {
    fzf = { 
      fuzzy = true, 
      override_generic_sorter = true, 
      override_file_sorter = true
    },
  },
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--ignore",
      "--hidden",
      "-g",
      "!.git",
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
})

telescope.load_extension("fzf")

find_files = function()
  local set = require("telescope.actions.set")
  local builtin = require("telescope.builtin")

  local opts = {
    attach_mappings = function(_, map)
      map("i", "<C-v>", function(prompt_bufnr)
        set.edit(prompt_bufnr, "vsplit")
      end)

      -- edit file and matching test file in split
      -- map("i", "<C-f>", function(prompt_bufnr)
      --     set.edit(prompt_bufnr, "edit")
      --     commands.edit_test_file("vsplit $FILE | wincmd w")
      -- end)

      return true
    end,
  }

  local is_git_project = pcall(builtin.git_files, opts)
  if not is_git_project then
    builtin.find_files(opts)
  end
end

-- lsp
utils.command("References", "Telescope lsp_references")
utils.command("Definitions", "Telescope lsp_definitions")
utils.command("LspSym", "Telescope lsp_workspace_symbols")
utils.command("LspRangeAct", "Telescope lsp_range_code_actions")

utils.nmap("<C-p>", "<cmd>Telescope find_files<CR>")
utils.nmap("<C-f>", "<cmd>Telescope live_grep<CR>")
utils.nmap("<C-c>", "<cmd>Telescope git_commits<CR>")
utils.nmap("<C-r>", "<cmd>Telescope lsp_references<CR>")
