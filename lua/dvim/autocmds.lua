local M = {}

function M.load_defaults()
  local definitions = {
    {
      "FileType",
      {
        pattern = { "markdown" },
        callback = function()
          vim.opt.conceallevel = 3
          vim.opt.wrap = true
        end,
      },
    },

    {
      "BufEnter",
      {
        callback = function()
          vim.cmd([[
            if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
            normal zz
          ]])
        end,
      },
    },

    {
      "BufEnter",
      {
        callback = function()
          if vim.bo.filetype == "tex" then
            vim.opt.showtabline = 0
            vim.opt.laststatus = 0
            vim.opt.conceallevel = 1
          elseif vim.bo.filetype == "markdown" then
            vim.opt.showtabline = 2
            vim.opt.laststatus = 2
            vim.opt.conceallevel = 3
          else
            vim.opt.showtabline = 2
            vim.opt.laststatus = 2
            vim.opt.conceallevel = 0
          end
        end,
      },
    },

    {
      "User",
      {
        pattern = { "AlphaReady" },
        callback = function()
          vim.cmd([[
            set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
          ]])
        end,
      },
    },

    {
      "VimResized",
      {
        callback = function()
          vim.cmd("tabdo wincmd =")
        end,
      },
    },

    {
      "TextYankPost",
      {
        callback = function()
          vim.highlight.on_yank({ higroup = "Visual", timeout = 100 })
        end,
      },
    },

    {
      "CursorMoved",
      {
        callback = function()
          if vim.bo.filetype ~= "tex" then
            require("dvim.core.plugins.winbar").setup()
          end
        end
      },
    },
  }

  M.define_autocmds(definitions)
end

local get_format_on_save_opts = function()
  local defaults = require("dvim.config.defaults").format_on_save
  -- accept a basic boolean `dvim.format_on_save=true`
  if type(dvim.format_on_save) ~= "table" then
    return defaults
  end

  return {
    pattern = dvim.format_on_save.pattern or defaults.pattern,
    timeout = dvim.format_on_save.timeout or defaults.timeout,
  }
end

function M.enable_format_on_save()
  local opts = get_format_on_save_opts()
  vim.api.nvim_create_augroup("lsp_format_on_save", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "lsp_format_on_save",
    pattern = opts.pattern,
    callback = function()
      require("dvim.lsp.utils").format({ timeout_ms = opts.timeout, filter = opts.filter })
    end,
  })
end

function M.disable_format_on_save()
  M.clear_augroup("lsp_format_on_save")
end

function M.configure_format_on_save()
  if dvim.format_on_save then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

function M.toggle_format_on_save()
  local exists, autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = "lsp_format_on_save",
    event = "BufWritePre",
  })
  if not exists or #autocmds == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

function M.enable_transparent_mode()
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      local hl_groups = {
        "Normal",
        "SignColumn",
        "NormalNC",
        "TelescopeBorder",
        "NvimTreeNormal",
        "EndOfBuffer",
        "MsgArea",
      }
      for _, name in ipairs(hl_groups) do
        vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
      end
    end,
  })
  vim.opt.fillchars = "eob: "
end

--- Clean autocommand in a group if it exists
--- This is safer than trying to delete the augroup itself
---@param name string the augroup name
function M.clear_augroup(name)
  -- defer the function in case the autocommand is still in-use
  local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = name })
  if not exists then
    return
  end
  vim.schedule(function()
    local _, _ = xpcall(function()
      vim.api.nvim_clear_autocmds({ group = name })
    end, debug.traceback)
  end)
end

--- Create autocommand groups based on the passed definitions
--- Also creates the augroup automatically if it doesn't exist
---@param definitions table contains a tuple of event, opts, see `:h nvim_create_autocmd`
function M.define_autocmds(definitions)
  for _, entry in ipairs(definitions) do
    local event = entry[1]
    local opts = entry[2]
    if type(opts.group) == "string" and opts.group ~= "" then
      local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
      if not exists then
        vim.api.nvim_create_augroup(opts.group, {})
      end
    end
    vim.api.nvim_create_autocmd(event, opts)
  end
end

return M
