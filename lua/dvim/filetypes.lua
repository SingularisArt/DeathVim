local M = {}

M.load_default_filetype_settings = function()
  for file, filetype_table in pairs(dvim.builtin.filetypes) do
    local filetype = filetype_table.filetype
    for command, value in pairs(filetype_table) do
      if command == "active" and value == true then
        vim.api.nvim_create_autocmd("BufEnter", {
          pattern = filetype,
          callback = function()
            require_clean("dvim.core.filetypes." .. file)
          end,
        })
      end
    end
  end
end

M.load_user_filetype_settings = function()
  -- local filetype
  for _, table in pairs(dvim.builtin.filetypes) do
    local filetype = table.filetype
    for key, setting_table in pairs(table) do
      if key == "settings" then
        local group = vim.api.nvim_create_augroup(filetype, { clear = true })
        vim.api.nvim_create_autocmd("BufEnter", {
          pattern = "*." .. filetype,
          callback = function()
            require("dvim.settings").load_filetype_defaults(setting_table)
          end,
          group = group,
        })
      end
    end
  end
end

return M
