local api = vim.api

local statuslineGroup = api.nvim_create_augroup("Statusline", { clear = true })
api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost", "FileWritePost", "TextChanged", "TextChangedI", "WinEnter" },
  {
    pattern = "*",
    callback = function()
      dvim.statusline.check_modified()
    end,
    group = statuslineGroup,
  })

api.nvim_create_autocmd({ "ColorScheme" }, {
  pattern = "*",
  callback = function()
    dvim.statusline.update_highlight()
  end,
  group = statuslineGroup,
})

if dvim.builtin.plugins.winbar.active then
  local winbarGroup = api.nvim_create_augroup("Winbar", { clear = true })
  vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost" }, {
    callback = function()
      require("dvim.core.plugins.winbar").setup()
    end,
    group = winbarGroup,
  })
end
