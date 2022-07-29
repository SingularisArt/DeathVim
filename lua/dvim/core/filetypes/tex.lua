-- Allow for auto-insertion of \item when in itemize or enumerate environments.
vim.cmd([[
set formatoptions=tcroqln
set comments+=b:\\item
set spell
]])

local file_settings = {
  wrap = true,
  spell = true,
}

local settings = require("dvim.settings")
settings.load_filetype_defaults(file_settings)
