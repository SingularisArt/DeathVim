local M = {}

function M.get(cp)
  return {
    BufferLineFill = { fg = cp.black3, bg = cp.black3 },
    BufferLineBackground = { fg = cp.gray0, bg = cp.black3 },
    BufferLineBufferVisible = { fg = cp.gray0, bg = cp.black2 },
    BufferLineBufferSelected = { fg = cp.white, bg = cp.black2, style = "italic" },
    BufferLineTabSelected = { fg = cp.red, bg = cp.blue },
    BufferLineTabClose = { fg = cp.red, bg = cp.black3 },
    BufferLineIndicatorSelected = { fg = cp.peach, bg = cp.black2 },
    BufferLineModified = { bg = cp.black3 },
    BufferLineModifiedVisible = { bg = cp.black2 },
    BufferLineSeparator = { fg = cp.black3, bg = cp.black3 },
    BufferLineSeparatorVisible = { fg = cp.black3, bg = cp.black3 },
    BufferLineSeparatorSelected = { fg = cp.black3, bg = cp.black3 },
    BufferLineCloseButton = { fg = cp.black4, bg = cp.black3 },
    BufferLineCloseButtonVisible = { fg = cp.black4, bg = cp.black2 },
    BufferLineCloseButtonSelected = { fg = cp.gray0, bg = cp.black2 },
  }
end

return M

