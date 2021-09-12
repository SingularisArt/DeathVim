-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/hashedupforyou101/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/hashedupforyou101/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/hashedupforyou101/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/hashedupforyou101/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hashedupforyou101/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  UltiSnips = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/UltiSnips"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["latex-snippets"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/latex-snippets"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/lazygit.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nlsp-settings.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tex-conceal.vim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/tex-conceal.vim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-translator"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-translator"
  },
  vimtex = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vimtex"
  },
  ["wal.vim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/wal.vim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["wilder.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
