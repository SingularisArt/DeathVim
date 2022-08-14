local M = {}

M.config = function()
  dvim.builtin.plugins.autopairs = {
    ---@usage  modifies the function or method delimiter by filetypes
    map_char = {
      all = "(",
      tex = "{",
    },
    ---@usage check bracket in same line
    enable_check_bracket_line = false,
    ---@usage check treesitter
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
    enable_moveright = true,
    ---@usage disable when recording or executing a macro
    disable_in_macro = false,
    ---@usage add bracket pairs after quote
    enable_afterquote = true,
    ---@usage map the <BS> key
    map_bs = true,
    ---@usage map <c-w> to delete a pair if possible
    map_c_w = false,
    ---@usage disable when insert after visual block mode
    disable_in_visualblock = false,
    ---@usage  change default fast_wrap
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "Search",
      highlight_grey = "Comment",
    },
  }
end

M.setup = function()
  M.config()

  local autopairs = require("nvim-autopairs")

  autopairs.setup({
    check_ts = dvim.builtin.plugins.autopairs.check_ts,
    enable_check_bracket_line = dvim.builtin.plugins.autopairs.enable_check_bracket_line,
    ts_config = dvim.builtin.plugins.autopairs.ts_config,
    disable_filetype = dvim.builtin.plugins.autopairs.disable_filetype,
    disable_in_macro = dvim.builtin.plugins.autopairs.disable_in_macro,
    ignored_next_char = dvim.builtin.plugins.autopairs.ignored_next_char,
    enable_moveright = dvim.builtin.plugins.autopairs.enable_moveright,
    enable_afterquote = dvim.builtin.plugins.autopairs.enable_afterquote,
    map_c_w = dvim.builtin.plugins.autopairs.map_c_w,
    map_bs = dvim.builtin.plugins.autopairs.map_bs,
    disable_in_visualblock = dvim.builtin.plugins.autopairs.disable_in_visualblock,
    fast_wrap = dvim.builtin.plugins.autopairs.fast_wrap,
  })
end

return M
