local M = {}

M.setup = function()
  local cybu = Utils.safe_require('cybu')

  cybu.setup {
    position = {
      relative_to = "win",
      anchor = "center",
    },
    display_time = 1000,
    style = {
      path = "relative",
      border = "rounded",
      separator = " ",
      prefix = "…",
      padding = 1,
      hide_buffer_id = true,
      devicons = {
        enabled = true,
        colored = true,
      },
    },
  }
end

return M
