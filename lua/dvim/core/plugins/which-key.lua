local M = {}

M.config = function()
  dvim.builtin.plugins.which_key.setup = {
    layout = {
      align = dvim.builtin.plugins.which_key.layout.align,
    },
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
      },
    },
  }

  dvim.builtin.plugins.which_key.opts = { prefix = "<leader>" }
  dvim.builtin.plugins.which_key.vopts = { prefix = "<leader>" }

  -- Visual mappings
  dvim.builtin.plugins.which_key.vmappings = {}
  -- Normal mappings
  dvim.builtin.plugins.which_key.mappings["v"] = { "<cmd>vsplit<CR>", "Vertical Split" }
  dvim.builtin.plugins.which_key.mappings["h"] = { "<cmd>split<CR>", "Horizontal Split" }
  dvim.builtin.plugins.which_key.mappings["y"] = { "<Plug>(easymotion-bd-f)", "Easymotion" }
  dvim.builtin.plugins.which_key.mappings["u"] = { "<cmd>SymbolsOutline<CR>", "Toggle Symbols Outline" }
  dvim.builtin.plugins.which_key.mappings["j"] = "which_key_ignore"
  dvim.builtin.plugins.which_key.mappings["k"] = "which_key_ignore"
  dvim.builtin.plugins.which_key.mappings[" "] = { "<cmd>normal <C-^><CR>", "Jump to previous buffer" }

  if dvim.builtin.plugins.dirvish.active then
    dvim.builtin.plugins.which_key.mappings["e"] = { "<cmd>Dirvish<CR>", "Toggle Dirvish" }
  elseif dvim.builtin.plugins.nvimtree.active then
    dvim.builtin.plugins.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree" }
  elseif dvim.builtin.plugins.nerdtree.active then
    dvim.builtin.plugins.which_key.mappings["e"] = { "<cmd>NERDTreeToggle<CR>", "Toggle NerdTree" }
  end

  if dvim.builtin.plugins.bufferline.active then
    dvim.builtin.plugins.which_key.mappings["b"] = {
      name = "Buffers",
      p = { "<cmd>BufferLinePick<CR>", "Pick buffer" },
      c = {
        name = "Close",
        l = { "<cmd>BufferLineCloseLeft<CR>", "Close all buffers to the left" },
        r = { "<cmd>BufferLineCloseRight<CR>", "Close all buffers to the right" },
      },
      m = {
        name = "Move",
        n = { "<cmd>BufferLineMoveNext<CR>", "Move buffer next" },
        p = { "<cmd>BufferLineMovePrev<CR>", "Move buffer previous" },
      },
      s = {
        name = "Sort",
        d = { "<cmd>BufferLineSortByDirectory<CR>", "Sort by directory" },
        e = { "<cmd>BufferLineSortByExtension<CR>", "Sort by extension" },
        r = { "<cmd>BufferLineSortByRelativeDirectory<CR>", "Sort by relative directory" },
        t = { "<cmd>BufferLineSortByTabs<CR>", "Sort by tabs" },
      },
    }
  end

  if dvim.builtin.plugins.gitsigns.active then
    dvim.builtin.plugins.which_key.mappings["g"] = {
      name = "Git",
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
      },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      C = {
        "<cmd>Telescope git_bcommits<cr>",
        "Checkout commit(for current file)",
      },
      d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Git Diff",
      },
    }
  end

  if dvim.builtin.filetypes.markdown.active then
    dvim.builtin.plugins.which_key.mappings["m"] = {
      name = "Markdown",
      p = { "<cmd>MarkdownPreview<CR>", "View Markdown" },
    }
  end

  dvim.builtin.plugins.which_key.mappings["t"] = {
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
  }

  if dvim.builtin.filetypes.latex.active then
    dvim.builtin.plugins.which_key.mappings["l"] = {
      name = "LaTeX",
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
    }
  end

  if dvim.builtin.plugins.telescope.active then
    dvim.builtin.plugins.which_key.mappings["f"] = {
      name = "Telescope",
      f = { "<cmd>Telescope find_files<CR>", "Fuzzy find files" },
      o = { "<cmd>Telescope oldfiles<CR>", "Fuzzy find old files" },
      c = { "<cmd>Telescope colorscheme<CR>", "Fuzzy find colorschemes" },
      b = { "<cmd>Telescope buffers<CR>", "Fuzzy find buffers" },
      a = { "<cmd>Telescope autocommands<CR>", "Fuzzy find auto commands" },
      l = { "<cmd>Telescope live_grep<CR>", "Fuzzy find words" },
      m = { "<cmd>Telescope marks<CR>", "Fuzzy find marks" },
      n = { "<cmd>Telescope notify<CR>", "Fuzzy find notifications" },
      p = { "<cmd>Telescope projects<CR>", "Fuzzy find projects" },
      s = { "<cmd>Telescope symbols<CR>", "Fuzzy find symbols" },
      d = { "<cmd>Telescope diagnostics<CR>", "Fuzzy find diagnostics" },
      v = { "<cmd>Telescope vim_options<CR>", "Fuzzy find vim options" },
      M = { "<cmd>Telescope man_pages<CR>", "Fuzzy find man pages" },
      k = { "<cmd>Telescope keymaps<CR>", "Fuzzy find keymaps" },
      t = { "<cmd>Telescope treesitter<CR>", "Fuzzy find treesitter" },
      r = { "<cmd>Telescope registers<CR>", "Fuzzy find registers" },
      h = { "<cmd>Telescope help_tags<CR>", "Fuzzy find help tags" },
      S = { "<cmd>Telescope search_history<CR>", "Fuzzy find search history" },
      C = {
        name = "Commands",
        c = { "<cmd>Telescope commands<CR>", "Fuzzy find commands" },
        h = { "<cmd>Telescope command_history<CR>", "Fuzzy find commands history" },
      },
      q = {
        name = "QuickFix",
        q = { "<cmd>Telescope quickfix<CR>", "Fuzzy find quickfix" },
        h = { "<cmd>Telescope quickfixhistory<CR>", "Fuzzy find quickfix history" },
      },
    }
  end

  if dvim.builtin.plugins.dap.active then
    dvim.builtin.plugins.which_key.mappings["d"] = {
      name = "Debug",
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = {
        "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
        "Conditional Breakpoint",
      },
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
    }
  end

  if dvim.lsp.active then
    dvim.builtin.plugins.which_key.mappings["K"] = { vim.lsp.buf.hover, "Show hover" }
    dvim.builtin.plugins.which_key.mappings["s"] = {
      name = "LSP",
      c = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Show code actions" },
      e = {
        function()
          local config = dvim.lsp.diagnostics.float
          config.scope = "line"
          vim.diagnostic.open_float(0, config)
        end,
        "Show line diagnostics",
      },
      q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Show QuickFix" },
      f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Go to implementation" },
      j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
      k = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to previous diagnostic" },
      C = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close all windows" },
      l = { "<cmd>lua require('lsp_lines').toggle()<CR>", "Toggle LSP Lines" },
      d = {
        name = "Definition",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Find references" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Get type definition" },
        p = {
          function()
            require("dvim.lsp.peek").Peek("definition")
          end,
          "Peek definition",
        },
      },
      w = {
        name = "Workspace",
        a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add workspace" },
        r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove workspace" },
      },
    }
  end

  dvim.builtin.plugins.which_key.mappings["p"] = {
    name = "Packer",
    c = { "<cmd>PackerClean<CR>", "Clean Plugins" },
    C = { "<cmd>PackerCompile<CR>", "Compile Plugins" },
    i = { "<cmd>PackerInstall<CR>", "Install Plugins" },
    l = { "<cmd>PackerLoad<CR>", "Load Plugins" },
    p = { "<cmd>PackerProfile<CR>", "Profile Plugins" },
    t = { "<cmd>PackerStatus<CR>", "Plugins Status" },
    y = { "<cmd>PackerSync<CR>", "Sync Plugins" },
    u = { "<cmd>PackerUpdate<CR>", "Update Plugins" },
    s = {
      name = "Snapshot",
      s = { "<cmd>PackerSnapshot<CR>", "Snapshot Plugins" },
      d = { "<cmd>PackerSnapshotDelete<CR>", "Delete Snapshot Plugins" },
      r = { "<cmd>PackerSnapshotRollback<CR>", "Rollback Snapshot Plugins" },
    },
  }

  dvim.builtin.plugins.which_key.mappings["T"] = {
    name = "Translator",
    t = { "<cmd>Translate --engines=google<CR>", "Translate" },
    h = { "<cmd>TranslateH --engines=google<CR>", "Translate History" },
    l = { "<cmd>TranslateL --engines=google<CR>", "Translate Log" },
    r = { "<cmd>TranslateR --engines=google<CR>", "Translate" },
    w = { "<cmd>TranslateW --engines=google<CR>", "Translate and display in a Popup Window" },
    x = { "<cmd>TranslateX --engines=google<CR>", "Translate and Display in the cmdline" },
  }

  dvim.builtin.plugins.which_key.mappings["o"] = {
    name = "Only",
    o = {
      name = "Close",
      o = {
        "<cmd>wincmd _ | wincmd |<CR>",
        "Minimize all tabs (you can always bring them back with <Leader>oO)",
      },
      O = {
        "<cmd>only<CR>",
        "Close all tabs",
      },
    },
    O = { "<cmd>wincmd =<CR>", "Bring back the tabs" },
  }

  for index, value in pairs(dvim.builtin.plugins.which_key.user_mappings) do
    dvim.builtin.plugins.which_key.mappings[index] = value
  end
  for index, value in pairs(dvim.builtin.plugins.which_key.user_vmappings) do
    dvim.builtin.plugins.which_key.vmappings[index] = value
  end
end

M.setup = function()
  M.config()

  local which_key = require("which-key")
  which_key.setup(dvim.builtin.plugins.which_key.setup)

  local opts = dvim.builtin.plugins.which_key.opts
  local vopts = dvim.builtin.plugins.which_key.vopts

  local mappings = dvim.builtin.plugins.which_key.mappings
  local vmappings = dvim.builtin.plugins.which_key.vmappings

  which_key.register(mappings, opts)
  which_key.register(vmappings, vopts)
end

return M
