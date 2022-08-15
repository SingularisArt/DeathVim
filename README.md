<p align="center">💀 A Hackable, Fully Featured, Rice Friendly NeoVim Configuration 💀</p>

<p align="center">
  <a href="https://github.com/SingularisArt/Death.NeoVim/stargazers">
    <img alt="Stars" src="https://img.shields.io/github/stars/SingularisArt/Death.NeoVim?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"></a>
  <a href="https://github.com/SingularisArt/Death.NeoVim/issues">
    <img alt="Issues" src="https://img.shields.io/github/issues/SingularisArt/Death.NeoVim?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41"></a>
  <a href="https://github.com/SingularisArt/Death.NeoVim">
    <img alt="Repo Size" src="https://img.shields.io/github/repo-size/SingularisArt/Death.NeoVim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41"/></a>
  <a href="https://github.com/SingularisArt/Death.NeoVim">
    <img alt="License" src="https://img.shields.io/github/license/SingularisArt/Death.NeoVim?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"/></a>
</p>

<p align="center">
  <img src="https://stars.medv.io/SingularisArt/Death.NeoVim.svg", title="commits"/>
</p>

<p align="center">
  <img src="utils/images/logo.jpg", title="commits"/>
</p>

# Gallery

<p align="center">
  <img src="media/screenshot-01.png">
  <img src="media/screenshot-02.png">
  <img src="media/screenshot-03.png">
  <img src="media/screenshot-04.png">
  <img src="media/screenshot-05.png">
  <img src="media/screenshot-06.png">
  <img src="media/screenshot-07.png">
  <img src="media/screenshot-08.png">
  <img src="media/screenshot-09.png">
  <img src="media/screenshot-10.png">
</p>

# Features

