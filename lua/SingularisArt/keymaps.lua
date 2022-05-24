local map = function(key)
  -- get the extra options
  local opts = { noremap = true }
  for i, v in pairs(key) do
    if type(i) == "string" then
      opts[i] = v
    end
  end

  -- basic support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end

-- leader key
vim.g.mapleader = " "

-- Unmap a couple of mappings
map({ "n", "<Space>", "<NOP>" })
map({ "n", "<Tab>", "<NOP>" })
map({ "n", "<C-y>", "<NOP>" })
map({ "n", "<C-e>", "<NOP>" })
map({ "n", "<C-b>", "<NOP>" })
map({ "n", "<C-j>", "<NOP>" })
map({ "n", "<C-k>", "<NOP>" })
map({ "n", "<C-Space>", "<NOP>" })
map({ "n", "<C-s>", "<NOP>" })

-- better window movement
map({ "n", "<C-h>", "<C-w>h" })
map({ "n", "<C-j>", "<C-w>j" })
map({ "n", "<C-k>", "<C-w>k" })
map({ "n", "<C-l>", "<C-w>l" })

-- keep cursor centered when searching and joining lines
map({ "n", "n", "nzzzv" })
map({ "n", "N", "Nzzzv" })
map({ "n", "J", "mzJ`z" })

-- better searching
map({ "n", "<Leader>r", ":%s///g<Left><Left>" })
map({ "n", "<Leader>rc", ":%s///gc<Left><Left><Left>" })
map({ "x", "<Leader>r", ":s///g<Left><Left>" })
map({ "x", "<Leader>rc", ":s///gc<Left><Left><Left>" })

-- undo break points
map({ "i", ",", ",<c-g>u" })
map({ "i", ".", ".<c-g>u" })
map({ "i", "!", "!<c-g>u" })
map({ "i", "?", "?<c-g>u" })

-- resize with arrows
map({ "n", "<C-Up>", ":resize -2<CR>" })
map({ "n", "<C-Down>", ":resize +2<CR>" })
map({ "n", "<C-Left>", ":vertical resize -2<CR>" })
map({ "n", "<C-Right>", ":vertical resize +2<CR>" })

-- cnext and cprev
map({ "n", "<Up>", ":cprev<CR>zzzv" })
map({ "n", "<Right>", ":copen<CR>" })
map({ "n", "<Down>", ":cnext<CR>zzzv" })
map({ "n", "<Left>", ":cclose<CR>" })

-- moving text
map({ "v", "J", ":m '>+1<CR>gv=gv" })
map({ "v", "K", ":m '<-2<CR>gv=gv" })
map({ "n", "<Leader>j", ":m . +1<CR>==" })
map({ "n", "<Leader>k", ":m . -2<CR>==" })

-- windows/panes/tabs/buffers
map({ "n", "<Leader>v", ":vsplit<CR>" })
map({ "n", "<Leader>h", ":split<CR>" })
map({ "n", "<Leader>o", ":only<CR>" })

-- packer mappings
map({ "n", "<Leader>pi", ":PackerInstall" })
map({ "n", "<Leader>pu", ":PackerUpdate" })
map({ "n", "<Leader>pc", ":PackerClean" })
map({ "n", "<Leader>pl", ":PackerLoad" })
map({ "n", "<Leader>ps", ":PackerSync" })
map({ "n", "<Leader>pp", ":PackerProfile" })

-- buffers
map({ "n", "<Leader>bp", ":BufferLinePick<CR>" })
map({ "n", "<Leader>bcl", ":BufferLineCloseLeft<CR>" })
map({ "n", "<Leader>bcr", ":BufferLineCloseRight<CR>" })
map({ "n", "<Leader>bmn", ":BufferLineMoveNext<CR>" })
map({ "n", "<Leader>bmp", ":BufferLineMovePrev<CR>" })
map({ "n", "<Leader>bsd", ":BufferLineSortByDirectory<CR>" })
map({ "n", "<Leader>bse", ":BufferLineSortByExtension<CR>" })
map({ "n", "<Leader>bsr", ":BufferLineSortByRelativeDirectory<CR>" })
map({ "n", "<Leader>bst", ":BufferLineSortByTabs<CR>" })

