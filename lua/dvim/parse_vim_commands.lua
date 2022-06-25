local M = {}

M.load_defaults = function()
  for _, v in pairs(dvim.vim_commands) do
    for key, command in pairs(v) do
      if key == "command" then
        vim.cmd(command)
      end
    end
  end
end

return M
