dvim = {
  leader = " ",
  colorscheme = "onedarker",
  transparent_window = false,
  format_on_save = true,
  keys = {},
  language_servers = {},
  vim_commands = {},

  use_icons = true,

  builtin = {
    plugins = {},
    filetypes = {},
  },

  autocommands = {},
  lang = {},
  log = {
    ---@usage can be { "trace", "debug", "info", "warn", "error", "fatal" },
    level = "trace",
  },
}

dvim.lsp = require('dvim.lsp.config')

return dvim
