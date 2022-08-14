local M = {}

M.config = function()
  dvim.builtin.plugins.treesitter.setup = {
    on_config_done = nil,
    ensure_installed = { dvim.builtin.plugins.treesitter.ensure_installed },
    ignore_install = { dvim.builtin.plugins.treesitter.ignore_install },
    highlight = {
      enable = dvim.builtin.plugins.treesitter.highlight.enable,
      disable = { dvim.builtin.plugins.treesitter.highlight.disable },
      additional_vim_regex_highlighting = dvim.builtin.plugins.treesitter.highlight.additional_vim_regex_highlighting,
    },
    autopairs = {
      enable = dvim.builtin.plugins.treesitter.autopairs.enable,
      disable = { dvim.builtin.plugins.treesitter.autopairs.disable },
    },
    context_commentstring = {
      enable = dvim.builtin.plugins.treesitter.context_commentstring.enable,
      enable_autocmd = dvim.builtin.plugins.treesitter.context_commentstring.enable_autocmd,
      config = {
        typescript = "// %s",
        css = "/* %s */",
        scss = "/* %s */",
        html = "<!-- %s -->",
        svelte = "<!-- %s -->",
        vue = "<!-- %s -->",
        json = "",
      },
    },
    indent = {
      enable = dvim.builtin.plugins.treesitter.indent.enable,
      disable = { dvim.builtin.plugins.treesitter.indent.disable },
    },
    autotag = { enable = dvim.builtin.plugins.treesitter.autotag.enable },
    textobjects = {
      swap = {
        enable = dvim.builtin.plugins.treesitter.textobjects.swap.enable,
      },
      select = {
        enable = dvim.builtin.plugins.treesitter.textobjects.select.enable,
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["at"] = "@class.outer",
          ["it"] = "@class.inner",
          ["ac"] = "@call.outer",
          ["ic"] = "@call.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["a/"] = "@comment.outer",
          ["i/"] = "@comment.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["as"] = "@statement.outer",
          ["is"] = "@scopename.inner",
          ["aA"] = "@attribute.outer",
          ["iA"] = "@attribute.inner",
          ["aF"] = "@frame.outer",
          ["iF"] = "@frame.inner",
        },
      },
      move = {
        enable = dvim.builtin.plugins.treesitter.textobjects.move.enable,
        set_jumps = dvim.builtin.plugins.treesitter.textobjects.move.set_jumps,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
    },
    textsubjects = {
      enable = dvim.builtin.plugins.treesitter.textsubjects.enable,
      keymaps = {
        ["."] = "textsubjects-smart",
        [";"] = "textsubjects-big",
      },
    },
    playground = {
      enable = dvim.builtin.plugins.treesitter.playground.enable,
      disable = { dvim.builtin.plugins.treesitter.playground.disable },
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
    rainbow = {
      enable = dvim.builtin.plugins.treesitter.rainbow.enable,
      disable = { dvim.builtin.plugins.treesitter.rainbow.disable },
      extended_mode = dvim.builtin.plugins.treesitter.rainbow.extended_mode, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = dvim.builtin.plugins.treesitter.rainbow.max_file_lines, -- Do not enable for files with more than 1000 lines, int
    },
  }
end

M.setup = function()
  M.config()

  -- avoid running in headless mode since it's harder to detect failures
  if #vim.api.nvim_list_uis() == 0 then
    return
  end

  local treesitter = require("nvim-treesitter.configs")
  treesitter.setup(dvim.builtin.plugins.treesitter.setup)
end

return M
