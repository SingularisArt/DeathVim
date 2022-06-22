vim.cmd [[
  set runtimepath+=~/.config/dvim
  set runtimepath+=~/.local/share/deathvim/dvim
  set runtimepath+=~/.local/share/deathvim/site
  set runtimepath+=~/.local/share/deathvim/site/pack/*/start/*/after
]]

Utils = require("dvim.utils.functions")

Utils.safe_require("config")

Utils.safe_require("dvim.settings.options")
Utils.safe_require("dvim.settings.keymaps")
Utils.safe_require("dvim.settings.plugins")
Utils.safe_require("dvim.settings.colorscheme")
Utils.safe_require("dvim.settings.autocommands")

Utils.safe_require("dvim.core.alpha")
Utils.safe_require("dvim.core.autopairs")
Utils.safe_require("dvim.core.bufferline")
Utils.safe_require("dvim.core.cmp")
Utils.safe_require("dvim.core.comment")
Utils.safe_require("dvim.core.cybu")
Utils.safe_require("dvim.core.dap")
Utils.safe_require("dvim.core.gitsigns")
Utils.safe_require("dvim.core.gps")
Utils.safe_require("dvim.core.icons")
Utils.safe_require("dvim.core.impatient")
Utils.safe_require("dvim.core.jabs")
Utils.safe_require("dvim.core.lsp")
Utils.safe_require("dvim.core.lualine")
Utils.safe_require("dvim.core.lualine")
Utils.safe_require("dvim.core.markdown")
Utils.safe_require("dvim.core.neogen")
Utils.safe_require("dvim.core.nvim-tree")
Utils.safe_require("dvim.core.project")
Utils.safe_require("dvim.core.surround")
Utils.safe_require("dvim.core.symbols-outline")
Utils.safe_require("dvim.core.telescope")
Utils.safe_require("dvim.core.todo-comments")
Utils.safe_require("dvim.core.toggleterm")
Utils.safe_require("dvim.core.treesitter")
Utils.safe_require("dvim.core.ultisnips")
Utils.safe_require("dvim.core.vimtex")
Utils.safe_require("dvim.core.which-key")
Utils.safe_require("dvim.core.winbar")
