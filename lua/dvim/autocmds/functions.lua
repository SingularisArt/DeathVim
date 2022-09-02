local autocmds = {}
local utils = require("dvim.utils")

local ownsyntax_flag = "wincent_ownsyntax"
local number_flag = "wincent_number"

local focused_colorcolumn = utils.join(utils.range(80, 255), ",")

local winhighlight_blurred = table.concat({
  "CursorLineNr:LineNr",
  "EndOfBuffer:ColorColumn",
  "IncSearch:ColorColumn",
  "Normal:ColorColumn",
  "NormalNC:ColorColumn",
  "Search:ColorColumn",
  "SignColumn:ColorColumn",
}, ",")

-- As described in a7e4d8b8383a375d124, `ownsyntax` resets spelling
-- settings, so we capture and restore them. Note that there is some trickiness
-- here because multiple autocmds can trigger "focus" or "blur" operations; this
-- means that we can't just naively save and restore: we have to use a flag to
-- make sure that we only capture the initial state.
local ownsyntax = function(active)
  local flag = vim.w[ownsyntax_flag]

  if active and flag == false then
    -- We are focussing; restore previous settings.
    vim.cmd("ownsyntax on")

    vim.wo.spell = vim.w.saved_spell or false
    vim.bo.spellcapcheck = vim.w.saved_spellcapcheck or ""
    vim.bo.spellfile = vim.w.saved_spellfile or ""
    vim.bo.spelllang = vim.w.saved_spelllang or "en"

    -- Set flag to show that we have restored the captured options.
    vim.w[ownsyntax_flag] = true
  elseif not active and vim.bo.filetype ~= "" and flag ~= false then
    -- We are blurring; save settings for later restoration.
    vim.w.saved_spell = vim.wo.spell
    vim.w.saved_spellcapcheck = vim.bo.spellcapcheck
    vim.w.saved_spellfile = vim.bo.spellfile
    vim.w.saved_spelllang = vim.bo.spelllang

    vim.cmd("ownsyntax off")

    -- Suppress spelling in blurred buffer.
    vim.wo.spell = false

    -- Set flag to show that we have captured options.
    vim.w[ownsyntax_flag] = false
  end
end

local should_mkview = function()
  return vim.bo.buftype == ""
      and autocmds.mkview_filetype_blacklist[vim.bo.filetype] == nil
      and vim.fn.exists("$SUDO_USER") == 0 -- Don't create root-owned files.
end

local focus_window = function()
  local filetype = vim.bo.filetype

  -- Turn on relative numbers, unless user has explicitly changed numbering.
  if filetype ~= "" and autocmds.number_blacklist[filetype] ~= true and vim.w[number_flag] == nil then
    vim.wo.number = true
    vim.wo.relativenumber = true
  end

  if filetype == "" or autocmds.winhighlight_filetype_blacklist[filetype] ~= true then
    vim.wo.winhighlight = ""
  end
  if filetype == "" or autocmds.colorcolumn_filetype_blacklist[filetype] ~= true then
    vim.opt.colorcolumn = focused_colorcolumn
  end
  if filetype == "" or autocmds.ownsyntax_filetypes[filetype] ~= true then
    ownsyntax(true)
  end
  if filetype == "" then
    vim.wo.list = true
  else
    local list = autocmds.list_filetypes[filetype]
    vim.wo.list = list == nil and true or list
  end
  local conceallevel = autocmds.conceallevel_filetypes[filetype] or 2
  vim.wo.conceallevel = conceallevel
  dvim.statusline.focus_statusline()
end

local blur_window = function()
  local filetype = vim.bo.filetype

  -- Turn off relative numbers (and turn on non-relative numbers), unless user
  -- has explicitly changed the numbering.
  if filetype ~= "" and autocmds.number_blacklist[filetype] ~= true then
    vim.wo.number = true
    vim.wo.relativenumber = false
  end

  if filetype == "" or autocmds.winhighlight_filetype_blacklist[filetype] ~= true then
    vim.wo.winhighlight = winhighlight_blurred
  end
  if filetype == "" or autocmds.ownsyntax_filetypes[filetype] ~= true then
    ownsyntax(false)
  end
  if filetype == "" then
    vim.wo.list = false
  else
    local list = autocmds.list_filetypes[filetype]
    if list == nil then
      vim.wo.list = false
    else
      vim.wo.list = list
    end
  end
  if filetype == "" or autocmds.conceallevel_filetypes[filetype] == nil then
    vim.wo.conceallevel = 0
  end
  dvim.statusline.blur_statusline()
end