- Install in one line of code (view [here](#installation) for more info).
- Blazingly fast.
- Written in 100% **Lua**.
- Easily able to install (view [here](#install-language-support) for more info):
  * LSP
  * Debuggers
  * Formatters
  * Linters
  * TreeSitter Parsers
- Git integration with [vim-fugitive](https://github.com/tpope/vim-fugitive)
  and [vim-gitgutter](https://github.com/airblade/vim-gitgutter).
- Multiple statuslines.
- Code snippets powered by [UltiSnips](https://github.com/SirVer/ultisnips).
- Dynamic homepage with [alpha-vim](https://github.com/goolord/alpha-nvim).
- Distraction free writing with
  [ZenMode](https://github.com/folke/zen-mode.nvim) and
  [Twilight](https://github.com/folke/twilight.nvim).
- Common sense keybindings.
- Uses [Which-Key](https://github.com/folke/which-key.nvim) so you never forget
  your keybindings.
- Super configurable (view [here](#configu) for more info).
- Already comes with dozens of builtin stuff (view
  [here](https://github.com/SingularisArt/DeathVim/wiki/Builtin) for more
  info).
- Comes with a simple, intuitive config file (view [here](#config-file) for
  more info).

# Installation

```sh
bash <(curl -s https://raw.githubusercontent.com/SingularisArt/Death.NeoVim/master/utils/installer/installer.sh)
```

## Install Language Support

View [here](https://github.com/williamboman/mason.nvim/blob/main/PACKAGES.md)
for all the supported:

- **Language Servers**.
- **Debuggers**.
- **Formatters**.
- **Linters**.

View
[here](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
for all the supported **TreeSitter Parsers**.

- Run `:MasonInstall` followed by the **language server** to install.
- Run `:MasonInstall` followed by the **debugger** to install.
- Run `:MasonInstall` followed by the **formatter** to install.
- Run `:MasonInstall` followed by the **linter** to install.
- Run `:TSInstall` followed by the **TreeSitter parser** to install.

# Usage

## Keybindings

<details><summary><code>Basic Key-Bindings</code></summary>
<p>
  
| Function                                | Keybind           |
| --------------------------------------- | ---------------   |
| Leader Key                              | `SPACE`           |
| Create a new tab                        | `Ctrl+t`          |
| Remove the current tab                  | `Ctrl+w`          |
| Toggle QuickFix                         | `Right Arrow`     |
| Close QuickFix                          | `Left Arrow`      |
| Previous QuickFix item                  | `Up Arrow`        |
| Next QuickFix item                      | `Down Arrow`      |
| Format file                             | `Ctrl+s`          |
| Correct a misspelled word               | `Ctrl+l`          |
| Create a vertical split                 | `<Leader>+v`      |
| Create a horizontal split               | `<Leader>+h`      |
| Close all splits                        | `<Leader>+o`      |
| Highlight everything                    | `Ctrl+a`          |
| Move text up                            | `J` (VISUAL MODE) |
| Move text down                          | `K` (VISUAL MODE) |
| Move text up                            | `<Leader>j`       |
| Move text down                          | `<Leader>k`       |
| Open NvimTree                           | `<Leader>e`       |
| Toggle easymotion                       | `<Leader>y`       |
| Toggle SymbolsOutline                   | `<Leader>u`       |

</p>
</details>

<details><summary><code>Packer</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Install plugins                         | `<Leader>pi`    |
| Update plugins                          | `<Leader>pu`    |
| Clean plugins                           | `<Leader>pc`    |
| Load plugins                            | `<Leader>pl`    |
| Sync plugins                            | `<Leader>ps`    |
| Bring profile                           | `<Leader>pp`    |

</p>
</details>

<details><summary><code>Buffers</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Pick from the buffers                   | `<Leader>bp`    |
| Close all buffers to the left           | `<Leader>bcl`   |
| Close all buffers to the right          | `<Leader>bcr`   |
| Move buffer next                        | `<Leader>bmn`   |
| Move buffer previous                    | `<Leader>bmp`   |
| Sort buffers by directory               | `<Leader>bsd`   |
| Sort buffers by extension               | `<Leader>bse`   |
| Sort buffers by relative directory      | `<Leader>bsr`   |
| Sort buffers by tabs                    | `<Leader>bst`   |
| List all buffers with JABS              | \`              |

</p>
</details>

<details><summary><code>Git</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Git status                              | `<Leader>gs`    |
| Git add                                 | `<Leader>ga`    |
| Git commit                              | `<Leader>gc`    |
| Git push                                | `<Leader>gp`    |
| Git pull                                | `<Leader>gP`    |
| Git log                                 | `<Leader>gl`    |
| Git diff                                | `<Leader>gd`    |
| Lazy Git                                | `<Leader>gL`    |
| Lazy Git Filter                         | `<Leader>gf`    |

</p>
</details>

<details><summary><code>Translate</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Show the translation in the cmd line    | `<Leader>Rt`    |
| Show the translation in a pop-up        | `<Leader>Rw`    |
| Convert the word to the translated word | `<Leader>Rr`    |

</p>
</details>

<details><summary><code>LaTeX</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Clean                                   | `<Leader>lll`   |
| Clean Cache                             | `<Leader>llc`   |
| Compile                                 | `<Leader>lcc`   |
| Compile and show output                 | `<Leader>lco`   |
| Compile and show SS                     | `<Leader>lcs`   |
| Compile selected                        | `<Leader>lce`   |
| Reload                                  | `<Leader>lrr`   |
| Reload state                            | `<Leader>lrs`   |
| Stop                                    | `<Leader>lop`   |
| Stop all                                | `<Leader>loa`   |
| Show TOC                                | `<Leader>ltt`   |
| Show context menu                       | `<Leader>lm`    |
| Count letters                           | `<Leader>lu`    |
| Count words                             | `<Leader>lw`    |
| Document package                        | `<Leader>ld`    |
| Errors                                  | `<Leader>le`    |
| Status                                  | `<Leader>ls`    |
| View pdf                                | `<Leader>vl`    |
| Info                                    | `<Leader>li`    |

</p>
</details>

<details><summary><code>Markdown</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Preview markdown                        | `<Leader>mp`    |

</p>
</details>

<details><summary><code>Table</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Toggle table mode                       | `<Leader>tt`    |
| Delete row                              | `<Leader>tdd`   |
| Delete column                           | `<Leader>tdc`   |
| Insert column                           | `<Leader>tic`   |
| Add formula                             | `<Leader>tfa`   |
| Evaluate the formula on the current row | `<Leader>tfe`   |
| Get cell info                           | `<Leader>tn`

</p>
</details>

<details><summary><code>Telescope</code></summary>
<p>
  
| Function                                | Keybind         |
| --------------------------------------- | --------------- |
| Find files                              | `<Leader>fff`   |
| Find files using a file browser         | `<Leader>ffb`   |
| Git status                              | `<Leader>fgs`   |
| Git commits                             | `<Leader>fgc`   |
| Git branches                            | `<Leader>fgb`   |
| Git stash                               | `<Leader>fgt`   |
| Look through old files                  | `<Leader>fo`    |
| Go through the colorschemes             | `<Leader>fc`    |
| Go through buffers                      | `<Leader>fb`    |
| Go through commands                     | `<Leader>fm`    |
| Go through the QuickFix list            | `<Leader>fq`    |
| Do a live grep                          | `<Leader>fl`    |
| Go through marks                        | `<Leader>fm`    |
| Go through projects                     | `<Leader>fp`    |

</p>
</details>

<details><summary><code>Debugging</code></summary>
<p>

| Function               | Keybind      |
| ---------------------- | ------------ |
| Start debug session    | `<Leader>ds` |
| Conditional breakpoint | `<Leader>dC` |
| Toggle breakpoint      | `<Leader>db` |
| Toggle UI              | `<Leader>dU` |
| Continue               | `<Leader>dc` |
| Step back              | `<Leader>db` |
| Step into              | `<Leader>di` |
| Step over              | `<Leader>do` |
| Step out               | `<Leader>du` |
| Run to cursor          | `<Leader>dR` |
| Hover variable         | `<Leader>dh` |
| Get session            | `<Leader>dg` |
| Evaluate               | `<Leader>de` |
| Evaluate input         | `<Leader>dE` |
| Toggle repl            | `<Leader>dr` |
| Scopes                 | `<Leader>dS` |
| Pause                  | `<Leader>dp` |
| Disconnect             | `<Leader>dd` |
| Quit                   | `<Leader>dq` |
| Terminate              | `<Leader>dx` |

</p>
</details>

<details><summary><code>LSP</code></summary>
<p>
  
| Function                                 | Keybind         |
| ---------------------------------------- | --------------- |
| Go to definition                         | `<Leader>sdd`   |
| Show references                          | `<Leader>sdr`   |
| Get type definition                      | `<Leader>sdt`   |
| Show definition preview in pop-up window | `<Leader>sdp`   |
| Add workspace                            | `<Leader>swa`   |
| Remove workspace                         | `<Leader>swr`   |
| Show documentation                       | `<Leader>sh`    |
| Show code actions                        | `<Leader>sc`    |
| Show line diagnostics                    | `<Leader>se`    |
| Show QuickFix list                       | `<Leader>sq`    |
| Format                                   | `<Leader>sf`    |
| Rename                                   | `<Leader>sr`    |
| Go to implementation                     | `<Leader>si`    |
| Go to next diagnostic                    | `<Leader>sj`    |
| Go to prev diagnostic                    | `<Leader>sk`    |
| Close all windows                        | `<Leader>sC`    |

</p>
</details>

# Config File

This is just a quick setup. For a complete guide on configuring DeathVim,
please read the [wiki](https://github.com/SingularisArt/DeathVim/wiki) page.

Paste the following content in the `~/.config/dvim/lua/config.lua` file.

```lua
-- For a quickstart guide, please see:
-- https://github.com/SingularisArt/DeathVim/#config-file for a quickstart
-- For more indepth explanation, please see:
-- https://github.com/SingularisArt/DeathVim/wiki/Modifying-the-config.lua-file

------------------------------------------------------------------------
--                              General                               --
------------------------------------------------------------------------

dvim.colorscheme = "rose-pine"
dvim.format_on_save = false

------------------------------------------------------------------------
--                                Logging                             --
------------------------------------------------------------------------

-- The level of logging.
-- Possible values: "trace", "debug", "info", "warn", "error", "fatal"
dvim.log.level = "trace"
-- The file to log to. Default is ~/.cache/dvim/dvim.log
dvim.log.out_file = get_cache_dir() .. "/dvim.log"

------------------------------------------------------------------------
--                              Builtin                               --
------------------------------------------------------------------------

-----------------------
--  Builtin Plugins  --
-----------------------

-- After changing plugin config exit and reopen DeathVim, then
-- Run :PackerSync to reload the plugins.
dvim.builtin.plugins.alpha.active = true
dvim.builtin.plugins.alpha.mode = "dashboard"
dvim.builtin.plugins.indent_blankline.active = true
dvim.builtin.plugins.symbols_outline.active = true
dvim.builtin.plugins.which_key.active = true
dvim.builtin.plugins.gitsigns.active = true
dvim.builtin.plugins.comment.active = true
dvim.builtin.plugins.todo_comments.active = true
dvim.builtin.plugins.terminal.active = true
dvim.builtin.plugins.dap.active = true
dvim.builtin.plugins.ultisnips.active = true
dvim.builtin.plugins.telescope.active = true
dvim.builtin.plugins.project.active = true
dvim.builtin.plugins.copilot.active = true
dvim.builtin.plugins.cmp.active = true
dvim.builtin.plugins.autopairs.active = true
dvim.builtin.plugins.nvimtree.active = true
dvim.builtin.plugins.lualine.active = true
dvim.builtin.plugins.staline.active = true
dvim.builtin.plugins.bufferline.active = true
dvim.builtin.plugins.notify.active = true
dvim.builtin.plugins.treesitter.active = true
dvim.builtin.plugins.folds.active = true

-------------------------
--  Builtin Filetypes  --
-------------------------

-- This is an important list. If you disable a filetype, DeathVim will disable
-- the following for you:
--  It's LSP
--  It's formatter
--  It's diagnostic
--  It's TreeSitter parser
--  It's plugins
-- So, instead of you going through each of those items and disabling them, you
-- can just disable the filetype.
-- After modifying this list, exit and reopen DeathVim, then run :PackerSync.
dvim.builtin.filetypes.lua.active = true
dvim.builtin.filetypes.vim.active = true
dvim.builtin.filetypes.python.active = true
dvim.builtin.filetypes.cpp.active = true
dvim.builtin.filetypes.cmake.active = true
dvim.builtin.filetypes.c.active = true
dvim.builtin.filetypes.c_sharp.active = true
dvim.builtin.filetypes.sql.active = true
dvim.builtin.filetypes.html.active = true
dvim.builtin.filetypes.css.active = true
dvim.builtin.filetypes.javascript.active = true
dvim.builtin.filetypes.typescript.active = true
dvim.builtin.filetypes.php.active = true
dvim.builtin.filetypes.ruby.active = true
dvim.builtin.filetypes.perl.active = true
dvim.builtin.filetypes.java.active = true
dvim.builtin.filetypes.rust.active = true
dvim.builtin.filetypes.solidity.active = true
dvim.builtin.filetypes.go.active = true
dvim.builtin.filetypes.bash.active = true
dvim.builtin.filetypes.log.active = true
dvim.builtin.filetypes.latex.active = true
dvim.builtin.filetypes.markdown.active = true
dvim.builtin.filetypes.yaml.active = true
dvim.builtin.filetypes.json.active = true
dvim.builtin.filetypes.toml.active = true
dvim.builtin.filetypes.tmux.active = true

-----------------------
--  Builtin Actions  --
-----------------------

dvim.builtin.actions.writing.active = true
dvim.builtin.actions.note_taking.active = true
dvim.builtin.actions.programming.active = true
dvim.builtin.actions.presentation.active = true
dvim.builtin.actions.documentation.active = true

------------------------------------------------------------------------
--                            Keymappings                             --
------------------------------------------------------------------------

-------------
--  Setup  --
-------------

dvim.leader = " "

-----------------------
--  Add Keymappings  --
-----------------------

dvim.keys.normal_mode["<C-s>"] = ":w<cr>"
dvim.keys.normal_mode["<C-f>"] =
":silent exec '!inkscape-figures edit \"'.b:vimtex.root.'/figures/\" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>"
dvim.keys.insert_mode["<C-f>"] =
"<Esc>:silent exec '.!inkscape-figures create \"'.getline('.').'\" \"'.b:vimtex.root.'/figures/\"'<CR>"

--------------------------
--  Remove Keymappings  --
--------------------------

-- Ctrl+a highlights everything
dvim.keys.normal_mode["<C-a>"] = ""

--------------------------
--  Which Key Bindings  --
--------------------------

-- Ignore this. If you remove this, then a whole ton of shit starts to happen
-- and this is the easiest way to fix it.
dvim.builtin.plugins.which_key.user_vmappings = {}
dvim.builtin.plugins.which_key.user_mappings = {}

dvim.builtin.plugins.which_key.user_vmappings = {}
dvim.builtin.plugins.which_key.user_mappings["r"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

------------------------------------------------------------------------
--                         Modifying Plugins                          --
------------------------------------------------------------------------

------------------
--  Statusline  --
------------------

-- Possible values: "staline", "lualine"
dvim.statusline = "lualine"
-- Possible values: "evil", "normal", "pebble", "simple", "simpler"
dvim.builtin.plugins.staline.mode = "evil"
-- Possible values: "evil", "bubbles", "slanted"
dvim.builtin.plugins.lualine.theme = "pywal" -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
dvim.builtin.plugins.lualine.mode = "evil"

-----------------
--  Telescope  --
-----------------

-- Extensions
dvim.builtin.plugins.telescope.extensions.active = true
dvim.builtin.plugins.telescope.extensions.file_browser.active = true
dvim.builtin.plugins.telescope.extensions.project.active = true
dvim.builtin.plugins.telescope.extensions.notify.active = true
dvim.builtin.plugins.telescope.extensions.media_files.active = true
dvim.builtin.plugins.telescope.extensions.vim_bookmarks.active = true
dvim.builtin.plugins.telescope.extensions.symbols.active = true

-------------------
--  Tree Sitter  --
-------------------

dvim.builtin.plugins.treesitter.ensure_installed = {
  "lua",
  "vim",
  "python",
  "cpp",
  "cmake",
  "c",
  "c_sharp",
  "sql",
  "html",
  "css",
  "javascript",
  "typescript",
  "php",
  "ruby",
  "perl",
  "java",
  "rust",
  "solidity",
  "go",
  "bash",
  "yaml",
  "json",
  "toml",
}
dvim.builtin.plugins.treesitter.ignore_install = {
  "markdown",
  "latex",
}
dvim.builtin.plugins.treesitter.highlight.enable = true
dvim.builtin.plugins.treesitter.highlight.additional_vim_regex_highlighting = false
dvim.builtin.plugins.treesitter.highlight.disable = {
  "markdown",
  "latex",
}
dvim.builtin.plugins.treesitter.autopairs.enable = true
dvim.builtin.plugins.treesitter.autopairs.disable = {
  "markdown",
  "latex",
}
dvim.builtin.plugins.treesitter.context_commentstring.enable = true
dvim.builtin.plugins.treesitter.context_commentstring.enable_autocmd = false
dvim.builtin.plugins.treesitter.indent.enable = true
dvim.builtin.plugins.treesitter.indent.disable = {
  "markdown",
  "latex",
}

dvim.builtin.plugins.treesitter.autotag.enable = true

dvim.builtin.plugins.treesitter.textobjects.swap.enable = true
dvim.builtin.plugins.treesitter.textobjects.select.enable = true
dvim.builtin.plugins.treesitter.textobjects.move.enable = true
dvim.builtin.plugins.treesitter.textobjects.move.set_jumps = true

dvim.builtin.plugins.treesitter.textsubjects.enable = true

dvim.builtin.plugins.treesitter.playground.enable = true
dvim.builtin.plugins.treesitter.playground.disable = {
  "",
}

dvim.builtin.plugins.treesitter.rainbow.enable = true
dvim.builtin.plugins.treesitter.rainbow.extended_mode = true
dvim.builtin.plugins.treesitter.rainbow.max_file_lines = 1000
dvim.builtin.plugins.treesitter.rainbow.disable = {
  "html",
}

-----------------
--  Which Key  --
-----------------

dvim.builtin.plugins.which_key.marks = true
dvim.builtin.plugins.which_key.presets.operators = true
dvim.builtin.plugins.which_key.presets.motions = true
dvim.builtin.plugins.which_key.presets.text_objects = true
dvim.builtin.plugins.which_key.presets.nav = true
dvim.builtin.plugins.which_key.presets.z = true
dvim.builtin.plugins.which_key.presets.g = true
dvim.builtin.plugins.which_key.spelling.enabled = true
dvim.builtin.plugins.which_key.spelling.suggestions = 20

-----------------
--  Git Signs  --
-----------------

-- Show the git commit message on the line
dvim.builtin.plugins.gitsigns.line_blame = true

------------------------------------------------------------------------
--                                LSP                                 --
------------------------------------------------------------------------

-------------
-- General --
-------------

dvim.lsp.active = true

-----------------
--  Lsp Lines  --
-----------------

dvim.lsp.lsp_lines = false

------------------------
--  Language Servers  --
------------------------

-- This list depends on the filetypes list. Don't remove any of the items. Only
-- add new ones and if you want to disable a filetype, set it to false in the
-- filetypes list from above.
dvim.lsp.language_servers = {
  { server = "sumneko_lua", filetype = "lua" },
  { server = "vimls", filetype = "vim" },
  { server = "texlab", filetype = "latex" },
  { server = "pylsp", filetype = "python" },
  { server = "bashls", filetype = "bash" },
  { server = "clangd", filetype = "cpp" },
  { server = "cmake", filetype = "cmake" },
  { server = "html", filetype = "html" },
  { server = "emmet_ls", filetype = "html" },
  { server = "cssls", filetype = "css" },
  { server = "tailwindcss", filetype = "css" },
  { server = "jsonls", filetype = "json" },
  { server = "rust_analyzer", filetype = "rust" },
  { server = "solang", filetype = "solidity" },
  { server = "solc", filetype = "solidity" },
  { server = "golangci_lint_ls", filetype = "go" },
  { server = "tsserver", filetype = "javascript" },
  { server = "jdtls", filetype = "java" },
  { server = "yamlls", filetype = "yaml" },
}

-- If you don't have a server installed for a filetype, DeathVim will try to
-- install it for you, but it isn't perfect. Always check the log file
-- (~/.config/dvim/log.log) to see if it succeded or failed.
dvim.lsp.automatic_servers_installation = true

----------------
-- Formatters --
----------------

-- This list depends on the filetypes list. Don't remove any of the items. Only
-- add new ones and if you want to disable a filetype, set it to false in the
-- filetypes list from above.
dvim.lsp.formatters = {
  {
    formatter = "black",
    extra_args = { "--fast" },
    filetype = "python",
  },
  {
    formatter = "clang_format",
    filetype = "cpp",
  },
  {
    formatter = "latexindent",
    filetype = "latex",
  },
  {
    formatter = "prettier",
    extra_args = { "--single-quote", "--jsx-single-quote" },
    filetype = "javascript",
  },
  {
    formatter = "rustfmt",
    filetype = "rust",
  },
  {
    formatter = "sql_formatter",
    filetype = "sql",
  },
  {
    formatter = "standardrb",
    extra_args = { "--fix", "--format", "quiet", "--stderr", "--stdin", "$FILENAME" },
    filetype = "ruby",
  },
  {
    formatter = "stylua",
    filetype = "lua",
  },
  {
    formatter = "google_java_format",
    filetype = "java",
  },
  {
    formatter = "shellharden",
    filetype = "bash",
  },
}

-- If you don't have a formatter installed for a filetype, DeathVim will try to
-- install it for you, but it isn't perfect. Always check the log file
-- (~/.config/dvim/log.log) to see if it succeded or failed.
dvim.lsp.automatic_formatters_installation = true

-----------------
-- Diagnostics --
-----------------

-- This list depends on the filetypes list. Don't remove any of the items. Only
-- add new ones and if you want to disable a filetype, set it to false in the
-- filetypes list from above.
dvim.lsp.diagnostics = {
  {
    diagnostic = "flake8",
    filetype = "python",
  },
  {
    diagnostic = "cppcheck",
    filetype = "cpp",
  },
  {
    diagnostic = "write_good",
    filetype = "latex",
  },
}

-- If you don't have a diagnostic installed for a filetype, DeathVim will try
-- to install it for you, but it isn't perfect. Always check the log file
-- (~/.config/dvim/log.log) to see if it succeded or failed.
dvim.lsp.automatic_diagnostics_installation = true

-----------
-- Hover --
-----------

dvim.lsp.hovers = {
  { hover = "dictionary" },
}

-----------------
-- Code Action --
-----------------

dvim.lsp.code_actions = {
  { code_action = "gitsigns" },
  { code_action = "gitrebase" },
}

----------------
-- Completion --
----------------

dvim.lsp.completions = {
  { completion = "spell" },
}

------------------------------------------------------------------------
--                    Individual Filetype Settings                    --
------------------------------------------------------------------------

-- Here is where you put each speific settings for each filetype.

dvim.builtin.filetypes.latex.settings = {
  wrap = true,
  spell = true,
}

dvim.builtin.filetypes.markdown.settings = {
  wrap = true,
  spell = true,
}

------------------------------------------------------------------------
--                         Additional Plugins                         --
------------------------------------------------------------------------

-- Add any additional plugins you may want
dvim.plugins = {
  "folke/trouble.nvim",
  "tjdevries/express_line.nvim",
}

------------------------------------------------------------------------
--                           Auto Commands                            --
------------------------------------------------------------------------

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

------------------------------------------------------------------------
--                            Vim Commands                            --
------------------------------------------------------------------------

dvim.vim_commands = {
  { command = "set rtp+=~/Documents/school-notes/current-course" },
}
```

# Credit

Huge shoutout to the follwing people and organizations:

- [LunarVim](https://github.com/LunarVim/LunarVim): I used a ton of their code
  and their project structure. Without them, it would've probebly would've
  taken me 5 months to start this project.
- [Christian Chiarulli](https://github.com/ChristianChiarulli/): He inspired me
  to create this project with his NeoVim from Scratch and Making NeoVim an IDE
  series.
- [Gideon Wolfe](https://github.com/GideonWolfe): I also borrowed some of his
  code and his idea from his `vim.reaper` project.
- [Sweet_Ad6090](https://www.reddit.com/user/Sweet_Ad6090/): He's the skilled
  man who created the logo for me. If you need any logo designing, he's your
  guy. Send him a message through reddit, and he's be happy to help you out.

# TODO

## Completed

- [x] Setup NeoVim for taking notes in **LaTeX**.
- [x] Add git signs in the gutter area.
- [x] Add snippets.
- [x] Add **requirements** to **README.md**.
- [x] Get completion using either **Native LSP** or **COC**.
- [x] Add **features** to **README.md**.
- [x] Add TabNine.
- [x] Add GitHub copilot.
- [x] Patch up the installation script.

## Working on

- [ ] Work on the documentation.
- [ ] Get more screenshots.
- [ ] Configure the following plugins:
  - [undotree](https://github.com/mbbill/undotree)
  - [nvim-scrollview](https://github.com/dstein64/nvim-scrollview)
  - [pretty-fold.nvim](https://github.com/anuvyklack/pretty-fold.nvim)
  - [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
  - [venn.nvim](https://github.com/jbyuki/venn.nvim)
  - [zen-mode.nvim](https://github.com/folke/zen-mode.nvim)
  - [twilight.nvim](https://github.com/folke/twilight.nvim)
  - [vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc)
  - [vim-grammarous](https://github.com/rhysd/vim-grammarous)
  - [vim-LanguageTool](https://github.com/dpelle/vim-LanguageTool)
  - [LanguageTool.nvim](https://github.com/vigoux/LanguageTool.nvim)
  - [vim-pencil](https://github.com/preservim/vim-pencil)
  - [HighStr.nvim](https://github.com/Pocco81/HighStr.nvim)
  - [lookatme](https://github.com/d0c-s4vage/lookatme) NOTE: This isn't a plugin, it's something that I want to incorperate into DeathVim.

## Need to do
