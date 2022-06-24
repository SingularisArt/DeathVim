local M = {}

M.config = function()
  dvim.builtin.copilot = {
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

  local copilot = Utils.safe_require("copilot")

  copilot.setup(dvim.builtin.copilot.setup)
end

return M
