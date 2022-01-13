vim.cmd [[set completeopt=menuone,noinsert,noselect]]

local cmp = require('cmp')
local lspkind = require('lspkind')

Vscode = vim.lsp.protocol.make_client_capabilities()

local source_mapping = {
  nvim_lsp        = '[LSP]',
  nvim_lua        = '[api]',
  latex_symbols   = '[latex]',
  ultisnips       = '[snip]',
  cmp_tabnine     = '[tab]',
  calc            = '[calc]',
  gh_issues       = '[issues]',
  path            = '[path]',
  buffer          = '[buf]',
  emoji           = '[emoji]',
  tags            = '[tag]',
  cmp_pandoc      = '[pandoc]',
  greek           = '[greek]',
  vimwiki_tags    = '[wiki]',
  spell           = '[spell]',
  zsh             = '[zsh]',
}

Capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
Vscode.textDocument.completion.completionItem.snippetSupport = true

cmp.setup({
  snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
         vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        --require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      end,
  },

  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-x>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp'       },
    { name = 'nvim_lua'       },
    { name = 'latex_symbols'  },
    { name = 'ultisnips'      },
    { name = 'cmp_tabnine'    },
    { name = 'calc'           },
    { name = 'gh_issues'      },
    { name = 'path'           },
    { name = 'buffer'         },
    { name = 'emoji'          },
    { name = 'tags'           },
    { name = 'cmp_pandoc'     },
    { name = 'greek'          },
    { name = 'vimwiki_tags'   },
    { name = 'spell'          },
    { name = 'zsh'            },
  }),

  experimental = {
    native_menu = false,
    ghost_text = true,
  },

  formatting = {
    format = function(entry, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind]
        local menu = source_mapping[entry.source.name]
        if entry.source.name == 'cmp_tabnine' then
          if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
            menu = entry.completion_item.data.detail .. ' ' .. menu
          end
          vim_item.kind = ''
        end
        vim_item.menu = menu
        return vim_item
      end
  },

  sorting = {
      comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.sort_text,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.kind,
          cmp.config.compare.length,
          cmp.config.compare.order,
      },
  },
})

require('cmp_git').setup({})
require('cmp_pandoc').setup({})
require('cmp_zsh').setup { zshrc = true }
require('plugin-configs.cmp_gh')
--require('plugin-configs.cmp_tn')

