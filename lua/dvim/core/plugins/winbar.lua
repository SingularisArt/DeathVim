local M = {}
local utils = require("dvim.utils.functions")

dvim.winbar = {
  filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
    "alpha",
    "lir",
    "Outline",
    "spectre_panel",
    "toggleterm",
  },
}

local get_filename = function()
  local filename = vim.fn.expand("%:t")
  local extension = vim.fn.expand("%:e")

  if not require_clean(filename) then
    local file_icon, file_icon_color =
    require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

    local hl_group = "FileIconColor" .. extension

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    if utils.isempty(file_icon) then
      file_icon = ""
      file_icon_color = ""
    end

    return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#LineNr#" .. filename .. "%*"
  end
end

local get_navic = function()
  local navic = require("nvim-navic")

  local status_ok, navic_location = pcall(navic.get_location, {})
  if not status_ok then
    return ""
  end

  if not navic.is_available() or navic_location == "error" then
    return ""
  end

  if not require("dvim.utils.functions").isempty(navic_location) then
    return require("dvim.core.icons").ui.ChevronRight .. " " .. navic_location
  else
    return ""
  end
end

local excludes = function()
  if vim.tbl_contains(dvim.winbar.filetype_exclude, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end
  return false
end

M.setup = function()
  if not dvim.builtin.plugins.winbar.active or dvim.builtin.plugins.winbar.type ~= "winbar" then
    vim.cmd("set winbar=\"\"")
    return
  end

  if excludes() then
    return
  end
  local value = get_filename()

  local navic_added = false
  if not utils.isempty(value) then
    local navic_value = get_navic()
    value = value .. " " .. navic_value
    if not utils.isempty(navic_value) then
      navic_added = true
    end
  end

  if not utils.isempty(value) and utils.get_buf_option("mod") then
    local mod = "%#LineNr#" .. require("dvim.core.icons").ui.Circle .. "%*"
    if navic_added then
      value = value .. " " .. mod
    else
      value = value .. mod
    end
  end

  local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
  if not status_ok then
    return
  end
end

return M
