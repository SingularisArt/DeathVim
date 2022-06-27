local M = {}

M.config = function()
  dvim.builtin.plugins.which_key.setup = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = dvim.builtin.plugins.which_key.spelling.enabled,
        suggestions = dvim.builtin.plugins.which_key.spelling.suggestions,
      },
      presets = {
        operators = dvim.builtin.plugins.which_key.presets.operators,
        motions = dvim.builtin.plugins.which_key.presets.motions,
        text_objects = dvim.builtin.plugins.which_key.presets.text_objects,
        windows = dvim.builtin.plugins.which_key.presets.windows,
        nav = dvim.builtin.plugins.which_key.presets.nav,
        z = dvim.builtin.plugins.which_key.presets.z,
        g = dvim.builtin.plugins.which_key.presets.g,
      }
    },
  }

  dvim.builtin.plugins.which_key.opts = { prefix = "<leader>" }
  dvim.builtin.plugins.which_key.vopts = { prefix = "<leader>" }

  -- Visual mappings
  dvim.builtin.plugins.which_key.vmappings = {}
  -- Normal mappings
  dvim.builtin.plugins.which_key.mappings = {
    e = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree" },
    v = { "<cmd>vsplit<CR>", "Vertical Split" },
    h = { "<cmd>split<CR>", "Horizontal Split" },
    o = { "<cmd>only<CR>", "Tab only" },
    y = { "<Plug>(easymotion-bd-f)", "Easymotion" },
    u = { "<cmd>SymbolsOutline<CR>", "Toggle Symbols Outline" },
    j = "which_key_ignore",
    k = "which_key_ignore",

    g = {
      name = "Git",
      s = { "<cmd>Git<CR>", "Status" },
      a = { "<cmd>Git add .<CR>", "Add" },
      d = { "<cmd>Git diff<CR>", "Diff" },
      c = { "<cmd>Git commit<CR>", "Commit" },
      p = { "<cmd>Git push<CR>", "Push" },
      P = { "<cmd>Git pull<CR>", "Pull" },
      l = { "<cmd>Git log<CR>", "Log" },
      L = { "<cmd>LazyGit<CR>", "LazyGit" },
      f = { "<cmd>LazyGitFilter<CR>", "LazyGitFilter" },
    },

    p = {
      name = "Packer",
      i = { "<cmd>PackerInstall<CR>", "Install Plugins" },
      u = { "<cmd>PackerUpdate<CR>", "Update Plugins" },
      c = { "<cmd>PackerClean<CR>", "Clean Plugins" },
      l = { "<cmd>PackerLoad<CR>", "Load Plugins" },
      s = { "<cmd>PackerSync<CR>", "Sync Plugins" },
      p = { "<cmd>PackerProfile<CR>", "Profile  Plugins" },
    },

    T = {
      name = "Translator",
      t = { "<cmd>Translate<CR>", "Translate" },
      w = { "<cmd>TranslateW<CR>", "Translate output to screen" },
      r = { "<cmd>TranslateR<CR>", "Translate output to file" },
    },

    m = {
      name = "Markdown",
      p = { "<cmd>MarkdownPreview<CR>", "View Markdown" },
    },

    t = {
      name = "Table",
      t = { "<cmd>TableModeToggle<CR>", "Enable/Disable Table Mode" },
      n = { "<Leader>ti", "Get cell info" },
      f = {
        name = "Formula",
        a = { "<cmd>TableAddFormula<CR>", "Add formula" },
        e = { "<Leader>tfe", "Evaluate formula on current row" },
      },
      d = {
        name = "Delete",
        r = { "<Leader>tdr", "Delete row" },
        c = { "<Leader>tdc", "Delete column" },
      },
      i = {
        name = "Insert",
        c = { "<Leader>tic", "Insert column" },
      },
    },

    l = {
      name = "VimTex",
      m = { "<cmd>VimtexContextMenu<CR>", "Open Context Menu" },
      u = { "<cmd>VimtexCountLetters<CR>", "Count Letters" },
      w = { "<cmd>VimtexCountWords<CR>", "Count Words" },
      d = { "<cmd>VimtexDocPackage<CR>", "Open Doc for package" },
      e = { "<cmd>VimtexErrors<CR>", "Look at the errors" },
      s = { "<cmd>VimtexStatus<CR>", "Look at the status" },
      a = { "<cmd>VimtexToggleMain<CR>", "Toggle Main" },
      v = { "<cmd>VimtexView<CR>", "View pdf" },
      i = { "<cmd>VimtexInfo<CR>", "Vimtex Info" },
      l = {
        name = "Clean",
        l = { "<cmd>VimtexClean<CR>", "Clean Project" },
        c = { "<cmd>VimtexClean<CR>", "Clean Cache" },
      },
      c = {
        name = "Compile",
        c = { "<cmd>VimtexCompile<CR>", "Compile Project" },
        o = { "<cmd>VimtexCompileOutput<CR>", "Compile Project and Show Output" },
        s = { "<cmd>VimtexCompileSS<CR>", "Compile project super fast" },
        e = { "<cmd>VimtexCompileSelected<CR>", "Compile Selected" },
      },
      r = {
        name = "Reload",
        r = { "<cmd>VimtexReload<CR>", "Reload" },
        s = { "<cmd>VimtexReloadState<CR>", "Reload State" },
      },
      o = {
        name = "Stop",
        p = { "<cmd>VimtexStop<CR>", "Stop" },
        a = { "<cmd>VimtexStopAll<CR>", "Stop All" },
      },
      t = {
        name = "TOC",
        o = { "<cmd>VimtexTocOpen<CR>", "Open TOC" },
        t = { "<cmd>VimtexTocToggle<CR>", "Toggle TOC" },
      },
    },

    f = {
      name = "Telescope",
      f = {
        "<cmd>Telescope find_files<CR>",
        "Fuzzy Find Files",
      },
      g = {
        name = "Git",
        s = {
          "<cmd>Telescope git_status<CR>",
          "Git Status",
        },
        f = {
          "<cmd>Telescope git_files<CR>",
          "Git Files",
        },
        c = {
          "<cmd>Telescope git_commits<CR>",
          "Commits",
        },
        b = {
          "<cmd>Telescope git_branches<CR>",
          "Branches",
        },
        t = {
          "<cmd>Telescope git_stash<CR>",
          "Stash",
        },
      },
    },

    d = {
      name = "Debug",
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    },

    s = {
      name = "LSP",
      h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Documentation" },
      c = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Show code actions" },
      e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show line diagnostics" },
      q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Show QuickFix" },
      f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Go to implementation" },
      j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
      k = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to previous diagnostic" },
      C = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close all windows" },
      d = {
        name = "Definition",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Find references" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Get type definition" },
        p = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "View definition in pop-up" },
      },
      w = {
        name = "Workspace",
        a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()", "Add workspace" },
        r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()", "Remove workspace" },
      },
    },

    b = {
      name = "Buffers",
      p = { "<cmd>BufferLinePick<CR>", "Pick buffer" },
      c = {
        name = "Close",
        l = { "<cmd>BufferLineCloseLeft", "Close all buffers to the left" },
        r = { "<cmd>BufferLineCloseRight", "Close all buffers to the right" },
      },
      m = {
        name = "Move",
        n = { "<cmd>BufferLineMoveNext", "Move buffer next" },
        p = { "<cmd>BufferLineMovePrev", "Move buffer previous" },
      },
      s = {
        name = "Sort",
        d = { "<cmd>BufferLineSortByDirectory", "Sort by directory" },
        e = { "<cmd>BufferLineSortByExtension", "Sort by extension" },
        r = { "<cmd>BufferLineSortByRelativeDirectory", "Sort by relative directory" },
        t = { "<cmd>BufferLineSortByTabs", "Sort by tabs" },
      },
    },
  }
end

M.setup = function()
  M.config()
  local wk = require("which-key")
  wk.setup(dvim.builtin.plugins.which_key.setup)

  wk.register(dvim.builtin.plugins.which_key.mappings, dvim.builtin.plugins.which_key.opts)
  wk.register(dvim.builtin.plugins.which_key.vmappings, dvim.builtin.plugins.which_key.vopts)
end

return M
