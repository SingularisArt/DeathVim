local M = {}

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

  if not Utils.isempty(filename) then
    local file_icon, file_icon_color = Utils.safe_require("nvim-web-devicons").get_icon_color(
      filename,
      extension,
      { default = true }
    )

    local hl_group = "FileIconColor" .. extension

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    if Utils.isempty(file_icon) then
      file_icon = ""
      file_icon_color = ""
    end

    return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#LineNr#" .. filename .. "%*"
  end
end

local get_gps = function()
  local gps = Utils.safe_require("nvim-gps")

  local status_ok, gps_location = pcall(gps.get_location, {})
  if not status_ok then
    return ""
  end

  if not gps.is_available() or gps_location == "error" then
    return ""
  end

  if not require("dvim.utils.functions").isempty(gps_location) then
    return require("dvim.core.icons").ui.ChevronRight .. " " .. gps_location
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
  if excludes() then
    return
  end
  local value = get_filename()

  local gps_added = false
  if not Utils.isempty(value) then
    local gps_value = get_gps()
    value = value .. " " .. gps_value
    if not Utils.isempty(gps_value) then
      gps_added = true
    end
  end

  if not Utils.isempty(value) and Utils.get_buf_option("mod") then
    local mod = "%#LineNr#" .. require("dvim.core.icons").ui.Circle .. "%*"
    if gps_added then
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
