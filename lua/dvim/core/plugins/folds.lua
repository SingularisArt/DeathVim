local M = {}

M.config = function()
end

M.setup = function()
  require('pretty-fold').setup()
  require('pretty-fold.preview').setup()
end

return M
