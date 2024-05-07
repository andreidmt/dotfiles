local telescope = require('telescope')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')
local m = require('plugins/m')

local function open(items, props)
  local favorites = props.favorites or { "gpt-3.5-turbo" }
  local onChange = props.onChange

  local fuzzy_sorter = sorters.get_generic_fuzzy_sorter()

  pickers.new({}, {
    prompt_title = 'Select an OpenAI model',

    finder = finders.new_table {
      results = m.map(function(item)
        return {
          value = item,
          display = item,
          ordinal = item,
          is_favorite = m.contains(item, favorites)
        }
      end, items),
    },

    sorter = sorters.new({
      scoring_function = function(entry, query)
        local score = fuzzy_sorter(entry, query)
        if entry.is_favorite then
          score = score + 1000
        end
        return score
      end
    }),

    attach_mappings = function(prompt_bufnr, map)
      local function handle_select()
        local selection = actions.get_selected_entry(prompt_bufnr)
        actions.close(prompt_bufnr)
        onChange(selection.value)
      end

      map('i', '<CR>', handle_select)
      map('i', '<C-c>', actions.close)

      map('n', '<CR>', handle_select)
      map('n', '<C-c>', actions.close)
      return true
    end,
  }):find()

end

return {
  open = open
}
