dvim = {
  leader = " ",
  color = {
    name = "base16-bright",
    dark = true,
    light = false,
  },
  transparent_window = false,
  format_on_save = false,
  keys = {},
  language_servers = {},
  vim_commands = {},

  use_icons = true,

  autocommands = {},
  lang = {},
  log = {
    ---@usage can be { "trace", "debug", "info", "warn", "error", "fatal" },
    level = "trace",
  },
  lsp = require("dvim.lsp.config"),
  builtin = {
    actions = require("dvim.core.actions").get_defaults(),
    plugins = require("dvim.core.plugins").get_defaults(),
    filetypes = require("dvim.core.filetypes").get_defaults(),
  },
}

return dvim
