local M = {}

M.load_default_options = function()
  local utils = require("dvim.utils")
  local join_paths = utils.join_paths

  local undodir = join_paths(get_cache_dir(), "undo")

  if not utils.is_directory(undodir) then
    vim.fn.mkdir(undodir, "p")
  end

  local default_options = {
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 2, -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = true, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
    smarttab = true, -- <tab>/<BS> indent/dedent in leading whitespace
    smartcase = true, -- don't ignore case in searches if uppercase characters present
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- open horizontal splits below current window
    splitright = true, -- open vertical splits to the right of the current window
    swapfile = false, -- don't create swap files
    timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- actually use undo files
    updatetime = 2000, -- CursorHold interval
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    numberwidth = 2, -- set number column width to 2 {default 4}
    tabstop = 2, -- spaces per tab
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- don't display lines as one long line
    scrolloff = 8, -- scroll when you are 8 lines away from the top/bottom
    cursorline = true, -- highlight the current line
    laststatus = 3, -- make statusline cover the entire bottom
    spell = false, -- don't turn on spell check by default
    autoindent = true, -- maintain indent of current line
    backspace = "indent,start,eol", -- allow unrestricted backspacing in insert mode
    backupcopy = "yes", -- overwrite files to update, instead of renaming + rewriting
    backupskip = vim.opt.backupskip + "*.re,*.rei", -- prevent bsb's watch mode from getting confused (if 'backup' is ever set)
    belloff = "all", -- never ring the bell for any reason
    diffopt = vim.opt.diffopt + "foldcolumn:0", -- don't show fold column in diff view
    directory = get_cache_dir() .. "/swap/", -- fallback
    emoji = false, -- don't assume all emoji are double width
    expandtab = true, -- always use spaces instead of tabs
    fillchars = {
      diff = "∙", -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
      eob = " ", -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
      fold = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
      vert = "┃", -- BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
    },
    foldlevelstart = 99, -- start all buffers unfolded
    foldexpr = "nvim_treesitter#foldexpr()",
    foldmethod = "expr", -- not as cool as syntax, but faster
    foldtext = "v:lua.foldtext()", -- nice folding style
    formatoptions = vim.opt.formatoptions + "jn", -- j: remove comment leader when joining comment lines, n: smart auto-indenting inside numbered lists
    hidden = true, -- allows you to hide buffers with unsaved changes without being prompted
    inccommand = "split", -- live preview of :s results
    joinspaces = false, -- don't autoinsert two spaces after '.', '?', '!' for join command
    lazyredraw = true, -- don't bother updating screen during macro playback
    linebreak = true, -- wrap long lines at characters in 'breakat'
    list = true, -- show whitespace
    listchars = {
      nbsp = "⦸", -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
      extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
      precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
      tab = "▷⋯", -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
      trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
    },
    modelines = 5, -- scan this many lines looking for modeline
    pumblend = 10, -- pseudo-transparency for popup-menu
    shell = "sh", -- shell to use for `!`, `:!`, `system()` etc.
    shiftround = false, -- don't always indent by multiple of shiftwidth
    shiftwidth = 2, -- spaces per tab (when shifting)
    showbreak = "↳ ", -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
    showcmd = false, -- don't show extra info at end of command line
    sidescroll = 0, -- sidescroll in jumps because terminals are slow
    sidescrolloff = 3, -- same as scrolloff, but for columns
    spellcapcheck = "", -- don't check for capital letters at start of sentence
    suffixes = vim.opt.suffixes - ".h", -- don't sort header files at lower priority
    switchbuf = "usetab", -- try to reuse windows/tabs when switching buffers
    synmaxcol = 200, -- don't bother syntax highlighting long lines
    termguicolors = true, -- use guifg/guibg instead of ctermfg/ctermbg in terminal
    textwidth = 0, -- disable any automatic hard warpping
    updatecount = 0, -- update swapfiles every 80 typed chars
    viewdir = get_cache_dir() .. "/view", -- where to store files for :mkview
    viewoptions = "cursor,folds", -- save/restore just these (with `:{mk,load}view`)
    virtualedit = "block", -- allow cursor to move where there is no text in visual block mode
    visualbell = true, -- stop annoying beeping for non-error errors
    whichwrap = "b,h,l,s,<,>,[,],~", -- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
    wildcharm = 26, -- ('<C-z>') substitute for 'wildchar' (<Tab>) in macros
    wildignore = vim.opt.wildignore + "*.o,*.rej,*.so", -- patterns to ignore during file-navigation
    wildmenu = true, -- show options as list when switching buffers etc
    wildmode = "longest:full,full", -- shell-like autocomplete to unambiguous portion
    winblend = 10, -- psuedo-transparency for floating windows
  }

  ---  SETTINGS  ---
  vim.opt.whichwrap:append("<,>,[,],h,l")

  vim.opt.shortmess = vim.opt.shortmess + "A" -- ignore annoying swapfile messages
  vim.opt.shortmess = vim.opt.shortmess + "I" -- no splash screen
  vim.opt.shortmess = vim.opt.shortmess + "O" -- file-read message overwrites previous
  vim.opt.shortmess = vim.opt.shortmess + "T" -- truncate non-file messages in middle
  vim.opt.shortmess = vim.opt.shortmess + "W" -- don't echo "[w]"/"[written]" when writing
  vim.opt.shortmess = vim.opt.shortmess + "a" -- use abbreviations in messages eg. `[RO]` instead of `[readonly]`
  vim.opt.shortmess = vim.opt.shortmess + "c" -- completion messages
  vim.opt.shortmess = vim.opt.shortmess + "o" -- overwrite file-written messages
  vim.opt.shortmess = vim.opt.shortmess + "t" -- truncate file messages at start

  for k, v in pairs(default_options) do
    vim.opt[k] = v
  end
end

M.load_defaults = function()
  if #vim.api.nvim_list_uis() == 0 then
    M.load_headless_options()
    return
  end
  M.load_default_options()
end

M.load_filetype_defaults = function(settings)
  for k, v in pairs(settings) do
    vim.opt[k] = v
  end
end

return M
