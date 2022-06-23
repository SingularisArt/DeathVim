local M = {}

M.config = function()
  dvim.builtin.surround = {
    setup = {
      context_offset = 100,
      load_autogroups = false,
      mappings_style = "sandwich",
      map_insert_mode = true,
      quotes = { "'", '"' },
      brackets = { "(", '{', '[' },
      pairs = {
        nestable = { { "(", ")" }, { "[", "]" }, { "{", "}" } },
        linear = { { "'", "'" }, { "`", "`" }, { '"', '"' } }
      },
      prefix = "s"
    }
  }
end

M.setup = function()
  M.config()

  local surround = Utils.safe_require('surround')
  surround.setup(dvim.builtin.surround.setup)
end

return M