-- git
map({ "n", "<Leader>gs", ":Git<CR>" })
map({ "n", "<Leader>ga", ":Git add .<CR>" })
map({ "n", "<Leader>gc", ":Git commit<CR>" })
map({ "n", "<Leader>gp", ":Git push<CR>" })
map({ "n", "<Leader>gP", ":Git pull<CR>" })
map({ "n", "<Leader>gl", ":Git log<CR>" })
map({ "n", "<Leader>gd", ":Git diff<CR>" })
map({ "n", "<Leader>gL", ":LazyGit<CR>" })
map({ "n", "<Leader>gf", ":LazyGitFilter<CR>" })

-- translate
map({ "n", "<Leader>Rt", ":Translate<CR>" })
map({ "n", "<Leader>Rw", ":TranslateW<CR>" })
map({ "n", "<Leader>Rr", ":TranslateR<CR>" })

-- vimtex
map({ "n", "<Leader>lll", ":VimtexClean<CR>" })
map({ "n", "<Leader>llc", ":VimtexCache<CR>" })
map({ "n", "<Leader>lcc", ":VimtexCompile<CR>" })
map({ "n", "<Leader>lco", ":VimtexCompileOutput<CR>" })
map({ "n", "<Leader>lcs", ":VimtexCompileSS<CR>" })
map({ "n", "<Leader>lce", ":VimtexCompileSelected<CR>" })
map({ "n", "<Leader>lrr", ":VimtexReload<CR>" })
map({ "n", "<Leader>lrs", ":VimtexReloadState<CR>" })
map({ "n", "<Leader>lop", ":VimtexStop<CR>" })
map({ "n", "<Leader>loa", ":VimtexStopAll<CR>" })
map({ "n", "<Leader>lto", ":VimtexTocOpen<CR>" })
map({ "n", "<Leader>ltt", ":VimtexTocToggle<CR>" })
map({ "n", "<Leader>lm", ":VimtexContextMenu<CR>" })
map({ "n", "<Leader>lu", ":VimtexCountLetters<CR>" })
map({ "n", "<Leader>lw", ":VimtexCountWords<CR>" })
map({ "n", "<Leader>ld", ":VimtexDocPackage<CR>" })
map({ "n", "<Leader>le", ":VimtexErrors<CR>" })
map({ "n", "<Leader>ls", ":VimtexStatus<CR>" })
map({ "n", "<Leader>la", ":VimtexToggleMain<CR>" })
map({ "n", "<Leader>lv", ":VimtexView<CR>" })
map({ "n", "<Leader>li", ":VimtexInfo<CR>" })

-- markdown
map({ "n", "<Leader>mp", ":MarkdownPreview<CR>" })

-- table
map({ "n", "<Leader>tt", ":TableModeToggle<CR>" })
map({ "n", "<Leader>tf", ":TableAddFormula<CR>" })
map({ "n", "<Leader>tn", "<Leader>t?" })
map({ "n", "<Leader>tdr", "<Leader>tdr" })
map({ "n", "<Leader>tdc", "<Leader>tdc" })
map({ "n", "<Leader>tic", "<Leader>tic" })

-- telescope
map({ "n", "<Leader>fff", ":Telescope find_files<CR>" })
map({ "n", "<Leader>ffb", ':lua require("telescope").extensions.file_browser.file_browser()<CR>' })
map({ "n", "<Leader>fgs", ":Telescope git_status<CR>" })
map({ "n", "<Leader>fgf", ":Telescope git_files<CR>" })
map({ "n", "<Leader>fgc", ":Telescope git_commits<CR>" })
map({ "n", "<Leader>fgb", ":Telescope git_branches<CR>" })
map({ "n", "<Leader>fgt", ":Telescope git_stash<CR>" })
map({ "n", "<Leader>fo", ":Telescope oldfiles<CR>" })
map({ "n", "<Leader>fc", ":Telescope colorscheme<CR>" })
map({ "n", "<Leader>fb", ":Telescope buffers<CR>" })
map({ "n", "<Leader>fm", ":Telescope commands<CR>" })
map({ "n", "<Leader>fq", ":Telescope quick_fix<CR>" })
map({ "n", "<Leader>fl", ":Telescope live_grep<CR>" })
map({ "n", "<Leader>fr", ":Telescope marks<CR>" })
map({ "n", "<Leader>fp", ":Telescope projects<CR>" })

