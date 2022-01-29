local present, lualine = pcall(require, "lualine")
if not present then return end

local mode = {
  "mode",
  fmt = function(str)
    if str == 'NORMAL' then return ' normal' end
    if str == 'INSERT' then return 'פֿ insert' end
    if str == 'COMMAND' then return ' command' end
    if str == 'VISUAL' then return '濾visual' end
    if str == 'REPLACE' then return '李replace' end
    return str
  end,
}

local location = {
  "location",
  padding = 0,
}

local filename = {
  'filename',
  path = 1,
  file_status = false,
}

local branch = {
  'branch',
  padding = 0,
}

local theme = require('theme.lualine')

lualine.setup({
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { location },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { branch },
    lualine_z = { filename },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = { branch },
    lualine_z = { filename },
  },
  tabline = {},
  extensions = {},
})

