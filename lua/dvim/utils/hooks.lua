local M = {}

local in_headless = #vim.api.nvim_list_uis() == 0

function M.run_on_packer_complete()
  vim.api.nvim_exec_autocmds("User", { pattern = "PackerComplete" })

  vim.g.colors_name = dvim.colorscheme
  pcall(vim.cmd, "colorscheme " .. dvim.colorscheme)

  if M._reload_triggered then
    M._reload_triggered = nil
  end
end

function M.run_post_reload()
  M.reset_cache()
  M._reload_triggered = true
end

---Reset any startup cache files used by Packer and Impatient
---It also forces regenerating any template ftplugin files
---Tip: Useful for clearing any outdated settings
function M.reset_cache()
  local impatient = _G.__luacache
  if impatient then
    impatient.clear_cache()
  end
  local dvim_modules = {}
  for module, _ in pairs(package.loaded) do
    if module:match "dvim.core" or module:match "lvim.lsp" then
      package.loaded[module] = nil
      table.insert(dvim_modules, module)
    end
  end
  require("dvim.lsp.templates").generate_templates()
end

function M.run_post_update()
  if vim.fn.has "nvim-0.7" ~= 1 then
    local compat_tag = "1.1.3"
    vim.notify(
      "Please upgrade your Neovim base installation. Newer version of Lunarvim requires v0.7+",
      vim.log.levels.WARN
    )
    vim.wait(1000, function()
      return false
    end)
    local ret = require_clean("dvim.utils.git").switch_lvim_branch(compat_tag)
    if ret then
      vim.notify("Reverted to the last known compatibile version: " .. compat_tag, vim.log.levels.WARN)
    end
    return
  end

  M.reset_cache()

  require("dvim.plugin-loader").sync_core_plugins()

  if not in_headless then
    vim.schedule(function()
      if package.loaded["nvim-treesitter"] then
        vim.cmd [[ TSUpdateSync ]]
      end
      -- TODO: add a changelog
      vim.notify("Update complete", vim.log.levels.INFO)
    end)
  end
end

return M
