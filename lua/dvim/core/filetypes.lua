local M = {}

M.get_defaults = function()
  return {
    lua = {
      filetype = "lua",
      settings = {},
    },
    vim = {
      filetype = "vim",
      settings = {},
    },
    python = {
      filetype = "py",
      settings = {},
    },
    cpp = {
      filetype = "cpp",
      settings = {},
    },
    cmake = {
      filetype = "cmake",
      settings = {},
    },
    c = {
      filetype = "c",
      settings = {},
    },
    c_sharp = {
      filetype = "cs",
      settings = {},
    },
    sql = {
      filetype = "sql",
      settings = {},
    },
    html = {
      filetype = "tml",
      settings = {},
    },
    css = {
      filetype = "css",
      settings = {},
    },
    javascript = {
      filetype = "javascript",
      settings = {},
    },
    typescript = {
      filetype = "typescript",
      settings = {},
    },
    php = {
      filetype = "php",
      settings = {},
    },
    ruby = {
      filetype = "ruby",
      settings = {},
    },
    perl = {
      filetype = "perl",
      settings = {},
    },
    java = {
      filetype = "java",
      settings = {},
    },
    rust = {
      filetype = "rust",
      settings = {},
    },
    solidity = {
      filetype = "solidity",
      settings = {},
    },
    go = {
      filetype = "go",
      settings = {},
    },
    bash = {
      filetype = "sh",
      settings = {},
    },
    log = {
      filetype = "html",
      settings = {},
    },
    hugo = {
      filetype = "html",
      settings = {},
    },
    latex = {
      filetype = "tex",
      settings = {},
    },
    markdown = {
      filetype = "md",
      settings = {},
    },
    yaml = {
      filetype = "yaml",
      settings = {},
    },
    json = {
      filetype = "json",
      settings = {},
    },
    toml = {
      filetype = "toml",
      settings = {},
    },
    tmux = {
      filetype = "",
      settings = {},
    },
  }
end

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
