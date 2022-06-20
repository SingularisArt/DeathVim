local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smarttab = true, -- <tab>/<BS> indent/dedent in leading whitespace
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 2, -- set number column width to 2 {default 4}
  tabstop = 2, -- spaces per tab
  shiftwidth = 2, -- spaces per tab
  expandtab = true, -- spaces per tab
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- don't display lines as one long line
  scrolloff = 8, -- scroll when you are 8 lines away from the top/bottom
  -- spell = true,                            -- turn on spell check
}

vim.cmd('set rtp+=~/Documents/notes/school-notes/current-course')

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[
set whichwrap+=<,>,[,],h,l
set iskeyword+=-
set formatoptions-=cro
]]
