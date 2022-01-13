local wk = require('which-key')

-------------------------
-- Single key mappings --
-------------------------

wk.register({
  e = { '<cmd>NvimTreeToggle<CR>',  'Toggle NeoVim Tree' },
  v = { '<cmd>vsplit<CR>',          'Vertical Split' },
  h = { '<cmd>split<CR>',           'Horizontal Split' },
  o = { '<cmd>only<CR>',            'Tab only' },
  d = { '<cmd>Dashboard<CR>',       'Toggle Dashboard' },
  y = { '<Plug>(easymotion-bd-f)',  'Easymotion' },
  f = "which_key_ignore",
  c = "which_key_ignore",
}, { prefix = "<leader>" })

------------------
-- Git Mappings --
------------------

wk.register({
  g = {
    name = 'Git',
    s = { '<cmd>Git<CR>',               'Status' },
    a = { '<cmd>Git add .<CR>',         'Add'},
    d = { '<cmd>Git diff<CR>',          'Diff'},
    c = { '<cmd>Git commit<CR>',        'Commit'},
    p = { '<cmd>Git push<CR>',          'Push'},
    P = { '<cmd>Git pull<CR>',          'Pull'},
    l = { '<cmd>Git log<CR>',           'Log'},
    L = { '<cmd>LazyGit<CR>',           'LazyGit'},
    f = { '<cmd>LazyGitFilter<CR>',     'LazyGitFilter'},
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
    f = {
      name = 'Find',
      f = { '<cmd>Telescope find_files<CR>',                                              'Fuzzy Find Files' },
      b = { '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>',   'Browser Find Files' },
    },
    g = {
      name = 'Git',
      s = { '<cmd>Telescope git_status<CR>',                                              'Git Status' },
      f = { '<cmd>Telescope git_files<CR>',                                               'Git Files' },
      c = { '<cmd>Telescope git_commits<CR>',                                             'Commits' },
      b = { '<cmd>Telescope git_branches<CR>',                                            'Branches' },
      t = { '<cmd>Telescope git_stash<CR>',                                               'Stash' },
    },
  },
}, { prefix = "<leader>" })

---------
-- LSP --
---------

wk.register({
  s = {
    name = 'LSP',

  }
}, { prefix = "<leader>" })

-------------
-- Buffers --
-------------

wk.register({
  b = {
    name = 'Buffers',
    c = {
      name = 'Close',
      l = { '<cmd>BufferLineCloseLeft<CR>',                     'Close all buffers to the Left' },
      r = { '<cmd>BufferLineCloseRight<CR>',                    'Close all buffers to the Right' },
    },
    m = {
      name = 'Move',
      f = { '<cmd>BufferLineMoveNext<CR>',                      'Move buffer Forward' },
      b = { '<cmd>BufferLineMovePrev<CR>',                      'Move buffer Backward' },
    },
    s = {
      name = 'Sort',
      f = { '<cmd>BufferLineSortByDirectory<CR>',               'Sort by Directory' },
      e = { '<cmd>BufferLineSortByExtension<CR>',               'Sort by Extension' },
      r = { '<cmd>BufferLineSortByRelativeDirectory<CR>',       'Sort by Relative Directory' },
      t = { '<cmd>BufferLineSortByTabs<CR>',                    'Sort by Tabs' },
    },
    p = { '<cmd>BufferLinePick<CR>',                            'Pick buffer' },
  },
}, { prefix = "<leader>" })