-- nvim-dap
map({ "n", "<Leader>dR", ":lua require(dap').run_to_cursor()" })
map({ "n", "<Leader>dE", ":lua require(dapui').eval(vim.fn.input '[Expression] > ')" })
map({ "n", "<Leader>dC", ":lua require(dap').set_breakpoint(vim.fn.input '[Condition] > ')" })
map({ "n", "<Leader>dU", ":lua require(dapui').toggle()" })
map({ "n", "<Leader>db", ":lua require(dap').step_back()" })
map({ "n", "<Leader>dc", ":lua require(dap').continue()" })
map({ "n", "<Leader>dd", ":lua require(dap').disconnect()" })
map({ "n", "<Leader>de", ":lua require(dapui').eval()" })
map({ "n", "<Leader>dg", ":lua require(dap').session()" })
map({ "n", "<Leader>dh", ":lua require(dap.ui.widgets').hover()" })
map({ "n", "<Leader>dS", ":lua require(dap.ui.widgets').scopes()" })
map({ "n", "<Leader>di", ":lua require(dap').step_into()" })
map({ "n", "<Leader>do", ":lua require(dap').step_over()" })
map({ "n", "<Leader>dp", ":lua require(dap').pause.toggle()" })
map({ "n", "<Leader>dq", ":lua require(dap').close()" })
map({ "n", "<Leader>dr", ":lua require(dap').repl.toggle()" })
map({ "n", "<Leader>ds", ":lua require(dap').continue()" })
map({ "n", "<Leader>dt", ":lua require(dap').toggle_breakpoint()" })
map({ "n", "<Leader>dx", ":lua require(dap').terminate()" })
map({ "n", "<Leader>du", ":lua require(dap').step_out()" })

-- lsp
map({ "n", "<Leader>sdd", ":lua vim.lsp.buf.definition()<CR>" })
map({ "n", "<Leader>sdr", ":lua vim.lsp.buf.references()<CR>" })
map({ "n", "<Leader>sdt", ":lua vim.lsp.buf.type_definition()<CR>" })
map({ "n", "<Leader>sdp", ":lua require('goto-preview').goto_preview_definition()<CR>" })
map({ "n", "<Leader>swa", ":lua vim.lsp.buf.add_workspace_folder()<CR>" })
map({ "n", "<Leader>swr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>" })
map({ "n", "<Leader>sh", ":lua vim.lsp.buf.hover()<CR>" })
map({ "n", "<Leader>sc", ":lua vim.lsp.buf.code_action()<CR>" })
map({ "n", "<Leader>se", ":lua vim.diagnostic.open_float()<CR>" })
map({ "n", "<Leader>sq", ":lua vim.lsp.diagnostic.set_loclist()<CR>" })
map({ "n", "<Leader>sf", ":lua vim.lsp.buf.formatting()<CR>" })
map({ "n", "<Leader>sr", ":Lspsaga rename<CR>" })
map({ "n", "<Leader>si", ":lua require('goto-preview').goto_preview_implementation()<CR>" })
map({ "n", "<Leader>sj", ":lua vim.diagnostic.goto_next()<CR>" })
map({ "n", "<Leader>sk", ":lua vim.diagnostic.goto_prev()<CR>" })
map({ "n", "<Leader>sC", ":lua require('goto-preview').close_all_win()<CR>" })

-- github copilot
vim.cmd([[
  imap <silent><script><expr> <Right> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
]])

-- other
map({ "n", "<C-s>", ":write | lua vim.lsp.buf.formatting_sync()<CR>" }) -- Format
map({ "n", "<Leader>y", "<Plug>(easymotion-bd-f)" }) -- Easymotion
map({ "n", "<Leader>e", ":NvimTreeToggle<CR>" }) -- Toggle NvimTree
map({ "n", "<Leader>u", ":SymbolsOutline<CR>" }) -- Togle SymbolsOutline
map({ "n", "<C-w>", ":bdelete<CR>" }) -- Delete a buffer
map({ "n", "<C-t>", ":tabnew<CR>" }) -- Create a buffer
map({ "i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u" }) -- Fix spelling mistake
map({ "n", "<C-a>", "ggVG" }) -- Highlight everything
map({ "i", "<C-a>", "<Esc>ggVG" }) -- Highlight everything
map({ "n", ";", ":nohl<CR>" }) -- Un-highlight everything
map({ "i", "<C-BS>", "<C-W>" }) -- Delete a whole word by using Ctrl+Backspace
