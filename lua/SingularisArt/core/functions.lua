local M = {}

function M.config()
  plugin_manager = 'Packer'
end

function total_plugins()
  local paths = {};
  for match in (package.path..';'):gmatch("(.-)"..';') do
    table.insert(paths, match);
  end
  for k,_ in pairs(paths) do
    if string.match(paths[k], "nvim/site/pack/") then
      count = count + 1
    end
  end
  return('' .. M.plugin_manager .. ' loaded: ' .. count .. ' plugins')
end

return M
