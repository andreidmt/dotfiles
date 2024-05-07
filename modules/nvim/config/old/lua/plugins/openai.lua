local telescope = require('telescope')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')
local openAILib = require('plugins/openai_lib')
local uiSelect = require('plugins/ui_select')

function openai_getAllModels()
  local result = openAILib.getAllModels()

  if result.error then
    return "[openai/getAllModels] Error: " .. apiResult.error.message
  end

  if result then
    uiSelect.open(result, {
      onChange = function(item)
        print(item)
      end
    })
    
    -- pickers.new({}, {
    --   prompt_title = 'Select a Model',
    --   finder = finders.new_table {
    --     results = result,
    --     entry_maker = function(entry)
    --       return {
    --         value = entry,
    --         display = entry,
    --         ordinal = entry,
    --       }
    --     end,
    --   },
    --   sorter = sorters.get_generic_fuzzy_sorter(),
    --   attach_mappings = function(_, map)
    --     map('i', '<CR>', actions.select_default)
    --     return true
    --   end,
    -- }):find()
  else
    print("[openai/getAllModels] Error: " .. result.error.message)
  end
end

function openai_askAboutSelected(props)
  local model = props.model or "gpt-3.5-turbo"

  local bufnr = vim.api.nvim_get_current_buf()
  local selectedLines = table.concat(
    vim.api.nvim_buf_get_lines(
      bufnr, 
      unpack(vim.api.nvim_buf_get_mark(bufnr, '<')) - 1, 
      unpack(vim.api.nvim_buf_get_mark(bufnr, '>')), 
      false
    ), 
    '\n'
  )

  local prompt = vim.fn.input("Enter a prompt: ")
  local result = openAILib.ask(prompt .. '\n' .. selectedLines)

  if result and result.choices then
    local completion = result.choices[1].text
    print(completion)
  else
    print("[openai/askAboutSelected] error: " .. result.error.message)
  end
end
