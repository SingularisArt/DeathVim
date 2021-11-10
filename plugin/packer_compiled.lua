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
  MatchTagAlways = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/MatchTagAlways",
    url = "https://github.com/Valloric/MatchTagAlways"
  },
  ["TrueZen.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/TrueZen.nvim",
    url = "https://github.com/Pocco81/TrueZen.nvim"
  },
  UltiSnips = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/UltiSnips",
    url = "https://github.com/SirVer/UltiSnips"
  },
  ["base16-vim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/base16-vim",
    url = "https://github.com/chriskempson/base16-vim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  colorizer = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/colorizer",
    url = "https://github.com/lilydjwg/colorizer"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["elly.vim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/elly.vim",
    url = "https://github.com/ulwlu/elly.vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["latex-snippets"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/latex-snippets",
    url = "https://github.com/gillescastel/latex-snippets"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  neorg = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/scrooloose/nerdcommenter"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nlsp-settings.nvim",
    url = "https://github.com/tamago324/nlsp-settings.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim",
    url = "https://github.com/christianchiarulli/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-lspinstall",
    url = "https://github.com/kabouzeid/nvim-lspinstall"
  },
  ["nvim-minimap"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-minimap",
    url = "https://github.com/rinx/nvim-minimap"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["scrollbar.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/scrollbar.nvim",
    url = "https://github.com/Xuyuanp/scrollbar.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tex-conceal.vim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/tex-conceal.vim",
    url = "https://github.com/KeitaNakamura/tex-conceal.vim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["uwu.vim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/uwu.vim",
    url = "https://github.com/SingularisArt/uwu.vim"
  },
  ["vim-angry-reviewer"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-angry-reviewer",
    url = "https://github.com/anufrievroman/vim-angry-reviewer"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors",
    url = "https://github.com/terryma/vim-multiple-cursors"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-rainbow"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-rainbow",
    url = "https://github.com/frazrepo/vim-rainbow"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-tex-kawaii"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-tex-kawaii",
    url = "https://github.com/anufrievroman/vim-tex-kawaii"
  },
  ["vim-translator"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vim-translator",
    url = "https://github.com/voldikss/vim-translator"
  },
  vimtex = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["wal.vim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/wal.vim",
    url = "https://github.com/dylanaraps/wal.vim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    loaded = true,
    path = "/home/hashedupforyou101/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
