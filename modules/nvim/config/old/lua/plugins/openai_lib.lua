local OPENAI_API_KEY = "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"
local OPENAI_ORG_ID = "org-ZO7trFNRSWMf0hAu7iJeCq2e"

local curl = require('plugins/curl')
local m = require('plugins/m')

local function ask(question, props)
  local model = props.model or "gpt-3.5-turbo"

  return curl.send({
    url = "https://api.openai.com/v1/chat/completions",
    method = "POST",
    headers = {
      ["Content-Type"] = "application/json",
      ["Authorization"] = "Bearer " .. OPENAI_API_KEY,
      ["OpenAI-Organization"] = OPENAI_ORG_ID
    },
    body = {
      model = model,
      messages = {{role = "user", content = question}},
      temperature = 0.7
    }
  })
end


local function getAllModels()
  local apiResult = curl.send({
    url = "https://api.openai.com/v1/models",
    headers = {
      ["Content-Type"] = "application/json",
      ["Authorization"] = "Bearer " .. OPENAI_API_KEY,
      ["OpenAI-Organization"] = OPENAI_ORG_ID
    }
  })

  if apiResult and apiResult.data then
    return m.pipe(
      apiResult.data,
      m.map(function(model)
        return model.id
      end)
    )
  end

  return apiResult
end

return {
  ask = ask,
  getAllModels = getAllModels
}
