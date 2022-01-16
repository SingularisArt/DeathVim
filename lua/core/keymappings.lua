-- Unmap space and enter vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Enter>', '<NOP>', { noremap = true, silent = true })

-- Leader key
vim.g.mapleader = ' '

-- easymotion
vim.api.nvim_set_keymap('n', '<Leader>y', '<Plug>(easymotion-bd-f)', { noremap = true, silent = true })

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>',     '<C-w>h',       { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>',     '<C-w>j',       { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>',     '<C-w>k',       { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>',     '<C-w>l',       { silent = true })

-- tab switch buffer and tab edit
vim.api.nvim_set_keymap('n', '<Tab>',   ':BufferLineCycleNext<CR>',               { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>',               { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-w>',   ':bdelete<CR>',                           { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-t>',   ':tabnew<CR>',                            { noremap = true, silent = true })

-- buffers
vim.api.nvim_set_keymap('n', '<Leader>bp',    ':BufferLinePick<CR>',                      { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bcl',   ':BufferLineCloseLeft<CR>',                 { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bcr',   ':BufferLineCloseRight<CR>',                { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bmn',   ':BufferLineMoveNext<CR>',                  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bmp',   ':BufferLineMovePrev<CR>',                  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bsd',   ':BufferLineSortByDirectory<CR>',           { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bse',   ':BufferLineSortByExtension<CR>',           { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bsr',   ':BufferLineSortByRelativeDirectory<CR>',   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bst',   ':BufferLineSortByTabs<CR>',                { noremap = true, silent = true })

-- move selected line / block of text in visual mode
vim.api.nvim_set_keymap('v', 'K', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'J', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })

-- spell correction
vim.api.nvim_set_keymap('i', '<C-l>', '<C-g>u<Esc>[s1z=`]a<C-g>u', { noremap = true, silent = true })

-- highlight everything
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG',       { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-a>', '<Esc>ggVG',  { noremap = true, silent = true })

-- windows/panes/tabs/buffers
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit<CR>',    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':split<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>o', ':only<CR>',      { noremap = true, silent = true })

-- dashbaord
vim.api.nvim_set_keymap('n', '<Leader>d', ':Dashboard<CR>',        { noremap = true, silent = true })

-- git
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Git<CR>',              { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ga', ':Git add .<CR>',        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', ':Git diff<CR>',         { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gc', ':Git commit<CR>',       { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gp', ':Git push<CR>',         { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gP', ':Git pull<CR>',         { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gl', ':Git log<CR>',          { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gL', ':LazyGit<CR>',          { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gf', ':LazyGitFilter<CR>',    { noremap = true, silent = true })

-- translate
vim.api.nvim_set_keymap('n', '<Leader>rt', ':Translate<CR>',  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rw', ':TranslateW<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rr', ':TranslateR<CR>', { noremap = true, silent = true })

-- vimtex
vim.api.nvim_set_keymap('n', '<Leader>lll', ':VimtexClean<CR>',           { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>llc', ':VimtexCache<CR>',           { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lcc', ':VimtexCompile<CR>',         { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lco', ':VimtexCompileOutput<CR>',   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lcs', ':VimtexCompileSS<CR>',       { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lce', ':VimtexCompileSelected<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lrr', ':VimtexReload<CR>',          { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lrs', ':VimtexReloadState<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lop', ':VimtexStop<CR>',            { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>loa', ':VimtexStopAll<CR>',         { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lto', ':VimtexTocOpen<CR>',         { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ltt', ':VimtexTocToggle<CR>',       { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>lm',  ':VimtexContextMenu<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lu',  ':VimtexCountLetters<CR>',    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lw',  ':VimtexCountWords<CR>',      { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ld',  ':VimtexDocPackage<CR>',      { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>le',  ':VimtexErrors<CR>',          { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ls',  ':VimtexStatus<CR>',          { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>la',  ':VimtexToggleMain<CR>',      { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lv',  ':VimtexView<CR>',            { noremap = true, silent = true })

-- markdown
vim.api.nvim_set_keymap('n', '<Leader>mp', ':MarkdownPreview<CR>', { noremap = true, silent = true })

-- inkscape
vim.api.nvim_set_keymap('i', '<C-f>', '<Esc>:silent exec \'.!inkscape-figures create "\'.getline(\'.\').\'" "\'.b:vimtex.root.\'/figures/"\'<CR>',        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':silent exec \'!inkscape-figures edit "\'.b:vimtex.root.\'/figures/" > /dev/null 2>&1 &\'<CR><CR>:redraw!<CR>',    { noremap = true, silent = true })

-- table
vim.api.nvim_set_keymap('n', '<Leader>tt',  ':TableModeToggle<CR>',   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>taf', ':TableAddFormula<CR>',   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tdr', '<Leader>tdr',            { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tdc', '<Leader>tdc',            { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tic', '<Leader>tic',            { noremap = true, silent = true })

-- package manager
vim.api.nvim_set_keymap('n', '<Leader>pi', ':PackerInstall<CR>',  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pu', ':PackerUpdate<CR>',   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pc', ':PackerClean<CR>',    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pl', ':PackerLoad<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ps', ':PackerSync<CR>',     { noremap = true, silent = true })

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>fff', ':Telescope find_files<CR>',                                                { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ffb', ':lua require("telescope").extensions.file_browser.file_browser()<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fo',  ':Telescope oldfiles<CR>',                                                  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fc',  ':Telescope colorscheme<CR>',                                               { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb',  ':Telescope buffers<CR>',                                                   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fm',  ':Telescope commands<CR>',                                                  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fq',  ':Telescope quick_fix<CR>',                                                 { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fl',  ':Telescope live_grep<CR>',                                                 { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fr',  ':Telescope marks<CR>',                                                     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fp',  ':Telescope projects<CR>',                                                  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgs', ':Telescope git_status<CR>',                                                { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgf', ':Telescope git_files<CR>',                                                 { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgc', ':Telescope git_commits<CR>',                                               { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgb', ':Telescope git_branches<CR>',                                              { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgt', ':Telescope git_stash<CR>',                                                 { noremap = true, silent = true })

-- mini map
vim.api.nvim_set_keymap('n', '<Leader>ic', ':MinimapClose<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>io', ':MinimapOpen<CR>',      { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ir', ':MinimapRefresh<CR>',   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>it', ':MinimapToggle<CR>',    { noremap = true, silent = true })

-- lsp
vim.api.nvim_set_keymap('n', '<Leader>sdd', '<cmd>lua vim.lsp.buf.definition()<CR>',                { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sdf', ':Lspsaga lsp_finder<CR>',                              { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sdr', '<cmd>lua vim.lsp.buf.references()<CR>',                { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sdt', '<cmd>lua vim.lsp.buf.type_definition()<CR>',           { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sdp', ':Lspsaga preview_definition<CR>',                      { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>swa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',      { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>swr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sh',  ':Lspsaga hover_doc<CR>',                               { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sc',  ':Lspsaga code_action<CR>',                             { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>se',  ':Lspsaga show_line_diagnostics<CR>',                   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sq',  ':lua vim.lsp.diagnostic.set_loclist()<CR>',        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sf',  ':Lspsaga format<CR>',                                  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sr',  ':Lspsaga rename<CR>',                                  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>si',  ':Lspsaga implement<CR>',                               { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sk',  ':lua vim.lsp.diagnostic.goto_prev()<CR>',          { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sj',  ':lua vim.lsp.diagnostic.goto_next()<CR>',          { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-d>',       ':ToggleTerm<CR>',                                      { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-d>',       '<C-\\><C-n>:ToggleTerm<CR>',                           { noremap = true, silent = true })

-- misc
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', { noremap = true })

-- Resize with arrows
vim.api.nvim_set_keymap('n', '<C-Up>',      ':resize -2<CR>',           { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Down>',    ':resize +2<CR>',           { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Left>',    ':vertical resize -2<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Right>',   ':vertical resize +2<CR>',  { noremap = true })

-- config
vim.api.nvim_set_keymap('n', '<Leader>Dc',   ':e ~/.config/nvim/init.lua<CR>',  { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>Df',   ':vertical resize +2<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>Dg',   ':vertical resize +2<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>Dk',   ':vertical resize +2<CR>',  { noremap = true })
