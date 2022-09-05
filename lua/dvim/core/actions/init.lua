local M = {}

M.get_defaults = function()
  return {
    writing = {},
    note_taking = {},
    programming = {},
    presentation = {},
    documentation = {},
  }
end

M.load_actions = function()
  return true
end

return M
