local wk = require('which-key').setup{
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local wk = require('which-key')

-------------------------
-- Single key mappings --
-------------------------

wk.register({
  e = { '<cmd>NvimTreeToggle<CR>',  'Toggle NeoVim Tree' },
  v = { '<cmd>vsplit<CR>',          'Vertical Split' },
  s = { '<cmd>split<CR>',           'Horizontal Split' },
  o = { '<cmd>only<CR>',            'Tab only' },
  n = { '<cmd>tabnew<CR>',          'New tab' },
  k = { '<cmd>bdelete<CR>',         'Delete buffer'},
  d = { '<cmd>Dashboard<CR>',       'Toggle Dashboard' },
  h = { '<cmd>nohl<CR>',            'Clear search highlights' },
  y = { '<Plug>(easymotion-bd-f)',  'Easymotion' },
  f = "which_key_ignore",
}, { prefix = "<leader>" })

------------------
-- Git Mappings --
------------------

wk.register({
  g = {
    name = 'Git',
    s = { '<cmd>Git<CR>',               'Status' },
    a = { '<cmd>Git add .<CR>',         'Add' },
    g = { '<cmd>Git log<CR>',           'Log' },
    p = { '<cmd>Git push<CR>',          'Push' },
    P = { '<cmd>Git pull<CR>',          'Pull' },
    m = { '<cmd>Git merge<CR>',         'Merge' },
    l = { '<cmd>LazyGit<CR>',           'LazyGit' },
    f = { '<cmd>LazyGitFilter<CR>',     'LazyGitFilter' },
  },
}, { prefix = "<leader>" })

----------------------
-- Minimap Mappings --
----------------------

wk.register({
  i = {
    name = 'Mini Map',
    c = { '<cmd>MinimapClose<CR>',              'Close Minimap' },
    o = { '<cmd>MinimapOpen<CR>',               'Open Minimap' },
    r = { '<cmd>MinimapRefresh<CR>',            'Refresh Minimap' },
    t = { '<cmd>MinimapToggle<CR>',             'Toggle Minimap' },
  },
}, { prefix = "<leader>" })

---------------------
-- Plugin Mappings --
---------------------

wk.register({
  p = {
    name = 'Packer',
    i = { '<cmd>PackerInstall<CR>',   'Install  plugins'},
    u = { '<cmd>PackerUpdate<CR>',    'Update   plugins'},
    c = { '<cmd>PackerClean<CR>',     'Clean    plugins'},
    l = { '<cmd>PackerLoad<CR>',      'Load     plugins'},
    s = { '<cmd>PackerSync<CR>',      'Sync     plugins'},
    p = { '<cmd>PackerProfile<CR>',   'Profile  plugins'},
  },
}, { prefix = "<leader>" })

----------------
-- Commenting --
----------------

wk.register({
  n = {
    name = 'Nerd Commenter',
    c = { '<cmd>call nerdcommenter#Comment(0, "comment")<CR>',      'Comment'},
    u = { '<cmd>call nerdcommenter#Comment(0, "uncomment")<CR>',    'Un-Comment'},
  },
}, { prefix = "<leader>" })

---------------
-- Translate --
---------------

wk.register({
  r = {
    name = 'Translator',
    t = { '<cmd>Translate<CR>',      'Translate'},
    w = { '<cmd>TranslateW<CR>',     'Translate output to screen'},
    r = { '<cmd>TranslateR<CR>',     'Translate output to file'},
  },
}, { prefix = "<leader>" })

--------------
-- Markdown --
--------------

wk.register({
  m = {
    name = 'Markdown',
    p = { '<cmd>MarkdownPreview<CR>',      'View Markdown'},
  },
}, { prefix = "<leader>" })

-----------
-- Table --
-----------

wk.register({
  t = {
    name = 'Table',
    t = { '<cmd>TableModeToggle<CR>',      'Toggle Table Mode' },
    a = {
      name = 'Add',
      f = { '<cmd>TableAddFormula<CR>',    'Add formula' },
    },
    d = {
      name = 'Delete',
      r = { '<Leader>tdr',                 'Delete Table Row' },
      c = { '<Leader>tdc',                 'Delete Table Column' },
    },
    i = {
      name = 'Insert',
      c = { '<Leader>tic',                 'Insert Table Column' },
    },
  },
}, { prefix = "<leader>" })

------------
-- VimTex --
------------

wk.register({
  l = {
    name = 'VimTex',
    c = { '<cmd>VimtexCompile<CR>',               'Compile VimTex File'},
    s = { '<cmd>VimtexCompileSelected<CR>',       'Compile selected'},
    i = { '<cmd>VimtexInfo<CR>',                  'Show VimTex info'},
    t = { '<cmd>VimtexTocToggle<CR>',             'Show VimTex table of content'},
    v = { '<cmd>VimtexView<CR>',                  'Show VimTex compiled using zahtura'},
  },
}, { prefix = "<leader>" })

---------------
-- Telescope --
---------------

wk.register({
  f = {
    name = 'Telescope',
    f = { '<cmd>Telescope find_files<CR>',        'Browse files'},
    c = { '<cmd>Telescope colorscheme<CR>',       'Browse colorschemes'},
    c = { '<cmd>Telescope buffers<CR>',           'Browse buffers'},
    o = { '<cmd>Telescope commands<CR>',          'Browse commands'},
    q = { '<cmd>Telescope quick_fix<CR>',         'Browse quick fix list'},
    g = {
      name = 'Git',
      s = { '<cmd>Telescope git_status<CR>',      'Browse git status for each file'},
      f = { '<cmd>Telescope git_files<CR>',       'Browse git files'},
      c = { '<cmd>Telescope git_commits<CR>',     'Browse git commits'},
      b = { '<cmd>Telescope git_branches<CR>',    'Browse git branches'},
      t = { '<cmd>Telescope git_stash<CR>',       'Browse git stash'},
    },
  },
}, { prefix = "<leader>" })
