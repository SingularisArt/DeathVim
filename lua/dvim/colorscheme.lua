local M = {}

M.apply_colorscheme = function(colorscheme)
  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not status_ok then
    return
  end
end

M.highlight_lsp = function()
  vim.cmd([[
    hi LspReferenceText gui=bold guibg=#353d46
    hi LspReferenceRead gui=bold guibg=#353d46
    hi LspReferenceWrite gui=bold guibg=#353d46
  ]])
end

M.edit_colors = function()
  local pinnacle = require("wincent.pinnacle")

  vim.cmd("highlight Comment " .. pinnacle.italicize("Comment"))

  -- Hide (or at least make less obvious) the EndOfBuffer region
  vim.cmd("highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg")

  -- Grey, just like we used to get with https://github.com/Yggdroot/indentLine
  vim.cmd("highlight clear Conceal")
  if dvim.color.dark then
    vim.cmd("highlight Conceal ctermfg=239 guifg=Grey30")
    vim.cmd("highlight IndentBlanklineChar guifg=Grey10 gui=nocombine")
  else
    vim.cmd("highlight Conceal ctermfg=249 guifg=Grey70")
    vim.cmd("highlight IndentBlanklineChar guifg=Grey90 gui=nocombine")
  end

  vim.cmd([[
    highlight clear NonText
    highlight link NonText Conceal
    highlight clear CursorLineNr
  ]])
  vim.cmd("highlight CursorLineNr " .. pinnacle.extract_highlight("DiffText"))
  vim.cmd([[
    highlight clear Pmenu
    highlight link Pmenu Visual

    " See :help 'pb'.
    highlight PmenuSel blend=0

    highlight clear DiffDelete
    highlight link DiffDelete Conceal
    highlight clear VertSplit
    highlight link VertSplit LineNr

    " Resolve clashes with ColorColumn.
    " Instead of linking to Normal (which has a higher priority, link to nothing).
    highlight link vimUserFunc NONE
  ]])

  -- For Git commits, suppress the background of these groups:
  for _, group in ipairs({ "DiffAdded", "DiffFile", "DiffNewFile", "DiffLine", "DiffRemoved" }) do
    local highlight = pinnacle.dump(group)
    highlight["bg"] = nil
    vim.cmd("highlight! clear " .. group)
    vim.cmd("highlight! " .. group .. " " .. pinnacle.highlight(highlight))
  end

  -- More subtle highlighting during merge conflict resolution.
  vim.cmd([[
    highlight clear DiffAdd
    highlight clear DiffChange
    highlight clear DiffText
  ]])

  vim.cmd("highlight User8 " .. pinnacle.italicize("ModeMsg"))
end

return M
