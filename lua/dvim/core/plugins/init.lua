local M = {}

M.get_defaults = function()
  return {
    indent_blankline = {
      active = true,
    },
    nvim_tree = {
      active = true,
    },
    nerd_tree = {
      active = true,
    },
    dirvish = {
      active = true,
    },
    colors = {
      active = true,
      document_highlight = {
        mode = "background",
      },
      colorizer = {
        mode = "background",
      },
    },
    symbols_outline = {
      active = true,
    },
    which_key = {
      active = true,
      mappings = {},
      user_vmappings = {},
      user_mappings = {},
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        nav = true,
        z = true,
        g = true,
      },
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      layout = {
        align = "center",
      },
      window = {
        border = "none",
        position = "bottom",
      },
    },
    gitsigns = {
      active = true,
    },
    comment = {
      active = true,
    },
    todo_comments = {
      active = true,
    },
    terminal = {
      active = true,
    },
    dap = {
      active = true,
    },
    ultisnips = {
      active = true,
    },
    telescope = {
      active = true,
      extensions = {
        file_browser = {},
        project = {},
        notify = {},
        vim_bookmarks = {},
        media_files = {},
        symbols = {},
      },
    },
    project = {
      active = true,
    },
    copilot = {
      active = true,
    },
    cmp = {
      active = true,
      extensions = {
        active = true,
        nvim_lsp = {},
        nvim_lua = {},
        cmp_tabnine = {},
        latex_symbols = {},
        ultisnips = {},
        calc = {},
        path = {},
        buffer = {},
        emails = {},
        emoji = {},
        gh_issues = {},
      },
    },
    autopairs = {
      active = true,
    },
    treesitter = {
      active = true,
      ensure_installed = {},
      ignore_install = {},
      highlight = {},
      autopairs = {},
      context_commentstring = {},
      indent = {},
      autotag = {},
      textobjects = {
        swap = {},
        select = {},
        move = {},
      },
      textsubjects = {},
      playground = {},
      rainbow = {},
    },
    bufferline = {
      active = true,
    },
    winbar = {
      active = true,
    },
    neogen = {
      active = true,
    },
  }
end

return M
