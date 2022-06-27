local M = {}

M.config = function()
  dvim.builtin.plugins.copilot = {
    active = true,
    setup = {
      cmp = {
        enabled = true,
        method = "getPanelCompletions",
      },
      panel = { -- no config options yet
        enabled = true,
      },
      ft_disable = { "markdown" },
    }
  }
end

M.setup = function()
  M.config()

  local copilot = require("copilot")

  copilot.setup(dvim.builtin.plugins.copilot.setup)
end

return M
