local M = {}

M.load_default_filetype_settings = function()
  for filetype, filetype_table in pairs(dvim.builtin.filetypes) do
    for command, value in pairs(filetype_table) do
      if command == "active" then
        if value == true then
          vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*",
            callback = function()
              if vim.bo.filetype == filetype then
                pcall(require, "dvim.core.filetypes." .. filetype)
              end
            end,
          })
        end
      end
    end
  end
end

M.load_user_filetype_settings = function()
  for filetype, table in pairs(dvim.builtin.filetypes) do
    for key, value in pairs(table) do
      if key == "settings" then
        for option, set_to in pairs(value) do
          if option == "filetype" then
            filetype = set_to
          end

          local group = vim.api.nvim_create_augroup(filetype, { clear = true })
          vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*." .. filetype,
            command = "lua vim.opt." .. option .. " = " .. tostring(set_to),
            group = group,
          })
        end
      end
    end
  end
end

return M
