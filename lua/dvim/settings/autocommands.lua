------------------------------------------------------------------------
--                         FileType AutoCmds                          --
------------------------------------------------------------------------

-- Enable wrap and spell for markdown, git, and tex filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "git", "tex" },
  callback = function()
    vim.opt.wrap = true
    vim.opt.spell = true
  end,
})

------------------------------------------------------------------------
--                          Buffer AutoCmds                           --
------------------------------------------------------------------------

-- Something to do with NvimTree, I just don't know what...
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.cmd [[
      if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
      normal zz
    ]]
  end,
})

-- When in a tex file, remove statusbar and tabline, but in other filetypes,
-- enable them
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   callback = function()
--     if vim.bo.filetype == 'tex' then
--       vim.opt.showtabline=0
--       vim.opt.laststatus=0
--     else
--       -- vim.opt.showtabline=2
--       vim.opt.laststatus=2
--     end
--   end,
-- })

------------------------------------------------------------------------
--                           User AutoCmds                            --
------------------------------------------------------------------------

-- Removes statusbar and tabline from Alpha
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
    ]]
  end,
})

------------------------------------------------------------------------
--                           Other AutoCmds                           --
------------------------------------------------------------------------

-- I honestly don't know what this does...
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 100 }
  end,
})

-- Always go back to the line you quit on
vim.cmd [[
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
]]

vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost" }, {
  callback = function()
    require("dvim.config.winbar").get_winbar()
  end,
})
