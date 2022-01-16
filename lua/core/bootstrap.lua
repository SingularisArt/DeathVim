if vim.fn.has "nvim-0.6" ~= 1 then
  vim.notify("Please upgrade your Neovim base installation. Lunarvim requires v0.6+", vim.log.levels.WARN)
  vim.wait(5000, function()
    return false
  end)
  vim.cmd "cquit"
end

local uv = vim.loop
local path_sep = uv.os_uname().version:match "Windows" and "\\" or "/"
local in_headless = #vim.api.nvim_list_uis() == 0
