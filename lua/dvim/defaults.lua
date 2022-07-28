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
    plugins = {
      which_key = {
        mappings = {},
      },
    },
    filetypes = {},
  },

  autocommands = {},
  lang = {},
  log = {
    ---@usage can be { "trace", "debug", "info", "warn", "error", "fatal" },
    level = "trace",
  },
  lsp = require("dvim.lsp.config"),
}

return dvim
