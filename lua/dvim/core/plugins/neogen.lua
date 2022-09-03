local M = {}

M.config = function()
  dvim.builtin.plugins.neogen.setup = {
    enabled = true,
    languages = {
      python = {
        template = {
          annotation_convention = "google_docstrings",
        },
      },
    },
  }
end

M.setup = function()
  M.config()

  local neogen = require("neogen")

  neogen.setup({
    dvim.builtin.plugins.neogen.setup,
  })
end

return M
