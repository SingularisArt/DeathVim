local M = {}

M.config = function()
  dvim.builtin.plugins.treesitter.setup = {
    on_config_done = nil,
    ensure_installed = { dvim.builtin.plugins.treesitter.ensure_installed },
    ignore_install = { dvim.builtin.plugins.treesitter.ignore_install },
    highlight = {
      enable = dvim.builtin.plugins.treesitter.highlight.enable,
      disable = { dvim.builtin.plugins.treesitter.highlight.disable },
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = dvim.builtin.plugins.treesitter.indent.enable,
      disable = { dvim.builtin.plugins.treesitter.indent.disable },
    },
  }
end

M.setup = function()
  M.config()

  -- avoid running in headless mode since it's harder to detect failures
  if #vim.api.nvim_list_uis() == 0 then
    return
  end

  local treesitter = require("nvim-treesitter.configs")
  treesitter.setup(dvim.builtin.plugins.treesitter.setup)
end

return M