-- http://vim.wikia.com/wiki/Make_views_automatic
local mkview = function()
  if should_mkview() then
    local success, err = pcall(function()
      if vim.fn.haslocaldir() == 1 then
        -- We never want to save an :lcd command, so hack around it...
        vim.cmd("cd -")
        vim.cmd("mkview")
        vim.cmd("lcd -")
      else
        vim.cmd("mkview")
      end
    end)
    if not success then
      if err:find("%f[%w]E32%f[%W]") == nil -- No file name; could be no buffer (eg. :checkhealth)
          and err:find("%f[%w]E186%f[%W]") == nil -- No previous directory: probably a `git` operation.
          and err:find("%f[%w]E190%f[%W]") == nil -- Could be name or path length exceeding NAME_MAX or PATH_MAX.
          and err:find("%f[%w]E5108%f[%W]") == nil
      then
        error(err)
      end
    end
  end
end

local set_cursorline = function(active)
  local filetype = vim.bo.filetype
  if autocmds.cursorline_blacklist[filetype] ~= true then
    vim.wo.cursorline = active
  end
end

autocmds.buf_enter = function()
  focus_window()
end

autocmds.buf_leave = function()
  mkview()
end

autocmds.buf_win_enter = function()
  if should_mkview() then
    vim.cmd("silent! loadview")
    vim.cmd("silent! " .. vim.fn.line(".") .. "foldopen!")
  end
end

autocmds.buf_write_post = function()
  mkview()
end

autocmds.focus_gained = function()
  focus_window()
end

autocmds.focus_lost = function()
  blur_window()
end

autocmds.insert_enter = function()
  set_cursorline(false)
end

autocmds.insert_leave = function()
  set_cursorline(true)
end

autocmds.vim_enter = function()
  set_cursorline(true)
  focus_window()
end

autocmds.win_enter = function()
  set_cursorline(true)
  focus_window()
end

autocmds.win_leave = function()
  set_cursorline(false)
  blur_window()
  mkview()
end

-- Don't use colorcolumn when these filetypes get focus (we want them to appear
-- full-width irrespective of 'textwidth').
autocmds.colorcolumn_filetype_blacklist = {
  ["CommandTMatchListing"] = true,
  ["CommandTPrompt"] = true,
  ["CommandTTitle"] = true,
  ["command-t"] = true,
  ["packer"] = true,
  ["diff"] = true,
  ["dirvish"] = true,
  ["fugitiveblame"] = true,
  ["undotree"] = true,
  ["qf"] = true,
  ["sagahover"] = true,
  ["tsplayground"] = true,
}

-- Don't mess with 'conceallevel' for these.
autocmds.conceallevel_filetypes = {
  ["dirvish"] = 2,
  ["help"] = 2,
  ["tsplayground"] = true,
}

autocmds.cursorline_blacklist = {
  ["CommandTMatchListing"] = true,
  ["CommandTPrompt"] = true,
  ["CommandTTitle"] = true,
  ["command-t"] = true,
  ["undotree"] = true,
  ["tsplayground"] = true,
}

-- Don't use 'winhighlight' to make these filetypes seem blurred.
autocmds.winhighlight_filetype_blacklist = {
  ["CommandTMatchListing"] = true,
  ["CommandTPrompt"] = true,
  ["CommandTTitle"] = true,
  ["packer"] = true,
  ["diff"] = true,
  ["fugitiveblame"] = true,
  ["undotree"] = true,
  ["qf"] = true,
  ["sagahover"] = true,
  ["tsplayground"] = true,
}

-- Force 'list' (when `true`) or 'nolist' (when `false`) for these.
autocmds.list_filetypes = {
  ["CommandTMatchListing"] = false,
  ["CommandTPrompt"] = false,
  ["CommandTTitle"] = false,
  ["command-t"] = false,
  ["packer"] = false,
  ["help"] = false,
  ["undotree"] = true,
  ["tsplayground"] = true,
}

autocmds.mkview_filetype_blacklist = {
  ["diff"] = true,
  ["gitcommit"] = true,
  ["hgcommit"] = true,
  ["undotree"] = true,
}

-- Don't mess with numbers in these filetypes.
autocmds.number_blacklist = {
  ["CommandTMatchListing"] = true,
  ["CommandTPrompt"] = true,
  ["CommandTTitle"] = true,
  ["command-t"] = true,
  ["packer"] = true,
  ["diff"] = true,
  ["fugitiveblame"] = true,
  ["help"] = true,
  ["qf"] = true,
  ["sagahover"] = true,
  ["undotree"] = true,
  ["tsplayground"] = true,
}

-- Don't do "ownsyntax on/off" for these.
autocmds.ownsyntax_filetypes = {
  ["CommandTMatchListing"] = true,
  ["CommandTPrompt"] = true,
  ["CommandTTitle"] = true,
  ["packer"] = true,
  ["NvimTree"] = true,
  ["dirvish"] = true,
  ["help"] = true,
  ["qf"] = true,
  ["undotree"] = true,
  ["diff"] = true,
  ["tsplayground"] = true,
}

return autocmds
