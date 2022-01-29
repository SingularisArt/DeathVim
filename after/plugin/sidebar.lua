local sidebar_nvim_status, sidebar = pcall(require, "sidebar-nvim")

if not sidebar_nvim_status then
	vim.notify("Please Install 'sidebar-nvim'")
	return
end

local user_profile = require("SingularisArt.core.user_profile")

sidebar.setup({
  open = false,
  initial_width = 40,
  enable_profile = false,
  sections = user_profile.with_profile_table({
    default = { "git", "diagnostics", "containers", "files" },
    test = {
      "git",
      "diagnostics",
      "symbols",
      "files",
      "containers",
      "todos",
    },
    work = { "git", "diagnostics", "files" },
  }),
  datetime = {
    clocks = {
      { name = "Local" },
      { tz = "America/Los_Angeles" },
      { tz = "Etc/UTC" },
    },
  },
  todos = { initially_closed = true },
})
