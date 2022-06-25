local M = {}

M.config = function()
  dvim.builtin.plugins.notify = {
    active = true,
  }
end

M.setup = function()
  M.config()

  if #vim.api.nvim_list_uis() == 0 then
    -- no need to configure notifications in headless
    return
  end

  local notify = Utils.safe_require("notify")

  vim.notify = notify
end

return M
